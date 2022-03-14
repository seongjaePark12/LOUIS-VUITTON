package com.spring.cjs2108_psj;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/mail")
public class MailController {
	@Autowired
	JavaMailSender mailSender;
	
	// 회원가입 메일
	@RequestMapping(value="/joinSend/{email}/{mid}/", method = RequestMethod.GET)
	public String memLoginGet(@PathVariable String email , @PathVariable String mid) {
		try {
			String fromMail = "LouisVuittonPSJ@gmail.com";
			String title = "My LV 계정이 생성되었습니다";
			String name1 = mid;
			// 메세지를 변환시켜서 보관함에 저장하기위한 준비를 한다
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			// 메일 보관함에 회원이 보낸 메세지를 모두 저장시켜준다
			messageHelper.setFrom(fromMail);
			messageHelper.setTo(email);
			messageHelper.setSubject(title);
			// 메세지 내용 편집 후 보관함에 저장처리한다
			String content = "<div align='center'>";
			content += "<br><div><img src=\"cid:2.png\" width='300px' align='center'/></div><br><br>";
			content += "<div>"+name1+"님</div><br>";
			content += "<div>루이 비통의 세계에 오신 것을 환영합니다.</div>";
			content += "<div>고객님의 MyLV 계정 생성이 완료되었습니다.</div>";
			content += "<div>모든 기기에서 다음의 서비스를 모두 이용하실 수 있습니다.</div><br><br>";
			content += "<div>• 온라인 주문 조회, 과거 구매 내역 및 전자 영수증 확인</div>";
			content += "<div>• 개인 정보 관리</div>";
			content += "<div>• 최신 루이 비통 디지털 뉴스레터 수신</div>";
			content += "<div>• 나만의 위시리스트 저장</div><br><br>";
			content += "<div>고객님의 보안 계정에 등록된 정보는 다음과 같습니다:</div>";
			content += "<div>사용자 이메일:"+email+"</div>";
			content += "<hr><div><img src=\"cid:mail.png\" width='600px' align='center'/></div><br><br>";
			content += "<div  style='font-size:20px'><a href='http://218.236.203.3:9090/cjs2108_psj/'>접속주소</a>에서 루이 비통의 세계를 더 자세히 경험해보세요</div>";
			content += "</div>";
			messageHelper.setText(content, true);
			FileSystemResource file = new FileSystemResource("D:\\javaCourse\\SpringFrameWork\\works\\cjs2108_psj\\src\\main\\webapp\\resources\\images\\mail\\mail.png");
			FileSystemResource file2 = new FileSystemResource("D:\\javaCourse\\SpringFrameWork\\works\\cjs2108_psj\\src\\main\\webapp\\resources\\images\\mail\\2.png");
			messageHelper.addInline("mail.png", file);
			messageHelper.addInline("2.png", file2);
			
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return "redirect:/msg/memJoinOk";
	}
	// 임시비밀번호 발급해서 메일로보냄
	@RequestMapping(value="/pwdConfirmSend/{email}/{content}/", method = RequestMethod.GET)
	public String pwdConfirmSendGet(@PathVariable String email, @PathVariable String content) {
		try {
			String fromMail = "LouisVuittonPSJ@gmail.com";
			String title = ">>임시 비밀번호를 발급 하였습니다<<";
			String pwd = content;
			content = "LouisVuitton에서 발송한 매일입니다.\n 아래 임시 비밀번호를 보내오니 사이트에 접속 하셔서 비밀번호를 변경하세요 \n";
			
			// 메세지를 변환시켜서 보관함에 저장하기위한 준비를 한다
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		
			// 메일 보관함에 회원이 보낸 메세지를 모두 저장시켜준다
			messageHelper.setFrom(fromMail);
			messageHelper.setTo(email);
			messageHelper.setSubject(title);
			
			// 메세지 내용 편집 후 보관함에 저장처리한다
			content = content.replace("\n", "<br>");
			content += "<br><div><img src=\"cid:2.png\" width='300px' align='center'/></div><br><br>";
			content += "<div>임시 비밀번호가 발급 되었습니다.</div>";
			content += "<br><hr><h3>임시 비밀번호 : <font color='red'>"+pwd+"</font></h3><hr><br>";
			content += "<div>고객님의 MyLV 비밀번호가 변경되었습니다.</div>";
			content += "<div>임시 비밀번호로 로그인 후 수정해주세요</div>";
			content += "<hr><div><img src=\"cid:mail2.png\" width='600px' align='center'/></div><br><br>";
			content += "<div  style='font-size:20px'><a href='http://218.236.203.3:9090/cjs2108_psj/'>접속주소</a>에서 로그인을 시도해주세요</div>";
			content += "</div>";
			messageHelper.setText(content, true);
			FileSystemResource file = new FileSystemResource("D:\\javaCourse\\SpringFrameWork\\works\\cjs2108_psj\\src\\main\\webapp\\resources\\images\\mail\\mail2.png");
			FileSystemResource file2 = new FileSystemResource("D:\\javaCourse\\SpringFrameWork\\works\\cjs2108_psj\\src\\main\\webapp\\resources\\images\\mail\\2.png");
			messageHelper.addInline("mail2.png", file);
			messageHelper.addInline("2.png", file2);
			
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return "redirect:/msg/pwdConfirmOk";
	}

}
