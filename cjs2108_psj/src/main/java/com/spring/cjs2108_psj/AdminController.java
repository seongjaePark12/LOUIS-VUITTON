package com.spring.cjs2108_psj;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.cjs2108_psj.service.AdminService;
import com.spring.cjs2108_psj.service.ShopService;
import com.spring.cjs2108_psj.service.SupportService;
import com.spring.cjs2108_psj.vo.BaesongVO;
import com.spring.cjs2108_psj.vo.BookingVO;
import com.spring.cjs2108_psj.vo.ChartVO;
import com.spring.cjs2108_psj.vo.MemberVO;
import com.spring.cjs2108_psj.vo.QuestionReplyVO;
import com.spring.cjs2108_psj.vo.QuestionVO;
import com.spring.cjs2108_psj.vo.SimpleVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	String msgFlag="";
	
	@Autowired
	AdminService adminService;
	@Autowired
	SupportService supportService;
	@Autowired
	ShopService shopService;
	
	// 관리자 폼 호출
	@RequestMapping(value="/admin", method = RequestMethod.GET)
	public String adminGet(Model model){
		int newMember = adminService.getNewMember();
		int newQuestion= adminService.getNewQuestion();
		int newBooking= adminService.getNewBooking();
		int newOrder = adminService.getNewOrder();
		model.addAttribute("newMember",newMember);
		model.addAttribute("newQuestion",newQuestion);
		model.addAttribute("newBooking",newBooking);
		model.addAttribute("newOrder",newOrder);
		return "admin/admin";
	}
//--------------------------회원 관리----------------------------------------	
	// 회원리스트
	@RequestMapping(value="/memberList", method = RequestMethod.GET)
	public String adMemberListGet(
			@RequestParam(name="pag", defaultValue="1", required=false) int pag,
			@RequestParam(name="pageSize", defaultValue = "5", required = false) int pageSize,
			@RequestParam(name="level", defaultValue="99", required=false) int level,
			@RequestParam(name="mid", defaultValue="", required=false) String mid,
			Model model) {
		/* 이곳부터 페이징 처리(블록페이지) 변수 지정 시작 */
	  int totRecCnt = 0;
	  if(mid.equals("")) {
	  	totRecCnt = adminService.totRecCnt(level);// 전체자료 갯수 검색(level처리)
	  }
	  else {
	  	totRecCnt = adminService.totRecCntMid(mid);	// 개별자료 검색
	  }
	  int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
	  int startIndexNo = (pag - 1) * pageSize;
	  int curScrStartNo = totRecCnt - startIndexNo;
	  int blockSize = 3;		// 한블록의 크기를 3개의 Page로 본다.(사용자가 지정한다.)
	  int curBlock = (pag - 1) / blockSize;		// 현재페이지의 블록위치
	  int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
	  /* 블록페이징처리 끝 */
	  ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
	  if(mid.equals("")) {	// 전체자료 갯수 검색(level처리)
	  	vos = adminService.getMemberList(startIndexNo, pageSize, level);
	  }
	  else {								// 개별자료 검색
	  	vos = adminService.getMemberListMid(startIndexNo, pageSize, mid);
	  }
		model.addAttribute("vos", vos);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totPage", totPage);
		model.addAttribute("curScrStartNo", curScrStartNo);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("curBlock", curBlock);
		model.addAttribute("lastBlock", lastBlock);
		model.addAttribute("level", level);
		model.addAttribute("mid", mid);
		return "admin/member/memberList";
	}
	// 등급 변경
	@ResponseBody
	@RequestMapping(value="/adminMemberLevel", method = RequestMethod.POST)
	public String adminMemberLevelPost(int idx,int level) {
		adminService.setLevelUpdate(idx, level);
		return "";
	}
	//회원 선택항목 삭제하기
	@ResponseBody
	@RequestMapping(value="/memberListDel", method = RequestMethod.POST)
	public String adminMemberDelPost(String delItems) {
		String[] idxs = delItems.split("/");
		for(String idx : idxs) {
			adminService.setMemberDelete(Integer.parseInt(idx));
		}
		return"";
	}
	//회원 선택항목 등급변경
	@ResponseBody
	@RequestMapping(value="/memberListLevel", method = RequestMethod.GET)
	public String adminMemberLevelPost(String levelItems, int level) {
		String[] idxs = levelItems.split("/");
		for(String idx : idxs) {
			adminService.setMemberLevel(Integer.parseInt(idx), level);
		}
		return"";
	}
	
//--------------------------자주하는 질문-------------------------------------------	
	// 자주하는질문 폼 호출
	@RequestMapping(value="/simpleAdmin", method = RequestMethod.GET)
	public String simpleAdminGet(Model model,
			@RequestParam(name="pag", defaultValue="1", required=false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
			@RequestParam(name="what", defaultValue="", required=false) String what){
		int totRecCnt = adminService.simpleTotRecCnt(what);
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		int blockSize = 3;		// 한블록의 크기를 3개의 Page로 본다.(사용자가 지정한다.)
		int curBlock = (pag - 1) / blockSize;		// 현재페이지의 블록위치
		int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
		vos = adminService.simpleGet(startIndexNo, pageSize, what);
		model.addAttribute("vos",vos);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totPage", totPage);
		model.addAttribute("curScrStartNo", curScrStartNo);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("curBlock", curBlock);
		model.addAttribute("lastBlock", lastBlock);
		model.addAttribute("what", what);
		return "admin/simple/simpleAdmin";
	}
	// 자주하는질문 등록
	@RequestMapping(value="/simpleInput", method = RequestMethod.GET)
	public String simpleInputGet() {
		return "admin/simple/simpleInput";
	}
	// 자주하는질문 등록
	@RequestMapping(value="/simpleInput", method = RequestMethod.POST)
	public String simpleInputPost(SimpleVO vo) {
		adminService.setSimpleInput(vo);
		return "redirect:/msg/simpleInputOk";
	}
	// 자주하는질문 삭제
	@ResponseBody
	@RequestMapping(value="/simpleAdmin", method = RequestMethod.POST)
	public String simpleAdminDeletePost(int idx) {
		adminService.setSimpleDelete(idx);
		return "";
	}
	
//---------------------------Q＆A-----------------------------------
	
	//Q＆A폼 호출
	@RequestMapping(value="/question", method = RequestMethod.GET)
	public String questionListGet(
			@RequestParam(name="what", defaultValue="", required=false) String what,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
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
	    return "admin/question/questionAdmin";
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
		return"admin/question/questionContent";
	}
	//게시글 삭제처리
	@RequestMapping(value="/questionDelete")
	public String questionDeleteGet(int idx,int pag, int pageSize) {
		// 게시글에 사진이 존재한다면 실제 서버파일 시스템에서 사진파일을 삭제처리한다
		QuestionVO vo = supportService.getQuestionContent(idx);
		if(vo.getContent().indexOf("src=\"/") != -1)	supportService.imgDelete(vo.getContent());
		
		// DB애서 실제 게시글을 삭제처리
		supportService.setQuestionDelete(idx);
		return "redirect:/admin/question";
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
	
	// 등급 변경
	@ResponseBody
	@RequestMapping(value="/adminQuestionAnser", method = RequestMethod.POST)
	public String adminQuestionAnserPost(int idx,int anser) {
		adminService.setQuestionUpdate(idx, anser);
		return "";
	}
	//선택항목 삭제하기
	@ResponseBody
	@RequestMapping(value="/questionListDel", method = RequestMethod.POST)
	public String questionListDelPost(String delItems) {
		String[] idxs = delItems.split("/");
		for(String idx : idxs) {
			adminService.setQuestionDelete(Integer.parseInt(idx));
		}
		return"";
	}
	//선택항목 등급변경
	@ResponseBody
	@RequestMapping(value="/questionListAnser", method = RequestMethod.GET)
	public String questionListAnserPost(String anserItems, int anser) {
		String[] idxs = anserItems.split("/");
		for(String idx : idxs) {
			adminService.setQuestionLevel(Integer.parseInt(idx), anser);
		}
		return"";
	}
	
	// 예약내용보기
	@RequestMapping(value="/booking", method = RequestMethod.GET)
	public String bookingGet(
		@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
		@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
		@RequestParam(name="name", defaultValue="", required=false) String name,
		Model model) {
		int totRecCnt = 0;
		 if(name.equals("")) {
		  	totRecCnt = adminService.totRecCntBooking();
		  }
		  else {
		  	totRecCnt = adminService.totRecCntName(name);	// 개별자료 검색
		  }
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
		int startIndexNo = (pag - 1) * pageSize; 
		int curScrStartNo = totRecCnt - startIndexNo;	
		int blockSize = 3; 
	    int curBlock = (pag - 1) / blockSize;	
	    int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
			/* 블록페이징 처리끝*/
	    List<BookingVO> vos = new ArrayList<BookingVO>();
		  if(name.equals("")) {
		  	vos = adminService.getBookingList(startIndexNo, pageSize);
		  }
		  else {								// 개별자료 검색
		  	vos = adminService.getBookingListName(startIndexNo, pageSize, name);
		  }
		model.addAttribute("vos", vos);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totPage", totPage);
		model.addAttribute("curScrStartNo", curScrStartNo);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("curBlock", curBlock);
		model.addAttribute("lastBlock", lastBlock);
		return"admin/booking/booking";
	}
	
	//선택항목 삭제하기
	@ResponseBody
	@RequestMapping(value="/bookingListDel", method = RequestMethod.POST)
	public String bookingListDelPost(String delItems) {
		String[] idxs = delItems.split("/");
		for(String idx : idxs) {
			adminService.setBookingDelete(Integer.parseInt(idx));
		}
		return"";
	}
	
	
	@RequestMapping(value="/orderAdmin", method = RequestMethod.GET)
	public String dbOrderProcessGet(Model model,
			@RequestParam(name="startJumun", defaultValue="", required=false) String startJumun,
			@RequestParam(name="endJumun", defaultValue="", required=false) String endJumun,
			@RequestParam(name="orderStatus", defaultValue="전체", required=false) String orderStatus,
			@RequestParam(name="pag", defaultValue="1", required=false) int pag,
			@RequestParam(name="pageSize", defaultValue="10", required=false) int pageSize) {
		/* 이곳부터 페이징 처리(블록페이지) 변수 지정 시작 */
		String strNow = "";
		if(startJumun.equals("")) {
			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			strNow = sdf.format(now);
		}
		int totRecCnt = shopService.totRecCntAdminStatus(strNow, strNow, orderStatus);
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStrarNo = totRecCnt - startIndexNo;
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
		/* 블록페이징처리 끝 */
		
		List<BaesongVO> orderVos = shopService.adminOrderStatus(startJumun, endJumun, orderStatus);
		
		model.addAttribute("startJumun", startJumun);
		model.addAttribute("endJumun", endJumun);
		model.addAttribute("orderStatus", orderStatus);
		model.addAttribute("orderVos", orderVos);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totPage", totPage);
		model.addAttribute("curScrStrarNo", curScrStrarNo);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("curBlock", curBlock);
		model.addAttribute("lastBlock", lastBlock);
	
		return "admin/order/orderAdmin";
	}
	
  // 관리자가 개별상품 주문상태를 변경처리
	@ResponseBody
	@RequestMapping(value="/goodsStatus", method=RequestMethod.POST)
	public String goodsStatusGet(String orderStatus, String orderIdx) {
		adminService.setOrderStatusUpdate(orderStatus, orderIdx);
		return "";
	}
	
	// 관리자가 운송장 번호입력
	@ResponseBody
	@RequestMapping(value="/baesongNumUpdate", method=RequestMethod.POST)
	public String baesongNumUpdate(String orderIdx,String baesongNum) {
		adminService.baesongNumUp(orderIdx,baesongNum);
		return "";
	}
	
	// 관리자가 선택해서 주문상태를 변경처리
	@ResponseBody
	@RequestMapping(value="/orderChange", method=RequestMethod.POST)
	public String orderChangeGet(String orderItems, String orderStatus) {
		String[] idxs = orderItems.split("/");
		for(String orderIdx : idxs) {
			adminService.setOrderLevel(orderIdx, orderStatus);
		}
		return"";
	}
	
	// 관리자 주문 상태별 조회하기(개인 주문상태별 조회 복사해서 처리함)
	@RequestMapping(value="/adminOrderStatus", method=RequestMethod.GET)
	public String orderStatusGet(Model model, String startJumun, String endJumun,
			@RequestParam(name="orderStatus", defaultValue="전체", required=false) String orderStatus,
			@RequestParam(name="pag", defaultValue="1", required=false) int pag,
			@RequestParam(name="pageSize", defaultValue="10", required=false) int pageSize) {
		
		/* 이곳부터 페이징 처리(블록페이지) 변수 지정 시작 */
		int totRecCnt = shopService.totRecCntAdminStatus(startJumun, endJumun, orderStatus);
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStrarNo = totRecCnt - startIndexNo;
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
		/* 블록페이징처리 끝 */
		
		List<BaesongVO> orderVos = shopService.getOrderAdminStatus(startJumun, endJumun, orderStatus);
		
		model.addAttribute("startJumun", startJumun);
		model.addAttribute("endJumun", endJumun);
		model.addAttribute("orderStatus", orderStatus);
		model.addAttribute("orderVos", orderVos);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totPage", totPage);
		model.addAttribute("curScrStrarNo", curScrStrarNo);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("curBlock", curBlock);
		model.addAttribute("lastBlock", lastBlock);
		
		return "admin/order/orderAdmin";
	}
	
	// 차트보기
	@RequestMapping(value="chart", method = RequestMethod.GET)
	public String chartGet(Model model,
			@RequestParam(name="year", defaultValue="", required=false) String year,
			@RequestParam(name="year2", defaultValue="", required=false) String year2,
			@RequestParam(name="month", defaultValue="", required=false) String month) {
		List<ChartVO> yearVos = adminService.yearCash(); // 년도별 총마진금액
		List<ChartVO> monthVos = adminService.monthCash(year); // 월별 총마진금액
		List<ChartVO> dayVos = adminService.dayCash(year2,month); // 일별 총마진금액
		List<ChartVO> productNumVos = adminService.productNum(); // 제품별 연판매량
		List<ChartVO> productNumVosm = adminService.productmNum(year); // 제품별 월판매량
		List<ChartVO> productNumVosd = adminService.productdNum(year2,month); // 제품별 일판매량
		List<ChartVO> productVos = adminService.productCash(); // 제품별 판매량
		ChartVO productVo = adminService.productSum(); // 총 누적
		String[] monthRealPrices = new String[12];
		String[] monthDisPrices = new String[12];
		String[] monthMargins = new String[12];
		String[] dayRealPrices = new String[31];
		String[] dayDisPrices = new String[31];
		String[] dayMargins = new String[31];
		String[] monthSel = new String[12];
		String[] daySel = new String[31];
		// 마진 월 값 0 체크
		for(int i=0; i<monthRealPrices.length; i++) {
			int sw = 0;
			for(int j=0; j<monthVos.size(); j++) {
				if((i+1) == Integer.parseInt(monthVos.get(j).getMonthDate())) {
					monthRealPrices[i] = monthVos.get(j).getRealPrices();
					monthDisPrices[i] = monthVos.get(j).getDisPrices();
					monthMargins[i] = monthVos.get(j).getMargins();
					sw = 1;
					break;
				}
				if(sw == 0) {
					monthRealPrices[i] = "0";
					monthDisPrices[i] = "0";
					monthMargins[i] = "0";
				}
			}
		}
		// 마진 일 값 0 체크
		for(int i=0; i<dayRealPrices.length; i++) {
			int sw = 0;
			for(int j=0; j<dayVos.size(); j++) {
				if((i+1) == Integer.parseInt(dayVos.get(j).getDayDates())) {
					dayRealPrices[i] = dayVos.get(j).getRealPrices();
					dayDisPrices[i] = dayVos.get(j).getDisPrices();
					dayMargins[i] = dayVos.get(j).getMargins();
					sw = 1;
					break;
				}
				if(sw == 0) {
					dayRealPrices[i] = "0";
					dayDisPrices[i] = "0";
					dayMargins[i] = "0";
				}
			}
		}
		int w3=0;
		if(dayVos.size()==0) {
			w3 = 1;
		}
		// 판매량 월 값 0 체크
		for(int i=0; i<monthSel.length; i++) {
			int sw = 0;
			for(int j=0; j<productNumVosm.size(); j++) {
				if((i+1) == Integer.parseInt(productNumVosm.get(j).getMonthDate())) {
					monthSel[i] = productNumVosm.get(j).getSelNums();
					sw = 1;
					break;
				}
				if(sw == 0) {
					monthSel[i] = "0";
				}
			}
		}
		// 판매량 일 값 0 체크
		for(int i=0; i<daySel.length; i++) {
			int sw = 0;
			for(int j=0; j<productNumVosd.size(); j++) {
				if((i+1) == Integer.parseInt(productNumVosd.get(j).getDayDates())) {
					daySel[i] = productNumVosd.get(j).getSelNums();
					sw = 1;
					break;
				}
				if(sw == 0) {
					daySel[i] = "0";
				}
			}
		}
		int w4=0;
		if(productNumVosd.size()==0) {
			w4 = 1;
		}
		
		model.addAttribute("yearVos", yearVos);
		model.addAttribute("monthVos", monthVos);
		model.addAttribute("dayVos", dayVos);
		model.addAttribute("year", year);
		model.addAttribute("year2", year2);
		model.addAttribute("month", month);
		model.addAttribute("monthRealPrices", monthRealPrices);
		model.addAttribute("monthDisPrices", monthDisPrices);
		model.addAttribute("monthMargins", monthMargins);
		model.addAttribute("dayRealPrices", dayRealPrices);
		model.addAttribute("dayDisPrices", dayDisPrices);
		model.addAttribute("dayMargins", dayMargins);
		model.addAttribute("productNumVos",productNumVos);
		model.addAttribute("productNumVosm",productNumVosm);
		model.addAttribute("productNumVosd",productNumVosd);
		model.addAttribute("productVos",productVos);
		model.addAttribute("productVo",productVo);
		model.addAttribute("monthSel",monthSel);
		model.addAttribute("daySel",daySel);
		model.addAttribute("w3", w3);
		model.addAttribute("w4", w4);
		return "admin/chart/chart";
	}
	
}
