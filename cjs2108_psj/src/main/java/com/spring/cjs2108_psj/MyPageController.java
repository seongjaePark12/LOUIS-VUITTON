package com.spring.cjs2108_psj;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.cjs2108_psj.service.MemberService;
import com.spring.cjs2108_psj.service.ShopService;
import com.spring.cjs2108_psj.service.SupportService;
import com.spring.cjs2108_psj.vo.BaesongVO;
import com.spring.cjs2108_psj.vo.BookingVO;
import com.spring.cjs2108_psj.vo.MemberVO;
import com.spring.cjs2108_psj.vo.QuestionReplyVO;
import com.spring.cjs2108_psj.vo.QuestionVO;
import com.spring.cjs2108_psj.vo.WishVO;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	String msgFlag="";
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ShopService shopService;
	
	@Autowired
	SupportService supportService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	// 마이페이지 홈 호출
	@RequestMapping(value="/myPage", method = RequestMethod.GET)
	public String myPageGet(Model model, HttpSession session,BookingVO vo1) {
		String mid = (String) session.getAttribute("sMid");
		vo1 = memberService.bookingList(mid);
		model.addAttribute("vo1", vo1);
		MemberVO vo = memberService.getIdCheck(mid);
		model.addAttribute("vo", vo);
		List<WishVO> wishVos = shopService.getWishListMy(mid);
		model.addAttribute("wishVos", wishVos);
		int ww = shopService.totRecCntStatusWish(mid);
		model.addAttribute("ww", ww);
		int questionCnt = memberService.totRecCntQuestionMain(mid);
		List<BaesongVO> myOrderVos = memberService.getDbMyOrderMain(mid);
		model.addAttribute("questionCnt", questionCnt);
		model.addAttribute("myOrderVos", myOrderVos);
		
		return "member/mypage/myPage";
	}
	// 나의계정 홈 호출
	@RequestMapping(value="/myInfor", method = RequestMethod.GET)
	public String myInforGet(Model model, HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		MemberVO vo = memberService.getIdCheck(mid);
		model.addAttribute("vo", vo);
		return "member/mypage/myInfor";
	}
	// 비밀번호 체크 홈
	@RequestMapping(value="/pwdCheck", method = RequestMethod.GET)
	public String pwdCheckGet() {
		return "member/mypage/pwdCheck";
	}
	// 비밀번호 확인 처리
	@RequestMapping(value="/pwdCheck", method = RequestMethod.POST)
	public String pwdCheckPost(String pwd, HttpSession session, Model model) {
		String mid = (String) session.getAttribute("sMid");
		MemberVO vo = memberService.getIdCheck(mid);
		if(vo != null && passwordEncoder.matches(pwd, vo.getPwd())) {
			session.setAttribute("sPwd", pwd);
			model.addAttribute("vo", vo);
			return "redirect:/mypage/myUpdate";
		}
		else {
			msgFlag = "pwdCheckNo";
			return "redirect:/msg/"+msgFlag;
		}
	}
	// 회원 정보 변경폼 불러오기
	@RequestMapping(value="/myUpdate", method = RequestMethod.GET)
	public String memUpdateGet(Model model, HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		MemberVO vo = memberService.getIdCheck(mid);
		model.addAttribute("vo", vo);
		return "member/mypage/myUpdate";
	}
	
	// 회원 정보 변경하기
	@RequestMapping(value="/myUpdate", method = RequestMethod.POST)
	public String myUpdatePost(MemberVO vo, HttpSession session) {
		String email = (String) session.getAttribute("sEmail");
		
		// 이메일 중복체크하기 ( 이메일이 변경되었으면 새롭게 이메일을 세션에 등록시켜준다.)
		if(!email.equals(vo.getEmail())) {
			if(memberService.getEmailCheck(vo.getEmail()) != null) {
				msgFlag = "memEmailCheckNo";
				return "redirect:/msg/" + msgFlag;
			}
			else {
				session.setAttribute("sEmail", vo.getEmail());
			}
		}
		vo.setPwd(passwordEncoder.encode(vo.getPwd()));
		
		memberService.setMyUpdate(vo);
		return "redirect:/msg/myUpdateOk";
	}
	
	//Q＆A폼 호출
	@RequestMapping(value="/myQuestion", method = RequestMethod.GET)
	public String questionListGet(Model model, HttpSession session,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize) {
		String mid = (String) session.getAttribute("sMid");
		int totRecCnt = memberService.totRecCntQuestion(mid);// 전체자료 갯수 검색
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
		int startIndexNo = (pag - 1) * pageSize; 
		int curScrStartNo = totRecCnt - startIndexNo;	
		int blockSize = 3; 
	    int curBlock = (pag - 1) / blockSize;	
	    int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
	    List<QuestionVO> vos = memberService.getQuestionList(mid);
		model.addAttribute("vos", vos);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totPage", totPage);
		model.addAttribute("curScrStartNo", curScrStartNo);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("curBlock", curBlock);
		model.addAttribute("lastBlock", lastBlock);
		return "member/mypage/myQuestion";
	}
	
	// Q＆A 내용보기
	@RequestMapping(value="/myContent", method = RequestMethod.GET)
	public String questionContentGet(int idx,Model model) {
		// 원본글 가져오기
		QuestionVO vo= memberService.getQuestionContent(idx);
		model.addAttribute("vo", vo);
		// 댓글 가져오기
		List<QuestionReplyVO> rVos = memberService.getQuestionReply(idx);
		model.addAttribute("rVos", rVos);
		return "member/mypage/myContent";
	}
	
	// 예약 홈
	@RequestMapping(value="/myBooking", method = RequestMethod.GET)
	public String myBookingGet(Model model,BookingVO vo,HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		vo = memberService.bookingList(mid);
		model.addAttribute("vo", vo);
		return "member/mypage/myBooking";
	}
	
	// 예약 등록
	@RequestMapping(value="/myBooking", method = RequestMethod.POST)
	public String myBookingPost(BookingVO vo) {
		memberService.myBookingInput(vo);
		return "redirect:/mypage/myBooking";
	}
	
	// 예약 변경
	@ResponseBody
	@RequestMapping(value="/bookingUpdate", method = RequestMethod.POST)
	public String bookingUpdatePost(BookingVO vo) {
		memberService.myBookingUpdate(vo);
		return "";
	}
	
	// 예약 취소
	@ResponseBody
	@RequestMapping(value="/bookingDelete", method = RequestMethod.POST)
	public String bookingDeletePost(String mid) {
		memberService.myBookingDelete(mid);
		return "";
	}
	
	
	// 배송지 정보 보여주기
	@RequestMapping(value="/dbOrderBaesong", method=RequestMethod.GET)
	public String dbOrderBaesongGet(String orderIdx, Model model) {
		List<BaesongVO> vos = shopService.getOrderBaesong(orderIdx);  // 같은 주문번호가 2개 이상 있을수 있기에 List객체로 받아온다.
		model.addAttribute("vo", vos.get(0));  // 같은 배송지면 0번째것 하나만 vo에 담아서 넘겨주면 된다.
		
		return "userShop/userOrderBaesong";
	}
	
	// 로그인 사용자가 주문내역 조회하기
	@RequestMapping(value="/myOrder", method=RequestMethod.GET)
	public String dbMyOrderGet(HttpServletRequest request, HttpSession session, Model model,
			@RequestParam(name="pag", defaultValue="1", required=false) int pag,
			@RequestParam(name="pageSize", defaultValue="10", required=false) int pageSize) {
		String mid = (String) session.getAttribute("sMid");
		int level = (int) session.getAttribute("sLevel");
		if(level == 0) mid = "전체";
		
		/* 이곳부터 페이징 처리(블록페이지) 변수 지정 시작 */
	  int totRecCnt = shopService.totRecCnt(mid);		// 전체자료 갯수 검색
	  int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
	  int startIndexNo = (pag - 1) * pageSize;
	  int curScrStrarNo = totRecCnt - startIndexNo;
	  int blockSize = 3;		// 한블록의 크기를 3개의 Page로 본다.(사용자가 지정한다.)
	  int curBlock = (pag - 1) / blockSize;		// 현재페이지의 블록위치
	  int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
	  /* 블록페이징처리 끝 */
		List<BaesongVO> myOrderVos = shopService.getDbMyOrder(startIndexNo, pageSize, mid);
		
		model.addAttribute("myOrderVos", myOrderVos);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totPage", totPage);
		model.addAttribute("curScrStrarNo", curScrStrarNo);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("curBlock", curBlock);
		model.addAttribute("lastBlock", lastBlock);
		
		return "member/mypage/myOrder";
	}

	// 주문 상태별 조회하기
	@RequestMapping(value="/orderStatus", method=RequestMethod.GET)
	public String orderStatusGet(HttpSession session, String orderStatus, Model model,
			@RequestParam(name="pag", defaultValue="1", required=false) int pag,
			@RequestParam(name="pageSize", defaultValue="10", required=false) int pageSize) {
		String mid = (String) session.getAttribute("sMid");
		
		/* 이곳부터 페이징 처리(블록페이지) 변수 지정 시작 */
	  int totRecCnt = shopService.totRecCntStatus(mid, orderStatus);
	  int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
	  int startIndexNo = (pag - 1) * pageSize;
	  int curScrStrarNo = totRecCnt - startIndexNo;
	  int blockSize = 3;
	  int curBlock = (pag - 1) / blockSize;
	  int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
	  /* 블록페이징처리 끝 */
		
	  List<BaesongVO> myOrderVos = shopService.getOrderStatus(mid, orderStatus);
		model.addAttribute("orderStatus", orderStatus);
		model.addAttribute("myOrderVos", myOrderVos);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totPage", totPage);
		model.addAttribute("curScrStrarNo", curScrStrarNo);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("curBlock", curBlock);
		model.addAttribute("lastBlock", lastBlock);
		
		return "member/mypage/myOrder";
	}
	
	// 주문 조건 조회하기(날짜별(오늘/일주일/보름/한달/3개월/전체)
	@RequestMapping(value="/orderCondition", method=RequestMethod.GET)
	public String orderConditionGet(HttpSession session, int conditionDate, Model model,
			@RequestParam(name="pag", defaultValue="1", required=false) int pag,
			@RequestParam(name="pageSize", defaultValue="10", required=false) int pageSize) {
		String mid = (String) session.getAttribute("sMid");
		
		/* 이곳부터 페이징 처리(블록페이지) 변수 지정 시작 */
	  int totRecCnt = shopService.totRecCntOrderCondition(mid, conditionDate);
	  int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
	  int startIndexNo = (pag - 1) * pageSize;
	  int curScrStrarNo = totRecCnt - startIndexNo;
	  int blockSize = 3;
	  int curBlock = (pag - 1) / blockSize;
	  int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
	  /* 블록페이징처리 끝 */
		
	  List<BaesongVO> myOrderVos = shopService.orderCondition(mid, conditionDate);
	  
		model.addAttribute("conditionDate", conditionDate);
		model.addAttribute("myOrderVos", myOrderVos);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totPage", totPage);
		model.addAttribute("curScrStrarNo", curScrStrarNo);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("curBlock", curBlock);
		model.addAttribute("lastBlock", lastBlock);
		
		// 아래는 1일/일주일/보름/한달/3달/전체 조회시에 startJumun과 endJumun을 넘겨주는 부분(view에서 시작날짜와 끝날짜를 지정해서 출력시켜주기위해 startJumun과 endJumun값을 구해서 넘겨준다.)
		Calendar startDateJumun = Calendar.getInstance();
		Calendar endDateJumun = Calendar.getInstance();
		startDateJumun.setTime(new Date());  // 오늘날짜로 셋팅
		endDateJumun.setTime(new Date());    // 오늘날짜로 셋팅
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String startJumun = "";
		String endJumun = "";
		switch (conditionDate) {
			case 1:
				startJumun = sdf.format(startDateJumun.getTime());
				endJumun = sdf.format(endDateJumun.getTime());
				break;
			case 7:
				startDateJumun.add(Calendar.DATE, -7);
				break;
			case 15:
				startDateJumun.add(Calendar.DATE, -15);
				break;
			case 30:
				startDateJumun.add(Calendar.MONTH, -1);
				break;
			case 90:
				startDateJumun.add(Calendar.MONTH, -3);
				break;
			case 99999:
				startDateJumun.set(2021, 00, 01);
				break;
			default:
				startJumun = null;
				endJumun = null;
		}
		if(conditionDate != 1 && endJumun != null) {
			startJumun = sdf.format(startDateJumun.getTime());
			endJumun = sdf.format(endDateJumun.getTime());
		}
		
		model.addAttribute("startJumun", startJumun);
		model.addAttribute("endJumun", endJumun);
		
		return "member/mypage/myOrder";
	}
	
	// 구매확정
	@ResponseBody
	@RequestMapping(value="/gumeCheck", method = RequestMethod.POST)
	public String gumeCheckPost(String orderIdx) {
		shopService.mygumeCheck(orderIdx);
		return "";
	}
	// 반품신청
	@ResponseBody
	@RequestMapping(value="/gumeCheck2", method = RequestMethod.POST)
	public String gumeCheck2Post(String orderIdx) {
		shopService.mygumeCheck2(orderIdx);
		return "";
	}
	// 반품취소
	@ResponseBody
	@RequestMapping(value="/gumeCheck3", method = RequestMethod.POST)
	public String gumeCheck3Post(String orderIdx) {
		shopService.mygumeCheck3(orderIdx);
		return "";
	}
	
	// 위시리스트 보여주기
	@RequestMapping(value="/myWish", method=RequestMethod.GET)
	public String myWishGet(Model model,HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		List<WishVO> wishVos = shopService.getWishListMy(mid);
		model.addAttribute("wishVos", wishVos);
		int ww = shopService.totRecCntStatusWish(mid);
		model.addAttribute("ww", ww);
		session.setAttribute("sWishCount", ww);
		return "member/mypage/myWish";
	}
	
	// 위시리스트 삭제
	@ResponseBody
	@RequestMapping(value="/wishDel", method = RequestMethod.POST)
	public String wishDelPost(int idx) {
		shopService.wishDel(idx);
		return "";
	}

}
