package com.spring.cjs2108_psj.service;

import java.util.ArrayList;
import java.util.List;

import com.spring.cjs2108_psj.vo.MemberVO;
import com.spring.cjs2108_psj.vo.NoticeVO;
import com.spring.cjs2108_psj.vo.QuestionReplyVO;
import com.spring.cjs2108_psj.vo.QuestionVO;

public interface SupportService {

	public ArrayList<MemberVO> simpleGet(String what);

	public int totRecCnt();

	public List<NoticeVO> getNoticeAdmin(int startIndexNo, int pageSize);

	public NoticeVO getNoticeContent(int idx);

	public List<NoticeVO> getPreNext(int idx);

	public int totRecCntQuestion(String what);

	public List<QuestionVO> getQuestionList(int startIndexNo, int pageSize, String what);

	public void imgCheck(String content);

	public void setQuestionInput(QuestionVO vo);

	public QuestionVO getQuestionContent(int idx);

	public List<QuestionReplyVO> getQuestionReply(int idx);

	public void imgCheckUpdate(String content);

	public void imgDelete(String content);

	public void setQuestionUpdate(QuestionVO vo);

	public void setQuestionDelete(int idx);

	public void setReplyInsert(QuestionReplyVO rVo);

	public void setReplyDelete(int replyIdx);

	public void setReplyInsert2(QuestionReplyVO rVo);

	public List<NoticeVO> getNoticeAdmin1(int startIndexNo, int pageSize);

}
