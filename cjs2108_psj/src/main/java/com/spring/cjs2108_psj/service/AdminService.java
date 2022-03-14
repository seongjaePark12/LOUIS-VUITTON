package com.spring.cjs2108_psj.service;

import java.util.ArrayList;
import java.util.List;

import com.spring.cjs2108_psj.vo.BookingVO;
import com.spring.cjs2108_psj.vo.ChartVO;
import com.spring.cjs2108_psj.vo.MemberVO;
import com.spring.cjs2108_psj.vo.SimpleVO;

public interface AdminService {

	public int getNewMember();
	
	public int getNewQuestion();
	
	public int getNewBooking();

	public int getNewOrder();

	public int totRecCnt(int level);

	public int totRecCntMid(String mid);

	public ArrayList<MemberVO> getMemberList(int startIndexNo, int pageSize, int level);

	public ArrayList<MemberVO> getMemberListMid(int startIndexNo, int pageSize, String mid);

	public void setLevelUpdate(int idx, int level);

	public void setMemberDelete(int idx); // 전체삭제

	public void setMemberLevel(int idx, int level); // 전체 수정

	public int simpleTotRecCnt(String what);

	public ArrayList<MemberVO> simpleGet(int startIndexNo, int pageSize, String what);

	public void setSimpleInput(SimpleVO vo);

	public void setSimpleDelete(int idx);

	public void setQuestionUpdate(int idx, int anser);

	public void setQuestionDelete(int idx);

	public void setQuestionLevel(int idx, int anser);

	public void setBookingDelete(int idx);

	public int totRecCntBooking();

	public List<BookingVO> getBookingList(int startIndexNo, int pageSize);

	public List<BookingVO> getBookingListName(int startIndexNo, int pageSize, String name);

	public int totRecCntName(String name);

	public void setOrderLevel(String orderIdx, String orderStatus);

	public void baesongNumUp(String orderIdx, String baesongNum);

	public void setOrderStatusUpdate(String orderStatus, String orderIdx);

	public List<ChartVO> yearCash();
	
	public List<ChartVO> monthCash(String year);
	
	public List<ChartVO> dayCash(String year2, String month);

	public List<ChartVO> productNum();

	public List<ChartVO> productmNum(String year);

	public List<ChartVO> productdNum(String year2, String month);

	public List<ChartVO> productCash();

	public ChartVO productSum();





}
