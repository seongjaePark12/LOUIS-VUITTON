package com.spring.cjs2108_psj;

import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.cjs2108_psj.service.MemberService;
import com.spring.cjs2108_psj.service.ShopService;
import com.spring.cjs2108_psj.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	String msgFlag="";
	
	@Autowired
	MemberService memberService;
	@Autowired
	ShopService shopService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	// 로그인 홈 호출
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String loginGet(HttpServletRequest request) {
		// 로그인폼 호출시 기존에 저장된 쿠키가 있으면 불러올수 있게 한다.
		Cookie[] cookies = request.getCookies();	// 기존에 저장된 현재 사이트의 쿠키를 불러와서 배열로 저장한다.
		String mid = "";
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")) {
				mid = cookies[i].getValue();
				request.setAttribute("mid", mid);
				break;
			}
		}
		return "member/loginJoin/login";
	}
	// 로그인 인증처리
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String loginPost(String mid, String pwd, HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		MemberVO vo = memberService.getIdCheck(mid);
		
		if(vo != null && passwordEncoder.matches(pwd, vo.getPwd()) && vo.getUserDel().equals("NO")) {
			String strLevel = "";
			if(vo.getLevel() == 0) strLevel = "관리자";
			else if(vo.getLevel() == 1) strLevel = "BLACK";
			else if(vo.getLevel() == 2) strLevel = "GOLD";
			else if(vo.getLevel() == 3) strLevel = "RED";
			else if(vo.getLevel() == 4) strLevel = "WELCOME";
			session.setAttribute("sMid", mid);
			session.setAttribute("sName", vo.getName());
			session.setAttribute("sLevel", vo.getLevel());
			session.setAttribute("sEmail", vo.getEmail());
			session.setAttribute("sStrLevel", strLevel);
			//쿠키 처리
			// 아이디에 대한 정보를 쿠키로 저장처리...
			String idCheck = request.getParameter("remember")==null? "" : request.getParameter("remember");
			// 쿠키 처리(아이디에 대한 정보를 쿠키로 저장할지를 처리한다)-jsp에서 idCheck변수에 값이 체크되어서 넘어오면 'on'값이 담겨서 넘어오게 된다.
			if(idCheck.equals("on")) {				// 앞의 jsp에서 쿠키를 저장하겠다고 넘겼을경우...
				Cookie cookie = new Cookie("cMid", mid);
				cookie.setMaxAge(60*60*24*4); 	// 쿠키의 만료시간을 4일로 정했다.(단위: 초)
				response.addCookie(cookie);
			}
			else {		// jsp에서 쿠키저장을 취소해서 보낸다면? 쿠키명을 삭제처리한다.
				Cookie[] cookies = request.getCookies();	// 기존에 저장되어 있는 현재 사이트의 쿠키를 불러와서 배열로 저장한다.
				for(int i=0; i<cookies.length; i++) {
					if(cookies[i].getName().equals("cMid")) {
						cookies[i].setMaxAge(0);		//  저장된 쿠키명중 'cMid' 쿠키를 찾아서 삭제한다.
						response.addCookie(cookies[i]);
						break;
					}
				}
			}
			// 로그인 인증후에 최종 방문일자/시간 업데이트
			memberService.setVisitUpdate(mid);
			msgFlag = "loginOk";
		}
		else {
			msgFlag = "loginNo";
		}
		return "redirect:/msg/"+msgFlag;
	}
	// 회원 가입폼
	@RequestMapping(value="/join", method = RequestMethod.GET)
	public String joinGet() {
		return "member/loginJoin/join";
	}
	// 회원 가입처리하기
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String joinPost(MemberVO vo) {
		// 아이디 중복 체크
		if(memberService.getIdCheck(vo.getMid()) != null) {
			msgFlag = "memIdCheckNo";
			return "redirect:/msg/" + msgFlag;
		}
		// 이메일 중복 체크
		if(memberService.getEmailCheck(vo.getEmail()) != null) {
			msgFlag = "memEmailCheckNo";
			return "redirect:/msg/" + msgFlag;
		}
		// 비밀번호 암호화 처리
		vo.setPwd(passwordEncoder.encode(vo.getPwd()));
		// DB에 가입회원 등록하기
	    memberService.setMemJoin(vo);
	    String email = vo.getEmail();
	    String mid = vo.getMid().substring(0,3)+"**";
	    return "redirect:/mail/joinSend/"+email+"/"+mid+"/";
	}
	// 로그인 후 메인
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String mainGet(HttpSession session, Model model) {
		String mid = (String)session.getAttribute("sMid");
		int ww = shopService.totRecCntStatusWish(mid);
		session.setAttribute("sWishCount", ww);
		int vvvi = shopService.getCartCount(mid);
		model.addAttribute("vvvi", vvvi);
		session.setAttribute("sBagCount",vvvi);
		return "main/main";
	}
	// 로그아웃
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutGet(HttpSession session) {
		session.invalidate();
		return "redirect:/member/login";
	}
	// 회원 아이디 검색하기
	@ResponseBody
	@RequestMapping(value="/idCheck", method = RequestMethod.POST)
	public String idCheckPost(String mid) {
		String res = "0";
		MemberVO vo = memberService.getIdCheck(mid);
		if(vo != null) res = "1";
		return res;
	}
	// 회원 이메일 검색하기
	@ResponseBody
	@RequestMapping(value="/emailCheck", method = RequestMethod.POST)
	public String emailCheckPost(String email) {
		String res = "0";
		MemberVO vo = memberService.getEmailCheck(email);
		if(vo != null) res = "1";
		return res;
	}
	// 아이디 찾기 폼
	@RequestMapping(value="/midConfirm", method = RequestMethod.GET)
	public String midConfirmGet() {
		return "member/loginJoin/midConfirm";
	}
	// 아이디 찾기
	@RequestMapping(value="/midConfirm", method = RequestMethod.POST)
	public String midConfirmPost(String name, String email, Model model) {
		MemberVO vo = memberService.getMidConfirm(name, email);
		if(vo != null) {
			String mid = vo.getMid().substring(0,5)+"**";
			model.addAttribute("mid",mid);
			return "member/loginJoin/midConfirm2";
		}
		else {
			msgFlag = "midConfirmNo";
			return "redirect:/msg/" + msgFlag;
		}
	}
	// 비밀번호 찾기 폼
	@RequestMapping(value="/pwdConfirm", method = RequestMethod.GET)
	public String pwdConfirmGet() {
		return "member/loginJoin/pwdConfirm";
	}
	// 임시비밀번호 발급해서 메일로보냄
	@RequestMapping(value="/pwdConfirm", method = RequestMethod.POST)
	public String pwdConfirmPost(String mid, String name, String email) {
		MemberVO vo = memberService.getPwdConfirm(mid, name, email);
		if(vo != null) {
			// 임시비밀번호를 만들자
			UUID uid = UUID.randomUUID();
			String pwd = uid.toString().substring(0,8);
			memberService.setPwdChange(mid, passwordEncoder.encode(pwd));
			String content = pwd;
			return "redirect:/mail/pwdConfirmSend/"+email+"/"+content+"/";
		}
		else {
			msgFlag = "pwdConfirmNo";
			return "redirect:/msg/" + msgFlag;
		}
	}
	// 회원 탈퇴
	@RequestMapping(value="/userDelete")
	public String userDeleteGet(HttpSession session) {
		String mid = (String)session.getAttribute("sMid");
		memberService.setMemDelete(mid);
		msgFlag = "memDeleteOk";
		return "redirect:/msg/"+msgFlag;
	}

	@RequestMapping(value="/position")
	public String positionGet() {
		return"main/position";
	}
}
