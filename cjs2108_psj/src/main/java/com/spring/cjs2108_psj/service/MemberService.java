package com.spring.cjs2108_psj.service;

import java.util.List;

import com.spring.cjs2108_psj.vo.BaesongVO;
import com.spring.cjs2108_psj.vo.BookingVO;
import com.spring.cjs2108_psj.vo.MemberVO;
import com.spring.cjs2108_psj.vo.QuestionReplyVO;
import com.spring.cjs2108_psj.vo.QuestionVO;

public interface MemberService {

	public MemberVO getIdCheck(String mid);

	public MemberVO getEmailCheck(String email);

	public void setMemJoin(MemberVO vo);

	public void setVisitUpdate(String mid);

	public MemberVO getMidConfirm(String name, String email);

	public MemberVO getPwdConfirm(String mid, String name, String email);

	public void setPwdChange(String mid, String pwd);

	public void setMemDelete(String mid);

	public void setMyUpdate(MemberVO vo);

	public List<QuestionVO> getQuestionList(String mid);

	public QuestionVO getQuestionContent(int idx);

	public List<QuestionReplyVO> getQuestionReply(int idx);

	public BookingVO bookingList(String mid);

	public void myBookingInput(BookingVO vo);

	public void myBookingUpdate(BookingVO vo);

	public void myBookingDelete(String mid);

	public int totRecCntQuestion(String mid);

	public List<BaesongVO> getDbMyOrderMain(String mid);

	public int totRecCntQuestionMain(String mid);




}
