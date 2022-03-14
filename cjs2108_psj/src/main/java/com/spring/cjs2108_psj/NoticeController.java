package com.spring.cjs2108_psj;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.cjs2108_psj.service.NoticeService;
import com.spring.cjs2108_psj.vo.NoticeVO;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	String msgFlag = "";
	
	@Autowired
	NoticeService noticeService;
	
	// 공지사항 리스트
	@RequestMapping(value="/noticeAdmin", method = RequestMethod.GET)
	public String noticeAdminGet(
				@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
				@RequestParam(name="pageSize", defaultValue = "5", required = false) int pageSize,
				Model model) {
			
		int totRecCnt = noticeService.totRecCnt();// 전체자료 갯수 검색
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
		int startIndexNo = (pag - 1) * pageSize; 
		int curScrStartNo = totRecCnt - startIndexNo;	
		int blockSize = 3; 
	    int curBlock = (pag - 1) / blockSize;	
	    int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
	    List<NoticeVO> vos = noticeService.getNoticeAdmin(startIndexNo, pageSize);
		model.addAttribute("vos", vos);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totPage", totPage);
		model.addAttribute("curScrStartNo", curScrStartNo);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("curBlock", curBlock);
		model.addAttribute("lastBlock", lastBlock);
		return "admin/notice/noticeAdmin";
	}
	
	// 공지사항 등록폼 호출
	@RequestMapping(value="/noticeInput", method = RequestMethod.GET)
	public String noticeInputGet() {
		return"admin/notice/noticeInput";
	}
	
	// 공지사항 입력후 DB저장
	@RequestMapping(value="/noticeInput", method = RequestMethod.POST)
	public String noticeInputPost(NoticeVO vo) {
		// 이미지 파일 업로드시에는 ckeditor폴더에서 board폴더로 복사 작업처리
		noticeService.imgCheck(vo.getContent());
		// 이미지 복사 작업이 종료되면 실제로 저장된 board폴더명을 DB에 저장시켜줘야한다
		vo.setContent(vo.getContent().replace("/data/ckeditor/", "/data/ckeditor/notice/"));
		// 이미지 작업과 실제저장폴더를 set처리후, 잘 정비된 vo를 db에 저장한다
		noticeService.setBoardInput(vo);
		return"redirect:/msg/noticeInputOk";
	}
	
	// 공지사항 내용보기
	@RequestMapping(value="/noticeContent", method = RequestMethod.GET)
	public String noticeContentGet(int idx, int pag, int pageSize, Model model) {
		// 원본글 가져오기
		NoticeVO vo= noticeService.getNoticeContent(idx);
		// 이전글, 다음글 가져오기
		List<NoticeVO> pnVos = noticeService.getPreNext(idx);
		model.addAttribute("pnVos", pnVos);
		model.addAttribute("vo", vo);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		return"admin/notice/noticeContent";
	}
	
	@ResponseBody
	@RequestMapping("/imageUpload")
	public void imageUploadGet(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String originalFilename = upload.getOriginalFilename();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		originalFilename = sdf.format(date) + "_" + originalFilename;
		byte[] bytes = upload.getBytes();
		// ckeditor에서 올린 파일을 서버 파일시스템에 저장시켜준다
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/ckeditor/");
		OutputStream outStr = new FileOutputStream(new File(uploadPath + originalFilename));
		outStr.write(bytes);
		// 서버 파일시스템에 저장된 파일을 화면(textarea)에 출력하기
		PrintWriter out = response.getWriter();
		String fileUrl = request.getContextPath() + "/data/ckeditor/" + originalFilename;
		out.println("{\"originalFilename\":\""+originalFilename+"\",\"uploaded\":1,\"url\":\""+fileUrl+"\"}");		/*  "atom":"111.png","uploaded":1,"url":""  */
		out.flush();
		outStr.close();
	}
	
	//수정폼 불러오기
	@RequestMapping(value="/noticeUpdate",method = RequestMethod.GET)
	public String noticeUpdateGet(Model model, int idx, int pag,
			@RequestParam(name="pageSize", defaultValue="5", required=false) int pageSize) {
		NoticeVO vo = noticeService.getNoticeContent(idx);
		// 수정작업 처리전에 그림파일이 존재한다면 원본파일을 ckeditor폴더로 복사 시켜둔다.
		if(vo.getContent().indexOf("src=\"/") != -1) noticeService.imgCheckUpdate(vo.getContent());
		model.addAttribute("vo", vo);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		return "admin/notice/noticeUpdate";
	}
	
	// 수정내용 DB에 저장하기
	@RequestMapping(value="/noticeUpdate",method = RequestMethod.POST)
	public String boardUpdatePost(NoticeVO vo, int pag,
			@RequestParam(name="pageSize", defaultValue="5", required=false) int pageSize) {
		// 원본파일들을 board폴더에서 삭제처리한다.
		if(vo.getOriContent().indexOf("src=\"/") != -1)	noticeService.imgDelete(vo.getOriContent());
		// 원본파일을 수정폼에 들어올때 board폴더에서 ckeditor폴더로 복사해두고, board폴더의 파일은 지웠기에, 아래의 복사처리전에 원본파일위치를 vo.content안의 파일경로를 board폴더에서 ckeditor폴더로 변경처리해줘야한다.
		vo.setContent(vo.getContent().replace("/data/ckeditor/notice/", "/data/ckeditor/"));
		// 수정된 그림파일을 다시 복사처리한다.(수정된 그림파일의 정보는 content필드에 담겨있다.)('/ckeditor'폴더 -> '/ckeditor/board'폴더로복사) : 처음파일 입력작업과 같은 작업이기에 아래는 처음 입력시의 메소드를 호출했다.
		noticeService.imgCheck(vo.getContent());
		// 필요한 파일을 board폴더로 복사했기에 vo.content의 내용도 변경한다.
		vo.setContent(vo.getContent().replace("/data/ckeditor/", "/data/ckeditor/notice/"));
		// 잘 정비된 vo값만을 DB에 저장시킨다.
		noticeService.setNoticeUpdate(vo);
		msgFlag = "noticeUpdateOk$idx="+vo.getIdx()+"&pag="+pag+"&pageSize="+pageSize;
		return "redirect:/msg/" + msgFlag;
	}
	
	//게시글 삭제처리
	@RequestMapping(value="/noticeDelete")
	public String noticeDeleteGet(int idx,int pag, int pageSize) {
		// 게시글에 사진이 존재한다면 실제 서버파일 시스템에서 사진파일을 삭제처리한다
		NoticeVO vo = noticeService.getNoticeContent(idx);
		if(vo.getContent().indexOf("src=\"/") != -1)	noticeService.imgDelete(vo.getContent());
		// DB애서 실제 게시글을 삭제처리
		noticeService.setNoticeServiceDelete(idx);
		msgFlag = "noticeDeleteOk$pag="+pag+"&pageSize="+pageSize;
		return "redirect:/msg/" + msgFlag;
	}
	
	//선택항목 삭제하기
	@ResponseBody
	@RequestMapping(value="/noticeListDel", method = RequestMethod.POST)
	public String questionListDelPost(String delItems) {
		String[] idxs = delItems.split("/");
		for(String idx : idxs) {
			noticeService.setNoticeDelete(Integer.parseInt(idx));
		}
		return"";
	}
	//선택항목 공지변경
	@ResponseBody
	@RequestMapping(value="/noticeListAnser", method = RequestMethod.GET)
	public String questionListAnserPost(String anserItems, int notice) {
		String[] idxs = anserItems.split("/");
		for(String idx : idxs) {
			noticeService.setNoticeLevel(Integer.parseInt(idx), notice);
		}
		return"";
	}
}
