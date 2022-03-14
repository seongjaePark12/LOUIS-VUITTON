package com.spring.cjs2108_psj;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MessageController {
	@RequestMapping(value="/msg/{msgFlag}", method = RequestMethod.GET)
	public String msgGet(@PathVariable String msgFlag, Model model , HttpSession session) {
		String name = session.getAttribute("sName")==null? "" : (String) session.getAttribute("sName");
		String strLevel = session.getAttribute("sStrLevel")==null? "" : (String) session.getAttribute("sStrLevel");
		
		if(msgFlag.equals("memberNo")) {
			model.addAttribute("msg","로그인 후 이용해주세요");
			model.addAttribute("url","member/login");
		}
		else if(msgFlag.equals("memIdCheckNo")) {
			model.addAttribute("msg", "아이디가 중복되었습니다");
			model.addAttribute("url","member/join");
		}
		else if(msgFlag.equals("memEmailCheckNo")) {
			model.addAttribute("msg", "이메일이 중복되었습니다");
			model.addAttribute("url","member/join");
		}
		else if(msgFlag.equals("memJoinOk")) {
			model.addAttribute("msg", "회원가입되셨습니다");
			model.addAttribute("url","member/login");
		}
		else if(msgFlag.equals("loginOk")) {
			model.addAttribute("msg", name+"님("+strLevel+") 로그인 되었습니다");
			model.addAttribute("url","member/main");
		}
		else if(msgFlag.equals("loginNo")) {
			model.addAttribute("msg", "아이디와 비밀번호를 확인해주세요");
			model.addAttribute("url","member/login");
		}
		else if(msgFlag.equals("midConfirmNo")) {
			model.addAttribute("msg", "등록된 아이디가 없습니다");
			model.addAttribute("url","member/midConfirm");
		}
		else if(msgFlag.equals("pwdConfirmOk")) {
			model.addAttribute("msg", "임시비밀번호를 메일로 보냈습니다.\\n메일을 확인하세요");
			model.addAttribute("url","member/login");
		}
		else if(msgFlag.equals("pwdConfirmNo")) {
			model.addAttribute("msg", "다시 시도해주세요");
			model.addAttribute("url","member/pwdConfirm");
		}
		else if(msgFlag.equals("memDeleteOk")) {
			model.addAttribute("msg", "회원 탈퇴 되었습니다.\\n안녕히 가십시오");
			model.addAttribute("url","member/login");
		}
		else if(msgFlag.equals("pwdCheckNo")) {
			model.addAttribute("msg", "비밀번호가 다릅니다");
			model.addAttribute("url","mypage/pwdCheck");
		}
		else if(msgFlag.equals("myUpdateOk")) {
			model.addAttribute("msg", "회원정보가 수정되었습니다");
			model.addAttribute("url","mypage/myInfor");
		}
		else if(msgFlag.equals("simpleInputOk")) {
			model.addAttribute("msg", "자주하는질문이 등록되었습니다");
			model.addAttribute("url","admin/simpleInput");
		}
		else if(msgFlag.equals("noticeInputOk")) {
			model.addAttribute("msg", "공지사항이 등록되었습니다");
			model.addAttribute("url","notice/noticeAdmin");
		}
		else if(msgFlag.equals("productInputOk")) {
			model.addAttribute("msg", "상품이 등록되었습니다");
			model.addAttribute("url","product/productInput");
		}
		else if(msgFlag.equals("OptionInputOk")) {
			model.addAttribute("msg", "옵션이 등록되었습니다");
			model.addAttribute("url","product/productOption");
		}
		else if(msgFlag.equals("codeCheckNo")) {
			model.addAttribute("msg", "옵션이 등록되었습니다");
			model.addAttribute("url","product/productInput");
		}
		else if(msgFlag.equals("productDeleteOk")) {
			model.addAttribute("msg", "상품이 삭제되었습니다");
			model.addAttribute("url","product/productList");
		}
		else if(msgFlag.equals("orderInputOk")) {
			model.addAttribute("msg", "주문이 완료되었습니다");
			model.addAttribute("url","shop/userOrderConfirm");
		}

		
		
		
		
		
		
		else if(msgFlag.substring(0,14).equals("noticeUpdateOk")) {
			model.addAttribute("msg", "공지사항이 수정되었습니다");
			model.addAttribute("url","notice/noticeContent?"+msgFlag.substring(15));
		}
		else if(msgFlag.substring(0,14).equals("noticeDeleteOk")) {
			model.addAttribute("msg", "공지사항이 삭제되었습니다");
			model.addAttribute("url","notice/noticeAdmin?"+msgFlag.substring(15));
		}
		else if(msgFlag.substring(0,16).equals("questionUpdateOk")) {
			model.addAttribute("msg", "수정되었습니다");
			model.addAttribute("url","support/question?"+msgFlag.substring(17));
		}
		else if(msgFlag.substring(0,15).equals("productUpdateOk")) {
			model.addAttribute("msg", "상품이수정되었습니다");
			model.addAttribute("url","product/productContent?"+msgFlag.substring(16));
		}


		
		return "include/message";
	}
}
