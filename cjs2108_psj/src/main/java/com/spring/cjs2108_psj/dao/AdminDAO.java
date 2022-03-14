package com.spring.cjs2108_psj.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs2108_psj.vo.BookingVO;
import com.spring.cjs2108_psj.vo.ChartVO;
import com.spring.cjs2108_psj.vo.MemberVO;
import com.spring.cjs2108_psj.vo.SimpleVO;

public interface AdminDAO {

	public int getNewMember();
	
	public int getNewQuestion();

	public int getNewBooking();

	public int getNewOrder();
	
	public int totRecCnt(@Param("level") int level);

	public int totRecCntMid(@Param("mid")String mid);

	public ArrayList<MemberVO> getMemberList(@Param("startIndexNo")int startIndexNo, @Param("pageSize")int pageSize, @Param("level")int level);

	public ArrayList<MemberVO> getMemberListMid(@Param("startIndexNo")int startIndexNo, @Param("pageSize")int pageSize, @Param("mid")String mid);

	public void setLevelUpdate(@Param("idx") int idx, @Param("level") int level);

	public void setMemberDelete(@Param("idx") int idx);

	public void setMemberLevel(@Param("idx") int idx, @Param("level") int level);

	public int simpleTotRecCnt(@Param("what")String what);

	public ArrayList<MemberVO> simpleGet(@Param("startIndexNo")int startIndexNo, @Param("pageSize")int pageSize, @Param("what")String what);

	public void setSimpleInput(@Param("vo")SimpleVO vo);

	public void setSimpleDelete(@Param("idx") int idx);

	public void setQuestionUpdate(@Param("idx")int idx, @Param("anser")int anser);

	public void setQuestionDelete(@Param("idx")int idx);

	public void setQuestionLevel(@Param("idx")int idx, @Param("anser")int anser);

	public void setBookingDelete(@Param("idx")int idx);

	public int totRecCntBooking();

	public List<BookingVO> getBookingList(@Param("startIndexNo")int startIndexNo,@Param("pageSize") int pageSize);

	public List<BookingVO> getBookingListName(@Param("startIndexNo")int startIndexNo,@Param("pageSize") int pageSize,@Param("name") String name);

	public int totRecCntName(@Param("name")String name);

	public void setOrderLevel(@Param("orderIdx")String orderIdx, @Param("orderStatus")String orderStatus);

	public void baesongNumUp(@Param("orderIdx")String orderIdx,@Param("baesongNum") String baesongNum);

	public void setOrderStatusUpdate(@Param("orderStatus")String orderStatus, @Param("orderIdx")String orderIdx);

	public List<ChartVO> yearCash();

	public List<ChartVO> monthCash(@Param("year")String year);

	public List<ChartVO> dayCash(@Param("year2")String year2, @Param("month")String month);

	public List<ChartVO> productNum();

	public List<ChartVO> productmNum(@Param("year")String year);

	public List<ChartVO> productdNum(@Param("year2")String year2, @Param("month")String month);

	public List<ChartVO> productCash();

	public ChartVO productSum();





}
