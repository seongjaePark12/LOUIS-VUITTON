package com.spring.cjs2108_psj;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.cjs2108_psj.service.MemberService;
import com.spring.cjs2108_psj.service.ShopService;
import com.spring.cjs2108_psj.vo.BaesongVO;
import com.spring.cjs2108_psj.vo.CartListVO;
import com.spring.cjs2108_psj.vo.ChartVO;
import com.spring.cjs2108_psj.vo.MemberVO;
import com.spring.cjs2108_psj.vo.OptionVO;
import com.spring.cjs2108_psj.vo.OrderVO;
import com.spring.cjs2108_psj.vo.ProductVO;
import com.spring.cjs2108_psj.vo.WishVO;

@Controller
@RequestMapping("/shop")
public class UserShopController {
	String msgFlag="";
	
	@Autowired
	ShopService shopService;
	
	@Autowired
	MemberService memberService;
	
	// 상품목록 출력하기
	@RequestMapping(value="/userShop", method = RequestMethod.GET)
	public String userShopGet(@RequestParam(name="Lpart", defaultValue="", required=false) String Lpart,
			@RequestParam(name="Mpart", defaultValue="", required=false) String Mpart,
			@RequestParam(name="Spart", defaultValue="", required=false) String Spart,
			@RequestParam(name="disPriceSw", defaultValue="", required=false) String disPriceSw,
			Model model,HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		List<ProductVO> vos = shopService.shopMain(Lpart,Mpart,Spart,disPriceSw,mid);
		model.addAttribute("vos", vos);
		model.addAttribute("Lpart", Lpart);
		model.addAttribute("Mpart", Mpart);
		model.addAttribute("Spart", Spart);
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
		model.addAttribute("level", level);
		
		
		return "userShop/userShop";
	}
	
	// 상품목록 인기순 출력하기
	@RequestMapping(value="userPop", method = RequestMethod.GET)
	public String shopListPopGet(String Lpart,String Mpart,String Spart,Model model) {
		return "redirect:/shop/userShop?Lpart="+Lpart+"&Mpart="+Mpart+"&Spart="+Spart+"&disPriceSw=POP";
	}
	
	// 상품목록 가격높은순 출력하기
	@RequestMapping(value="userRich", method = RequestMethod.GET)
	public String shopListRichGet(String Lpart,String Mpart,String Spart,Model model) {
		return "redirect:/shop/userShop?Lpart="+Lpart+"&Mpart="+Mpart+"&Spart="+Spart+"&disPriceSw=HIGH";
	}
	
	// 상품목록 가격높은순 출력하기
	@RequestMapping(value="userPool", method = RequestMethod.GET)
	public String shopListPoolGet(String Lpart,String Mpart,String Spart,Model model) {
		return "redirect:/shop/userShop?Lpart="+Lpart+"&Mpart="+Mpart+"&Spart="+Spart+"&disPriceSw=LOW";
	}
	
	//상품내역 상세보기
	@RequestMapping(value="/userShopContent", method=RequestMethod.GET)
	public String dbShopContentGet(int idx, Model model,HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		WishVO wishVo = shopService.getWishList(mid,idx);
		model.addAttribute("wishVo", wishVo);
		
		ProductVO productVo = shopService.getShopProduct(idx); 			// 상품 상세 정보 불러오기
		List<OptionVO> optionVos = shopService.getShopOption(idx); 	// 옵션 정보 모두 가져오기(두개이상이 올수 있기에 배열(리스트)처리한다.)
		model.addAttribute("productVo", productVo);
		model.addAttribute("optionVos", optionVos);
		return "userShop/userShopContent";
	}
	
	//상품내역에서 장바구니로
	@RequestMapping(value="/userShopContent", method=RequestMethod.POST)
	public String dbShopContentPost(CartListVO vo, HttpSession session) {
		String mid = (String)session.getAttribute("sMid");
		CartListVO resVo = shopService.cartListProductOptionSearch(vo.getProductName(), vo.getOptionName(),vo.getOptionColor(),mid);
		if(resVo != null) {		// 기존에 구매한적이 있다면....update 시킨다.
			String[] voOptionNums = vo.getOptionNum().split(",");     // 앞에서 넘어온 vo안의 옵션리스트(배열로 넘어온다. 따라서 자료(옵션)가 여러개라면 ','로 들어있기에 ','로 분리시켜주었다.)
			String[] resOptionNums = resVo.getOptionNum().split(","); // 기존 DB에 저장되어 있던 장바구니 : resVo
			int[] nums = new int[99];		// 기존옵션과 지금것을 함께 다시 저장시키기 위한 작업
			String strNums = "";
			for(int i=0; i<voOptionNums.length; i++) {
				nums[i] += (Integer.parseInt(voOptionNums[i]) + Integer.parseInt(resOptionNums[i]));
				strNums += nums[i];
				if(i < nums.length - 1) strNums += ",";
			}
			vo.setOptionNum(strNums);
			shopService.shopCartUpdate(vo);
		}
		else {			// 기존에 구매한적이 없다면....insert시킨다.
			shopService.shopCartInput(vo);
		}
		return "redirect:/shop/userBag";
	}
	
	// 장바구니 홈
	@RequestMapping(value="/userBag", method = RequestMethod.GET)
	public String myBagGet(HttpSession session, CartListVO vo, Model model) {
		String mid = (String) session.getAttribute("sMid");
		int vvvi = shopService.getCartCount(mid);
		List<CartListVO> vos = shopService.getCartList(mid);
		model.addAttribute("cartListVos", vos);
		model.addAttribute("vvvi", vvvi);
		session.setAttribute("sBagCount",vvvi);
		return "userShop/userBag";
	}
		
	// 장바구니 물품 삭제
	@ResponseBody
	@RequestMapping(value="/shopCartDel", method = RequestMethod.POST)
	public String shopCartDelPost(int idx) {
		shopService.shopCartDel(idx);
		return"";
	}
	
	
	// 카트에서 주문한 품목들을 주문테이블에 저장시켜준다.
	@RequestMapping(value="/userBag", method=RequestMethod.POST)
	public String userBagPost(HttpServletRequest request, Model model, HttpSession session) {
		String[] idxChecked = request.getParameterValues("idxChecked");
		
		CartListVO cartVo = new CartListVO();
		List<OrderVO> orderVos = new ArrayList<OrderVO>();
		
		for(String idx : idxChecked) {
			cartVo = shopService.getCartIdx(idx);
			OrderVO orderVo = new OrderVO();
			orderVo.setProductIdx(cartVo.getProductIdx());
			orderVo.setProductName(cartVo.getProductName());
			orderVo.setRealPrice(cartVo.getRealPrice());
			orderVo.setMainPrice(cartVo.getMainPrice());
			orderVo.setPoint(cartVo.getPoint());
			orderVo.setDisPrice(cartVo.getDisPrice());
			orderVo.setProductMainImg(cartVo.getProductMainImg());
			orderVo.setOptionName(cartVo.getOptionName());
			orderVo.setOptionColor(cartVo.getOptionColor());
			orderVo.setOptionNum(cartVo.getOptionNum());
			orderVo.setTotalPrice(cartVo.getTotalPrice());
			orderVo.setCartIdx(cartVo.getIdx());
			orderVos.add(orderVo);
		}
		session.setAttribute("orderVos", orderVos); // 주문에서 보여준후 다시 그대로를 담아서 결제창으로 보내기에 session처리했다.
		MemberVO memberVo = memberService.getIdCheck(session.getAttribute("sMid").toString());
		model.addAttribute("memberVo", memberVo);
		
		OrderVO maxIdx = shopService.getOrderMaxIdx();
		int idx = 1;
		if(maxIdx != null) idx = maxIdx.getMaxIdx() + 1;
		
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String orderIdx = sdf.format(today) + idx;
		model.addAttribute("orderIdx", orderIdx);
		
		return "userShop/userOrder";  // 결재 및 주문서 작성 jsp호출
	}
	
	// 주문내역 dbOrder/dbBaesong 테이블에 저장하기
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/orderInput", method=RequestMethod.POST)
	public String orderInputPost(HttpSession session, OrderVO orderVo, BaesongVO bVo, int lastprice, int savePoint) {
		bVo.setOrderTotalPrice(lastprice);
		List<OrderVO> orderVos = (List<OrderVO>) session.getAttribute("orderVos");
		for(OrderVO vo : orderVos) {
			vo.setIdx(Integer.parseInt(bVo.getOrderIdx().substring(8))); // 주문테이블에 고유번호를 셋팅한다.	
			vo.setOrderIdx(bVo.getOrderIdx());           // 주문번호를 주문테이블의 주문번호필드에 지정처리한다.
			vo.setMid(bVo.getMid());
			String[] optionNames = vo.getOptionName().split(","); // 재고를 빼기위한 작업
			String[] optionColors = vo.getOptionColor().split(",");
			String[] optionNums = vo.getOptionNum().split(",");
			for(int i=0; i<optionNames.length; i++) {
				// 재고 업데이트
				shopService.optionNumUpdate(vo.getProductIdx(),optionNames[i],optionColors[i],Integer.parseInt(optionNums[i])); // 재고 빼주기
				// 제품별 판매금액 + 마진금액
				LocalDateTime time = LocalDateTime.now();
				LocalDate datenow = time.toLocalDate();
				String date = datenow.toString();
				ChartVO resVo = shopService.chartSearch(vo.getProductIdx(),date,Integer.parseInt(optionNums[i]));
				if(resVo != null) {
					shopService.chartUpdate(vo,date,Integer.parseInt(optionNums[i]));
				}
				else {
					shopService.chartInput(vo,date,Integer.parseInt(optionNums[i]));
					
				}
			}
			shopService.setDbOrder(vo);                 // 주문내용을 주문테이블에 저장.
			shopService.delDbCartList(vo.getCartIdx()); // 주문이 완료되었기에 장바구니에서 주문한 내역을 삭체처리한다.
		}
		bVo.setOIdx(shopService.getOrderOIdx(bVo.getOrderIdx()));		// 주문테이블의 고유번호를 가져온다.
		shopService.setDbBaesong(bVo);  // 배송내용을 배송테이블(dbBaesong)에 저장
		
		shopService.setMemberPointPlus(bVo.getPoint(),savePoint, bVo.getMid());	// 회원테이블에 포인트 적립하기
		return "redirect:/msg/orderInputOk";
	}
	
	// 주문 완료후 주문(배송정보)된 내역 보여주는 폼
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/userOrderConfirm", method=RequestMethod.GET)
	public String dbOrderConfirmGet(HttpSession session, Model model) {
		List<OrderVO> vos = (List<OrderVO>) session.getAttribute("orderVos");
		List<BaesongVO> bVos = shopService.getBaesong(vos.get(0).getMid());
		model.addAttribute("vos", vos);
		model.addAttribute("bVo", bVos.get(0));
		return "userShop/userOrderConfirm";
	}
	
	// 좋아요 누름
	@ResponseBody
	@RequestMapping(value="/heartOn", method=RequestMethod.POST)
	public String heartOnGet(WishVO vo, HttpSession session) {
		String mid = (String)session.getAttribute("sMid");
		WishVO resVo = shopService.wishProductSearch(vo.getProductIdx(), mid);
		if(resVo != null) {		// 기존에 누른적이 있다면....update 시킨다.
			shopService.shopWishUpdate(vo,mid);
			shopService.shopProductWishUpdate(vo);
		}
		else {			// 기존에 누른적이 없다면....insert시킨다.
			shopService.shopWishInput(vo);
			shopService.shopProductWishUpdate(vo);
		}
		int ww = shopService.totRecCntStatusWish(mid);
		session.setAttribute("sWishCount", ww);
		return "";
	}
}


