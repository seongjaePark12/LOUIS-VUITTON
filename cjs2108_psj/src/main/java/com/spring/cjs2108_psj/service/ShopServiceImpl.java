package com.spring.cjs2108_psj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cjs2108_psj.dao.ShopDAO;
import com.spring.cjs2108_psj.vo.BaesongVO;
import com.spring.cjs2108_psj.vo.CartListVO;
import com.spring.cjs2108_psj.vo.ChartVO;
import com.spring.cjs2108_psj.vo.OptionVO;
import com.spring.cjs2108_psj.vo.OrderVO;
import com.spring.cjs2108_psj.vo.ProductVO;
import com.spring.cjs2108_psj.vo.WishVO;

@Service
public class ShopServiceImpl implements ShopService {
	@Autowired
	ShopDAO shopDAO;

	@Override
	public List<ProductVO> shopMain(String Lpart, String Mpart, String Spart, String disPriceSw,String mid) {
		return shopDAO.shopMain(Lpart,Mpart,Spart,disPriceSw,mid);
	}

	@Override
	public ProductVO getShopProduct(int idx) {
		return shopDAO.getShopProduct(idx);
	}

	@Override
	public List<OptionVO> getShopOption(int idx) {
		return shopDAO.getShopOption(idx);
	}

	@Override
	public CartListVO cartListProductOptionSearch(String productName, String optionName, String optionColor,String mid) {
		return shopDAO.cartListProductOptionSearch(productName,optionName,optionColor, mid);
	}

	@Override
	public void shopCartUpdate(CartListVO vo) {
		shopDAO.shopCartUpdate(vo);		
	}

	@Override
	public void shopCartInput(CartListVO vo) {
		shopDAO.shopCartInput(vo);	
	}

	@Override
	public List<CartListVO> getCartList(String mid) {
		return shopDAO.getCartList(mid);
	}

	@Override
	public void shopCartDel(int idx) {
		shopDAO.shopCartDel(idx);
	}

	@Override
	public int getCartCount(String mid) {
		return shopDAO.getCartCount(mid);
	}

	@Override
	public CartListVO getCartIdx(String idx) {
		return shopDAO.getCartIdx(idx);
	}

	@Override
	public OrderVO getOrderMaxIdx() {
		return shopDAO.getOrderMaxIdx();
	}

	@Override
	public void setDbOrder(OrderVO vo) {
		shopDAO.setDbOrder(vo);		
	}

	@Override
	public void delDbCartList(int cartIdx) {
		shopDAO.delDbCartList(cartIdx);		
	}

	@Override
	public int getOrderOIdx(String orderIdx) {
		return shopDAO.getOrderOIdx(orderIdx);
	}

	@Override
	public void setDbBaesong(BaesongVO bVo) {
		shopDAO.setDbBaesong(bVo);		
	}

	@Override
	public void setMemberPointPlus(int point, int savePoint, String mid) {
		shopDAO.setMemberPointPlus(point,savePoint,mid);		
	}

	@Override
	public List<BaesongVO> getBaesong(String mid) {
		return shopDAO.getBaesong(mid);
	}

	@Override
	public List<BaesongVO> getOrderBaesong(String orderIdx) {
		return shopDAO.getOrderBaesong(orderIdx);
	}

	@Override
	public int totRecCnt(String mid) {
		return shopDAO.totRecCnt(mid);
	}

	@Override
	public List<BaesongVO> getDbMyOrder(int startIndexNo, int pageSize, String mid) {
		//System.out.println(startIndexNo+":"+pageSize+":"+mid);
		return shopDAO.getDbMyOrder(startIndexNo, pageSize, mid);
	}

	@Override
	public int totRecCntStatus(String mid, String orderStatus) {
		return shopDAO.totRecCntStatus(mid, orderStatus);
	}

	@Override
	public List<BaesongVO> getOrderStatus(String mid, String orderStatus) {
		return shopDAO.getOrderStatus(mid, orderStatus);
	}

	@Override
	public int totRecCntOrderCondition(String mid, int conditionDate) {
		return shopDAO.totRecCntOrderCondition(mid, conditionDate);
	}

	@Override
	public List<BaesongVO> orderCondition(String mid, int conditionDate) {
		return shopDAO.orderCondition(mid, conditionDate);
	}

	@Override
	public List<BaesongVO> getOrderStatus2(String mid) {
		return shopDAO.getOrderStatus2(mid);
	}

	@Override
	public int totRecCntAdminStatus(String startJumun, String endJumun, String orderStatus) {
		return shopDAO.totRecCntAdminStatus(startJumun,endJumun,orderStatus);
	}

	@Override
	public List<BaesongVO> adminOrderStatus(String startJumun, String endJumun, String orderStatus) {
		return shopDAO.adminOrderStatus(startJumun, endJumun, orderStatus);
	}

	@Override
	public List<BaesongVO> getOrderAdminStatus(String startJumun, String endJumun, String orderStatus) {
		return shopDAO.getOrderAdminStatus(startJumun,endJumun,orderStatus);
	}

	@Override
	public void mygumeCheck(String orderIdx) {
		shopDAO.mygumeCheck(orderIdx);
	}

	@Override
	public WishVO wishProductSearch(int idx, String mid) {
		return shopDAO.wishProductSearch(idx, mid);
	}

	@Override
	public void shopWishUpdate(WishVO vo,String mid) {
		shopDAO.shopWishUpdate(vo,mid);
	}

	@Override
	public void shopWishInput(WishVO vo) {
		shopDAO.shopWishInput(vo);
	}

	@Override
	public WishVO getWishList(String mid,int idx) {
		return shopDAO.getWishList(mid,idx);
	}

//	@Override
//	public List<WishVO> getWishListAll(String mid,int idx) {
//		return shopDAO.getWishListAll(mid,idx);
//	}

	@Override
	public List<WishVO> getWishListMy(String mid) {
		return shopDAO.getWishListMy(mid);
	}

	@Override
	public void wishDel(int idx) {
		shopDAO.wishDel(idx);		
	}

	@Override
	public int totRecCntStatusWish(String mid) {
		return shopDAO.totRecCntStatusWish(mid);
	}

	@Override
	public void shopProductWishUpdate(WishVO vo) {
		shopDAO.shopProductWishUpdate(vo);
	}

	@Override
	public void optionNumUpdate(int productIdx, String optionName, String optionColor, int optionNum) {
		shopDAO.optionNumUpdate(productIdx,optionName,optionColor,optionNum);
	}

	@Override
	public void mygumeCheck2(String orderIdx) {
		shopDAO.mygumeCheck2(orderIdx);
	}

	@Override
	public void mygumeCheck3(String orderIdx) {
		shopDAO.mygumeCheck3(orderIdx);
	}
	
	@Override
	public ChartVO chartSearch(int productIdx, String date, int optionNum) {
		return shopDAO.chartSearch(productIdx,date,optionNum);
	}

	@Override
	public void chartInput(OrderVO vo, String date, int optionNum) {
		shopDAO.chartInput(vo,date,optionNum);		
	}

	@Override
	public void chartUpdate(OrderVO vo, String date, int optionNum) {
		shopDAO.chartUpdate(vo,date,optionNum);	
	}


}
