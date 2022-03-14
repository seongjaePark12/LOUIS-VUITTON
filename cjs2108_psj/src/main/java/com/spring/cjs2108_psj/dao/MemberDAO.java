package com.spring.cjs2108_psj.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs2108_psj.vo.BaesongVO;
import com.spring.cjs2108_psj.vo.BookingVO;
import com.spring.cjs2108_psj.vo.MemberVO;
import com.spring.cjs2108_psj.vo.QuestionReplyVO;
import com.spring.cjs2108_psj.vo.QuestionVO;

public interface MemberDAO {

	public MemberVO getIdCheck(@Param("mid") String mid);

	public MemberVO getEmailCheck(@Param("email") String email);

	public void setMemJoin(@Param("vo") MemberVO vo);

	public void setVisitUpdate(@Param("mid") String mid);

	public MemberVO getMidConfirm(@Param("name") String name, @Param("email") String email);

	public MemberVO getPwdConfirm(@Param("mid") String mid, @Param("name") String name, @Param("email") String email);

	public void setPwdChange(@Param("mid") String mid, @Param("pwd") String pwd);

	public void setMemDelete(@Param("mid") String mid);

	public void setMyUpdate(@Param("vo") MemberVO vo);

	public List<QuestionVO> getQuestionList(@Param("mid")String mid);

	public QuestionVO getQuestionContent(@Param("idx")int idx);

	public List<QuestionReplyVO> getQuestionReply(@Param("idx")int idx);

	public BookingVO bookingList(@Param("mid")String mid);

	public void myBookingInput(@Param("vo")BookingVO vo);

	public void myBookingUpdate(@Param("vo")BookingVO vo);

	public void myBookingDelete(@Param("mid")String mid);

	public int totRecCntQuestion(@Param("mid")String mid);

	public List<BaesongVO> getDbMyOrderMain(@Param("mid")String mid);

	public int totRecCntQuestionMain(@Param("mid")String mid);



}
