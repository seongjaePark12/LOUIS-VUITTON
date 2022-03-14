package com.spring.cjs2108_psj;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import com.spring.cjs2108_psj.service.SupportService;
import com.spring.cjs2108_psj.vo.MemberVO;
import com.spring.cjs2108_psj.vo.NoticeVO;
import com.spring.cjs2108_psj.vo.QuestionVO;
import com.spring.cjs2108_psj.vo.QuestionReplyVO;

@Controller
@RequestMapping("/support")
public class SupportController {
	String msgFlag="";
	
	@Autowired
	SupportService supportService;
	
	// 자주하는질문 폼 호출
	@RequestMapping(value="/simple", method = RequestMethod.GET)
	public String simpleGet(Model model,
			@RequestParam(name="what", defaultValue="", required=false) String what){
	  ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
	  vos = supportService.simpleGet(what);
	  model.addAttribute("vos",vos);
	  model.addAttribute("what", what);
	  return "support/simple/simple";
	}
	
	// 공지사항 리스트
	@RequestMapping("/notice")
	public String noticeAdminGet(
				@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
				@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
				Model model) {
		int totRecCnt = supportService.totRecCnt();// 전체자료 갯수 검색
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
		int startIndexNo = (pag - 1) * pageSize; 
		int curScrStartNo = totRecCnt - startIndexNo;	
		int blockSize = 3; 
	    int curBlock = (pag - 1) / blockSize;	
	    int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
	    List<NoticeVO> vos = supportService.getNoticeAdmin(startIndexNo, pageSize);
	    List<NoticeVO> novos = supportService.getNoticeAdmin1(startIndexNo, pageSize);
		model.addAttribute("vos", vos);
		model.addAttribute("novos", novos);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totPage", totPage);
		model.addAttribute("curScrStartNo", curScrStartNo);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("curBlock", curBlock);
		model.addAttribute("lastBlock", lastBlock);
		return "support/notice/notice";
	}
	// 공지사항 내용보기
	@RequestMapping("/noticeContent")
	public String noticeContentGet(int idx, int pag, int pageSize, Model model) {
		// 원본글 가져오기
		NoticeVO vo= supportService.getNoticeContent(idx);
		// 이전글, 다음글 가져오기
		List<NoticeVO> pnVos = supportService.getPreNext(idx);
		model.addAttribute("pnVos", pnVos);
		model.addAttribute("vo", vo);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		return"support/notice/noticeContent";
	}
	
	//Q＆A폼 호출
	@RequestMapping(value="/question", method = RequestMethod.GET)
	public String questionListGet(
			@RequestParam(name="what", defaultValue="", required=false) String what,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "5", required = false) int pageSize,
			Model model) {
		int totRecCnt = supportService.totRecCntQuestion(what);// 전체자료 갯수 검색
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
		int startIndexNo = (pag - 1) * pageSize; 
		int curScrStartNo = totRecCnt - startIndexNo;	
		int blockSize = 3; 
	    int curBlock = (pag - 1) / blockSize;	
	    int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
			/* 블록페이징 처리끝*/
	    List<QuestionVO> vos = supportService.getQuestionList(startIndexNo, pageSize, what);
		model.addAttribute("vos", vos);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totPage", totPage);
		model.addAttribute("curScrStartNo", curScrStartNo);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("curBlock", curBlock);
		model.addAttribute("lastBlock", lastBlock);
		model.addAttribute("what", what);
	    return "support/question/question";
	}
	
	//Q＆A 등록폼 호출
	@RequestMapping(value="/questionInput", method = RequestMethod.GET)
	public String questionInputGet() {
		return"support/question/questionInput";
	}
	
	// Q＆A 입력후 DB저장
	@RequestMapping(value="/questionInput", method = RequestMethod.POST)
	public String questionInputPost(QuestionVO vo) {
		// 이미지 파일 업로드시에는 ckeditor폴더에서 board폴더로 복사 작업처리
		supportService.imgCheck(vo.getContent());
		
		// 이미지 복사 작업이 종료되면 실제로 저장된 board폴더명을 DB에 저장시켜줘야한다
		vo.setContent(vo.getContent().replace("/data/ckeditor/", "/data/ckeditor/question/"));
		
		// 이미지 작업과 실제저장폴더를 set처리후, 잘 정비된 vo를 db에 저장한다
		supportService.setQuestionInput(vo);
		return "redirect:/support/question";
	}
	
	// Q＆A 내용보기
	@RequestMapping(value="/questionContent", method = RequestMethod.GET)
	public String questionContentGet(int idx, int pag, int pageSize, Model model) {
		// 원본글 가져오기
		QuestionVO vo= supportService.getQuestionContent(idx);
		model.addAttribute("vo", vo);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		// 댓글 가져오기
		List<QuestionReplyVO> rVos = supportService.getQuestionReply(idx);
		model.addAttribute("rVos", rVos);
		return"support/question/questionContent";
	}
	
	//수정폼 불러오기
	@RequestMapping(value="/questionUpdate",method = RequestMethod.GET)
	public String questionUpdateGet(Model model, int idx, int pag,
			@RequestParam(name="pageSize", defaultValue="5", required=false) int pageSize) {
		QuestionVO vo = supportService.getQuestionContent(idx);
		
		// 수정작업 처리전에 그림파일이 존재한다면 원본파일을 ckeditor폴더로 복사 시켜둔다.
		if(vo.getContent().indexOf("src=\"/") != -1)	supportService.imgCheckUpdate(vo.getContent());
		
		model.addAttribute("vo", vo);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		return "support/question/questionUpdate";
	}
	
	// 수정내용 DB에 저장하기
	@RequestMapping(value="/questionUpdate",method = RequestMethod.POST)
	public String questionUpdatePost(QuestionVO vo, int pag,
			@RequestParam(name="pageSize", defaultValue="5", required=false) int pageSize) {
		if(vo.getOriContent().indexOf("src=\"/") != -1)	supportService.imgDelete(vo.getOriContent());
		vo.setContent(vo.getContent().replace("/data/ckeditor/question/", "/data/ckeditor/"));
		supportService.imgCheck(vo.getContent());
		vo.setContent(vo.getContent().replace("/data/ckeditor/", "/data/ckeditor/question/"));
		supportService.setQuestionUpdate(vo);
		
		msgFlag = "questionUpdateOk$idx="+vo.getIdx()+"&pag="+pag+"&pageSize="+pageSize;
		return "redirect:/msg/" + msgFlag;
	}
	
	//게시글 삭제처리
	@RequestMapping(value="/questionDelete")
	public String questionDeleteGet(int idx,int pag, int pageSize) {
		// 게시글에 사진이 존재한다면 실제 서버파일 시스템에서 사진파일을 삭제처리한다
		QuestionVO vo = supportService.getQuestionContent(idx);
		if(vo.getContent().indexOf("src=\"/") != -1)	supportService.imgDelete(vo.getContent());
		
		// DB애서 실제 게시글을 삭제처리
		supportService.setQuestionDelete(idx);
		return "redirect:/support/question";
	}
	
	// 댓글 저장하기
	@ResponseBody
	@RequestMapping(value="/questionReplyInsert", method = RequestMethod.POST)
	public String questionReplyInsertPost(QuestionReplyVO rVo) {
		supportService.setReplyInsert(rVo);
		return "";
	}
	// 댓글 수정하기
	@ResponseBody
	@RequestMapping(value="/questionReplyInsert2", method = RequestMethod.POST)
	public String questionReplyInsert2Post(QuestionReplyVO rVo) {
		supportService.setReplyInsert2(rVo);
		return "";
	}
	// 댓글 삭제처리
	@ResponseBody
	@RequestMapping(value="/questionReplyDelete", method = RequestMethod.POST)
	public String questionReplyDeletePost(int replyIdx) {
		supportService.setReplyDelete(replyIdx);
		return"";
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
}
