package com.spring.cjs2108_psj.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cjs2108_psj.dao.AdminDAO;
import com.spring.cjs2108_psj.vo.BookingVO;
import com.spring.cjs2108_psj.vo.ChartVO;
import com.spring.cjs2108_psj.vo.MemberVO;
import com.spring.cjs2108_psj.vo.SimpleVO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDAO adminDAO;

	@Override
	public int getNewMember() {
		return adminDAO.getNewMember();
	}
	
	@Override
	public int getNewQuestion() {
		return adminDAO.getNewQuestion();
	}

	@Override
	public int getNewBooking() {
		return adminDAO.getNewBooking();
	}

	@Override
	public int getNewOrder() {
		return adminDAO.getNewOrder();
	}

	@Override
	public int totRecCnt(int level) {
		return adminDAO.totRecCnt(level);
	}
	
	@Override
	public int totRecCntMid(String mid) {
		return adminDAO.totRecCntMid(mid);
	}

	@Override
	public ArrayList<MemberVO> getMemberList(int startIndexNo, int pageSize, int level) {
		return adminDAO.getMemberList(startIndexNo, pageSize, level);
	}

	@Override
	public ArrayList<MemberVO> getMemberListMid(int startIndexNo, int pageSize, String mid) {
		return adminDAO.getMemberListMid(startIndexNo, pageSize, mid);
	}

	@Override
	public void setLevelUpdate(int idx, int level) {
		adminDAO.setLevelUpdate(idx, level);
	}

	@Override
	public void setMemberDelete(int idx) {
		adminDAO.setMemberDelete(idx);
	}

	@Override
	public void setMemberLevel(int idx, int level) {
		adminDAO.setMemberLevel(idx, level);	
	}

	@Override
	public int simpleTotRecCnt(String what) {
		return adminDAO.simpleTotRecCnt(what);
	}

	@Override
	public ArrayList<MemberVO> simpleGet(int startIndexNo, int pageSize, String what) {
		return adminDAO.simpleGet(startIndexNo,pageSize,what);
	}

	@Override
	public void setSimpleInput(SimpleVO vo) {
		adminDAO.setSimpleInput(vo);
	}

	@Override
	public void setSimpleDelete(int idx) {
		adminDAO.setSimpleDelete(idx);
	}

	@Override
	public void setQuestionUpdate(int idx, int anser) {
		adminDAO.setQuestionUpdate(idx,anser);
	}

	@Override
	public void setQuestionDelete(int idx) {
		adminDAO.setQuestionDelete(idx);
	}

	@Override
	public void setQuestionLevel(int idx, int anser) {
		adminDAO.setQuestionLevel(idx,anser);
	}

	@Override
	public void setBookingDelete(int idx) {
		adminDAO.setBookingDelete(idx);		
	}

	@Override
	public int totRecCntBooking() {
		return adminDAO.totRecCntBooking();
	}

	@Override
	public List<BookingVO> getBookingList(int startIndexNo, int pageSize) {
		return adminDAO.getBookingList(startIndexNo,pageSize);
	}

	@Override
	public List<BookingVO> getBookingListName(int startIndexNo, int pageSize, String name) {
		return adminDAO.getBookingListName(startIndexNo,pageSize,name);
	}

	@Override
	public int totRecCntName(String name) {
		return adminDAO.totRecCntName(name);
	}

	@Override
	public void setOrderLevel(String orderIdx, String orderStatus) {
		adminDAO.setOrderLevel(orderIdx,orderStatus);
	}

	@Override
	public void baesongNumUp(String orderIdx, String baesongNum) {
		adminDAO.baesongNumUp(orderIdx,baesongNum);	
	}

	@Override
	public void setOrderStatusUpdate(String orderStatus, String orderIdx) {
		adminDAO.setOrderStatusUpdate(orderStatus,orderIdx);
	}

	@Override
	public List<ChartVO> yearCash() {
		return adminDAO.yearCash();
	}
	
	@Override
	public List<ChartVO> monthCash(String year) {
		return adminDAO.monthCash(year);
	}
	
	@Override
	public List<ChartVO> dayCash(String year2, String month) {
		return adminDAO.dayCash(year2,month);
	}

	@Override
	public List<ChartVO> productNum() {
		return adminDAO.productNum();
	}

	@Override
	public List<ChartVO> productmNum(String year) {
		return adminDAO.productmNum(year);
	}

	@Override
	public List<ChartVO> productdNum(String year2, String month) {
		return adminDAO.productdNum(year2,month);
	}

	@Override
	public List<ChartVO> productCash() {
		return adminDAO.productCash();
	}

	@Override
	public ChartVO productSum() {
		return adminDAO.productSum();
	}


}
