package com.spring.cjs2108_psj.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs2108_psj.vo.BaesongVO;
import com.spring.cjs2108_psj.vo.CartListVO;
import com.spring.cjs2108_psj.vo.ChartVO;
import com.spring.cjs2108_psj.vo.OptionVO;
import com.spring.cjs2108_psj.vo.OrderVO;
import com.spring.cjs2108_psj.vo.ProductVO;
import com.spring.cjs2108_psj.vo.WishVO;

public interface ShopDAO {

	public List<ProductVO> shopMain(@Param("Lpart") String Lpart,@Param("Mpart") String Mpart,@Param("Spart") String Spart,@Param("disPriceSw") String disPriceSw,@Param("mid") String mid);

	public ProductVO getShopProduct(@Param("idx")int idx);

	public List<OptionVO> getShopOption(@Param("idx")int idx);

	public CartListVO cartListProductOptionSearch(@Param("productName")String productName,@Param("optionName") String optionName, @Param("optionColor")String optionColor, @Param("mid")String mid);

	public void shopCartUpdate(@Param("vo")CartListVO vo);

	public void shopCartInput(@Param("vo")CartListVO vo);

	public List<CartListVO> getCartList(@Param("mid")String mid);

	public void shopCartDel(@Param("idx")int idx);

	public int getCartCount(@Param("mid")String mid);

	public CartListVO getCartIdx(@Param("idx")String idx);

	public OrderVO getOrderMaxIdx();

	public void setDbOrder(@Param("vo")OrderVO vo);

	public void delDbCartList(@Param("cartIdx")int cartIdx);

	public int getOrderOIdx(@Param("orderIdx")String orderIdx);

	public void setDbBaesong(@Param("bVo")BaesongVO bVo);

	public void setMemberPointPlus(@Param("point")int point, @Param("savePoint")int savePoint, @Param("mid")String mid);

	public List<BaesongVO> getBaesong(@Param("mid")String mid);

	public List<BaesongVO> getOrderBaesong(@Param("orderIdx")String orderIdx);

	public int totRecCnt(@Param("mid")String mid);

	public List<BaesongVO> getDbMyOrder(@Param("startIndexNo")int startIndexNo, @Param("pageSize")int pageSize, @Param("mid")String mid);

	public int totRecCntStatus(@Param("mid")String mid, @Param("orderStatus")String orderStatus);

	public List<BaesongVO> getOrderStatus(@Param("mid")String mid, @Param("orderStatus")String orderStatus);

	public List<BaesongVO> orderCondition(@Param("mid")String mid, @Param("conditionDate")int conditionDate);

	public int totRecCntOrderCondition(@Param("mid")String mid, @Param("conditionDate")int conditionDate);

	public List<BaesongVO> getOrderStatus2(@Param("mid")String mid);

	public int totRecCntAdminStatus(@Param("startJumun")String startJumun, @Param("endJumun")String endJumun,@Param("orderStatus") String orderStatus);

	public List<BaesongVO> adminOrderStatus(@Param("startJumun")String startJumun,@Param("endJumun") String endJumun, @Param("orderStatus")String orderStatus);

	public List<BaesongVO> getOrderAdminStatus(@Param("startJumun")String startJumun, @Param("endJumun")String endJumun, @Param("orderStatus")String orderStatus);

	public void mygumeCheck(@Param("orderIdx")String orderIdx);

	public WishVO wishProductSearch(@Param("idx")int idx, @Param("mid")String mid);

	public void shopWishUpdate(@Param("vo")WishVO vo, @Param("mid")String mid);

	public void shopWishInput(@Param("vo")WishVO vo);

	public WishVO getWishList(@Param("mid")String mid,@Param("idx")int idx);

	public List<WishVO> getWishListMy(@Param("mid")String mid);

	public void wishDel(@Param("idx")int idx);

	public int totRecCntStatusWish(@Param("mid")String mid);

	public void shopProductWishUpdate(@Param("vo")WishVO vo);

	public void optionNumUpdate(@Param("vo")OrderVO vo);

	public void optionNumUpdate(@Param("productIdx")int productIdx, @Param("optionName")String optionName, @Param("optionColor")String optionColor,@Param("optionNum") int optionNum);

	public void mygumeCheck2(@Param("orderIdx")String orderIdx);

	public void mygumeCheck3(@Param("orderIdx")String orderIdx);

	public void chartInput(@Param("vo")OrderVO vo, @Param("date")String date,@Param("optionNum") int optionNum);

	public ChartVO chartSearch(@Param("productIdx")int productIdx, @Param("date")String date,@Param("optionNum") int optionNum);

	public void chartUpdate(@Param("vo")OrderVO vo, @Param("date")String date,@Param("optionNum") int optionNum);

}
