package com.spring.cjs2108_psj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cjs2108_psj.dao.MemberDAO;
import com.spring.cjs2108_psj.vo.BaesongVO;
import com.spring.cjs2108_psj.vo.BookingVO;
import com.spring.cjs2108_psj.vo.MemberVO;
import com.spring.cjs2108_psj.vo.QuestionReplyVO;
import com.spring.cjs2108_psj.vo.QuestionVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO memberDAO;

	@Override
	public MemberVO getIdCheck(String mid) {
		return memberDAO.getIdCheck(mid);
	}

	@Override
	public MemberVO getEmailCheck(String email) {
		return memberDAO.getEmailCheck(email);
	}

	@Override
	public void setMemJoin(MemberVO vo) {
		memberDAO.setMemJoin(vo);
	}

	@Override
	public void setVisitUpdate(String mid) {
		memberDAO.setVisitUpdate(mid);
	}

	@Override
	public MemberVO getMidConfirm(String name, String email) {
		return memberDAO.getMidConfirm(name, email);
	}

	@Override
	public MemberVO getPwdConfirm(String mid, String name, String email) {
		return memberDAO.getPwdConfirm(mid, name, email);
	}

	@Override
	public void setPwdChange(String mid, String pwd) {
		memberDAO.setPwdChange(mid, pwd);
	}

	@Override
	public void setMemDelete(String mid) {
		memberDAO.setMemDelete(mid);
	}

	@Override
	public void setMyUpdate(MemberVO vo) {
		memberDAO.setMyUpdate(vo);
	}

	@Override
	public List<QuestionVO> getQuestionList(String mid) {
		return memberDAO.getQuestionList(mid);
	}

	@Override
	public QuestionVO getQuestionContent(int idx) {
		return memberDAO.getQuestionContent(idx);
	}

	@Override
	public List<QuestionReplyVO> getQuestionReply(int idx) {
		return memberDAO.getQuestionReply(idx);
	}

	@Override
	public BookingVO bookingList(String mid) {
		return memberDAO.bookingList(mid);
	}

	@Override
	public void myBookingInput(BookingVO vo) {
		memberDAO.myBookingInput(vo);	
	}

	@Override
	public void myBookingUpdate(BookingVO vo) {
		memberDAO.myBookingUpdate(vo);
	}

	@Override
	public void myBookingDelete(String mid) {
		memberDAO.myBookingDelete(mid);
	}

	@Override
	public int totRecCntQuestion(String mid) {
		return memberDAO.totRecCntQuestion(mid);
	}

	@Override
	public List<BaesongVO> getDbMyOrderMain(String mid) {
		return memberDAO.getDbMyOrderMain(mid);
	}

	@Override
	public int totRecCntQuestionMain(String mid) {
		return memberDAO.totRecCntQuestionMain(mid);
	}


}
