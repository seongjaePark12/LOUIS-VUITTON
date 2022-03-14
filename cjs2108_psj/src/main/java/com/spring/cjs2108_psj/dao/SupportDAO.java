package com.spring.cjs2108_psj.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs2108_psj.vo.MemberVO;
import com.spring.cjs2108_psj.vo.NoticeVO;
import com.spring.cjs2108_psj.vo.QuestionReplyVO;
import com.spring.cjs2108_psj.vo.QuestionVO;

public interface SupportDAO {

	public ArrayList<MemberVO> simpleGet(@Param("what")String what);

	public int totRecCnt();

	public List<NoticeVO> getNoticeAdmin(@Param("startIndexNo")int startIndexNo,@Param("pageSize") int pageSize);

	public NoticeVO getNoticeContent(@Param("idx")int idx);

	public List<NoticeVO> getPreNext(@Param("idx")int idx);

	public int totRecCntQuestion(@Param("what")String what);

	public List<QuestionVO> getQuestionList(@Param("startIndexNo")int startIndexNo,@Param("pageSize") int pageSize, @Param("what")String what);

	public void setQuestionInput(@Param("vo")QuestionVO vo);
	
	public QuestionVO getQuestionContent(@Param("idx")int idx);
	
	public List<QuestionReplyVO> getQuestionReply(@Param("idx")int idx);
	
	public void setQuestionUpdate(@Param("vo")QuestionVO vo);

	public void setQuestionDelete(@Param("idx")int idx);
	
	public void setReplyInsert(@Param("rVo")QuestionReplyVO rVo);

	public void setReplyDelete(@Param("replyIdx")int replyIdx);

	public void setReplyInsert2(@Param("rVo")QuestionReplyVO rVo);

	public List<QuestionVO> getQuestionListAnser(@Param("startIndexNo")int startIndexNo,@Param("pageSize") int pageSize, @Param("anser")int anser);

	public List<NoticeVO> getNoticeAdmin1(@Param("startIndexNo")int startIndexNo,@Param("pageSize") int pageSize);

}
