package com.spring.cjs2108_psj.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs2108_psj.vo.NoticeVO;

public interface NoticeDAO {

	public int totRecCnt();

	public List<NoticeVO> getNoticeAdmin(@Param("startIndexNo")int startIndexNo,@Param("pageSize") int pageSize);

	public void setBoardInput(@Param("vo") NoticeVO vo);

	public NoticeVO getNoticeContent(@Param("idx")int idx);

	public List<NoticeVO> getPreNext(@Param("idx")int idx);

	public void setNoticeUpdate(@Param("vo") NoticeVO vo);

	public void setNoticeServiceDelete(@Param("idx") int idx);

	public void setNoticeDelete(@Param("idx")int idx);

	public void setNoticeLevel(@Param("idx")int idx, @Param("notice")int notice);

}
