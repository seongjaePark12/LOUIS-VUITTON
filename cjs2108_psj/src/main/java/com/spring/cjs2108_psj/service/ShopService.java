package com.spring.cjs2108_psj.service;

import java.util.List;

import com.spring.cjs2108_psj.vo.BaesongVO;
import com.spring.cjs2108_psj.vo.CartListVO;
import com.spring.cjs2108_psj.vo.ChartVO;
import com.spring.cjs2108_psj.vo.OptionVO;
import com.spring.cjs2108_psj.vo.OrderVO;
import com.spring.cjs2108_psj.vo.ProductVO;
import com.spring.cjs2108_psj.vo.WishVO;

public interface ShopService {

	public List<ProductVO> shopMain(String Lpart, String Mpart, String Spart, String disPriceSw, String mid);

	public ProductVO getShopProduct(int idx);

	public List<OptionVO> getShopOption(int idx);

	public CartListVO cartListProductOptionSearch(String productName, String optionName, String optionColor, String mid);

	public void shopCartUpdate(CartListVO vo);

	public void shopCartInput(CartListVO vo);

	public List<CartListVO> getCartList(String mid);

	public void shopCartDel(int idx);

	public int getCartCount(String mid);

	public CartListVO getCartIdx(String idx);

	public OrderVO getOrderMaxIdx();

	public void setDbOrder(OrderVO vo);

	public void delDbCartList(int cartIdx);

	public int getOrderOIdx(String orderIdx);

	public void setDbBaesong(BaesongVO bVo);

	public void setMemberPointPlus(int point, int savePoint, String mid);

	public List<BaesongVO> getBaesong(String mid);

	public List<BaesongVO> getOrderBaesong(String orderIdx);

	public int totRecCnt(String mid);

	public List<BaesongVO> getDbMyOrder(int startIndexNo, int pageSize, String mid);

	public int totRecCntStatus(String mid, String orderStatus);

	public List<BaesongVO> getOrderStatus(String mid, String orderStatus);

	public int totRecCntOrderCondition(String mid, int conditionDate);

	public List<BaesongVO> orderCondition(String mid, int conditionDate);

	public List<BaesongVO> getOrderStatus2(String mid);

	public int totRecCntAdminStatus(String startJumun, String endJumun, String orderStatus);

	public List<BaesongVO> adminOrderStatus(String startJumun, String endJumun, String orderStatus);

	public List<BaesongVO> getOrderAdminStatus(String startJumun, String endJumun, String orderStatus);

	public void mygumeCheck(String orderIdx);

	public WishVO wishProductSearch(int idx, String mid);

	public void shopWishUpdate(WishVO vo, String mid);

	public void shopWishInput(WishVO vo);

	public WishVO getWishList(String mid, int idx);

	public List<WishVO> getWishListMy(String mid);

	public void wishDel(int idx);

	public int totRecCntStatusWish(String mid);

	public void shopProductWishUpdate(WishVO vo);

	public void optionNumUpdate(int productIdx, String optionName, String optionColor, int optionNum);

	public void mygumeCheck2(String orderIdx);

	public void mygumeCheck3(String orderIdx);

	public void chartInput(OrderVO vo, String date, int optionNum);

	public ChartVO chartSearch(int productIdx, String date, int optionNum);

	public void chartUpdate(OrderVO vo, String date, int optionNum);


}
