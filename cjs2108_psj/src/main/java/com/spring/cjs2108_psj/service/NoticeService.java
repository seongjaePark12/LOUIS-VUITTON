package com.spring.cjs2108_psj.service;

import java.util.List;

import com.spring.cjs2108_psj.vo.NoticeVO;

public interface NoticeService {

	public int totRecCnt();

	public List<NoticeVO> getNoticeAdmin(int startIndexNo, int pageSize);

	public void imgCheck(String content);

	public void setBoardInput(NoticeVO vo);

	public NoticeVO getNoticeContent(int idx);

	public List<NoticeVO> getPreNext(int idx);

	public void imgCheckUpdate(String content);

	public void imgDelete(String content);

	public void setNoticeUpdate(NoticeVO vo);

	public void setNoticeServiceDelete(int idx);

	public void setNoticeDelete(int idx);

	public void setNoticeLevel(int idx, int notice);

}
