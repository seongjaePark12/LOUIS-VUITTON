package com.spring.cjs2108_psj;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.cjs2108_psj.service.ProductService;
import com.spring.cjs2108_psj.service.ShopService;
import com.spring.cjs2108_psj.vo.CategoryVO;
import com.spring.cjs2108_psj.vo.OptionVO;
import com.spring.cjs2108_psj.vo.ProductVO;

@Controller
@RequestMapping("/product")
public class ProductController {
	String msgFlag="";
	
	@Autowired
	ProductService productService;
	@Autowired
	ShopService shopService;
	
	// 대분류목록 출력하기
	@RequestMapping(value="/categoryMain", method = RequestMethod.GET)
	public String categoryMainGet(Model model) {
		List<CategoryVO> mainVos = productService.getCategoryMain();
		model.addAttribute("mainVos", mainVos);
		return "admin/product/categoryMain";
	}
	// 중분류목록 출력하기
	@RequestMapping(value="/categoryMiddle", method = RequestMethod.GET)
	public String categoryMiddleGet(Model model) {
		List<CategoryVO> middleVos = productService.getCategoryMiddle();
		List<CategoryVO> mainVos = productService.getCategoryMain();
		model.addAttribute("mainVos", mainVos);
		model.addAttribute("middleVos", middleVos);
		return "admin/product/categoryMiddle";
	}
	
	// 소분류목록 출력하기
	@RequestMapping(value="/categorySub", method = RequestMethod.GET)
	public String categorySubGet(Model model) {
		List<CategoryVO> middleVos = productService.getCategoryMiddle();
		List<CategoryVO> mainVos = productService.getCategoryMain();
		List<CategoryVO> subVos = productService.getCategorySub();
		model.addAttribute("mainVos", mainVos);
		model.addAttribute("middleVos", middleVos);
		model.addAttribute("subVos", subVos);
		return "admin/product/categorySub";
	}
	
	// 대분류 선택시 중분류명 가져오기
	@ResponseBody
	@RequestMapping(value="/categoryMiddleName", method = RequestMethod.POST)
	public List<CategoryVO> categoryMiddleNamePost(String categoryMainCode) {
		return productService.getCategoryMiddleName(categoryMainCode);
	}
	
	// 중분류 선택시 소분류명 가져오기
	@ResponseBody
	@RequestMapping(value="/categorySubName", method = RequestMethod.POST)
	public List<CategoryVO> categorySubNamePost(String categoryMainCode, String categoryMiddleCode) {
		return productService.getCategorySubName(categoryMainCode, categoryMiddleCode);
	}
	
	// 대분류 등록하기
	@ResponseBody
	@RequestMapping(value="/categoryMainInput", method = RequestMethod.POST)
	public String categoryMainInputPost(CategoryVO vo) {
		CategoryVO imsiVo  = productService.getCategoryMainOne(vo.getCategoryMainCode(), vo.getCategoryMainName());
		if(imsiVo != null) return "0";
		productService.categoryMainInput(vo);
		return "1";
	}
	
	// 중분류 등록하기
	@ResponseBody
	@RequestMapping(value="/categoryMiddleInput", method = RequestMethod.POST)
	public String categoryMiddleInputPost(CategoryVO vo) {
		List<CategoryVO> vos = productService.getCategoryMiddleOne(vo);
		if(vos.size() != 0) return "0";
		productService.categoryMiddleInput(vo);
		return "1";
	}
	
	// 소분류 등록하기
	@ResponseBody
	@RequestMapping(value="/categorySubInput", method = RequestMethod.POST)
	public String categorySubInputPost(CategoryVO vo) {
		List<CategoryVO> vos = productService.getCategorySubOne(vo);
		if(vos.size() != 0) return "0";
		productService.categorySubInput(vo);
		return "1";
	}
	
	// 대분류 삭제하기
	@ResponseBody
	@RequestMapping(value="/delCategoryMain", method = RequestMethod.POST)
	public String delCategoryMainPost(CategoryVO vo) {
		List<CategoryVO> vos = productService.getCategoryMiddleOne(vo);
		if(vos.size() != 0) return "0";
		productService.delCategoryMain(vo.getCategoryMainCode());
		return "1";
	}
	
	// 중분류 삭제하기
	@ResponseBody
	@RequestMapping(value="/delCategoryMiddle", method = RequestMethod.POST)
	public String delCategoryMiddlePost(CategoryVO vo) {
		List<CategoryVO> vos = productService.getCategorySubOne(vo);
		if(vos.size() != 0) return "0";
		productService.delCategoryMiddle(vo.getCategoryMiddleCode());
		return "1";
	}
	
	// 소분류 삭제하기
	@ResponseBody
	@RequestMapping(value="/delCategorySub", method = RequestMethod.POST)
	public String delCategorySubPost(CategoryVO vo) {
		List<ProductVO> vos = productService.getDbProductOne(vo.getCategorySubCode());
		if(vos.size() != 0) return "0";
		productService.delCategorySub(vo.getCategorySubCode());
		return "1";
	}
	
	// 상품 등록폼
	@RequestMapping(value="/productInput", method = RequestMethod.GET)
	public String productInputGet(Model model) {
		List<CategoryVO> mainVos = productService.getCategoryMain();
		model.addAttribute("mainVos", mainVos);
		return "admin/product/productInput";
	}
	
	// 옵션 등록폼
	@RequestMapping(value="/productOption", method = RequestMethod.GET)
	public String productOptionGet(Model model) {
		List<CategoryVO> mainVos = productService.getCategoryMain();
		model.addAttribute("mainVos", mainVos);
		return "admin/product/productOption";
	}
	
	// 소분류 선택시 상품명 가져오기
	@ResponseBody
	@RequestMapping(value="/categoryProuctName", method = RequestMethod.POST)
	public List<CategoryVO> categoryProuctNamePost(String categoryMainCode, String categoryMiddleCode, String categorySubCode) {
		return productService.getCategoryProuctName(categoryMainCode, categoryMiddleCode,categorySubCode);
	}
	
	// 상품 등록하기
	@RequestMapping(value="/productInput", method = RequestMethod.POST)
	public String productInputPost(MultipartFile file, ProductVO vo) {
		productService.imgCheckProductInput(file, vo);
		return "redirect:/msg/productInputOk";
	}
	
	// 옵션 등록하기
	@RequestMapping(value="/productOption", method = RequestMethod.POST)
	public String productOptionPost(OptionVO vo,String[] optionName,String[] optionColor, int[] optionNum) {
		String[] productCodes = vo.getProductCode().split("/"); 
		for(int i=0; i<optionName.length; i++) {
			vo.setProductIdx(Integer.parseInt(productCodes[0]));
			vo.setOptionName(optionName[i]);
			vo.setOptionColor(optionColor[i]);
			vo.setOptionNum(optionNum[i]);
			productService.optionInput(vo);
		}
		return "redirect:/msg/OptionInputOk";
	}
	
	// 상품 코드 중복 체크
	@ResponseBody
	@RequestMapping(value="/productCodeCheck", method = RequestMethod.POST)
	public String productCodeCheckPost(ProductVO vo) {
		if(productService.productCodeCheck(vo.getProductCode()) != null) {
			msgFlag = "codeCheckNo";
			return "redirect:/msg/" + msgFlag;
		}
		return "0";
	}
	
  // 상품 리스트
	@RequestMapping(value="/productList", method=RequestMethod.GET)
	public String dbShopListGet(@RequestParam(name="part", defaultValue="", required=false) String part,
			@RequestParam(name="pag", defaultValue="1", required=false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
			@RequestParam(name="productName", defaultValue="", required=false) String productName,
			@RequestParam(name="disPriceSw", defaultValue="", required=false) String disPriceSw,
			Model model) {
		  int totRecCnt = 0;
		  if(productName.equals("")) {
			  totRecCnt = productService.totRecCnt();
		  }
		  else {
			  totRecCnt = productService.totRecProductNameCnt(productName);
		  }
		  int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
		  int startIndexNo = (pag - 1) * pageSize;
		  int curScrStartNo = totRecCnt - startIndexNo;
		  int blockSize = 5;		// 한블록의 크기를 3개의 Page로 본다.(사용자가 지정한다.)
		  int curBlock = (pag - 1) / blockSize;		// 현재페이지의 블록위치
		  int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
		  /* 블록페이징처리 끝 */
		  List<ProductVO> ProVos = new ArrayList<ProductVO>();
		  if(productName.equals("")) {
			  ProVos = productService.getShopList(startIndexNo, pageSize,disPriceSw);
		  }
		  else {
			  ProVos = productService.getShopListProduct(startIndexNo, pageSize,productName);
		  }
		  
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totPage", totPage);
		model.addAttribute("curScrStartNo", curScrStartNo);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("curBlock", curBlock);
		model.addAttribute("lastBlock", lastBlock);
		model.addAttribute("part", part);
		model.addAttribute("ProVos", ProVos);
		model.addAttribute("disPriceSw", disPriceSw);
		return "admin/product/productList";
	}
	
	// 상품목록 가격높은순 출력하기
	@RequestMapping(value="mainPriceH", method = RequestMethod.GET)
	public String mainPriceHGet(String Lpart,String Mpart,String Spart,Model model) {
		return "redirect:/product/productList?disPriceSw=HIGH";
	}
	// 상품목록 가격낮은순 출력하기
	@RequestMapping(value="mainPriceL", method = RequestMethod.GET)
	public String mainPriceLGet(String Lpart,String Mpart,String Spart,Model model) {
		return "redirect:/product/productList?disPriceSw=LOW";
	}
	// 상품목록 가격높은순 출력하기
	@RequestMapping(value="mainPriceHH", method = RequestMethod.GET)
	public String mainPriceHHshopListRichGet(String Lpart,String Mpart,String Spart,Model model) {
		return "redirect:/product/productList?disPriceSw=HIGHD";
	}
	// 상품목록 가격낮은순 출력하기
	@RequestMapping(value="mainPriceLL", method = RequestMethod.GET)
	public String mainPriceLLGet(String Lpart,String Mpart,String Spart,Model model) {
		return "redirect:/product/productList?disPriceSw=LOWD";
	}
	
	//상품내역 상세보기
	@RequestMapping(value="/productContent", method=RequestMethod.GET)
	public String productContentGet(int idx, Model model) {
		ProductVO productVo = shopService.getShopProduct(idx); 			// 상품 상세 정보 불러오기
		List<OptionVO> optionVos = shopService.getShopOption(idx); 	// 옵션 정보 모두 가져오기(두개이상이 올수 있기에 배열(리스트)처리한다.)
		List<CategoryVO> mainVos = productService.getCategoryMain();
		if(productVo.getProductSubImg().indexOf("src=\"/") != -1) productService.imgCheckUpdate(productVo.getProductSubImg());
		model.addAttribute("mainVos", mainVos);
		model.addAttribute("productVo", productVo);
		model.addAttribute("productVo.idx", productVo.getIdx());
		model.addAttribute("optionVos", optionVos);
		return "admin/product/productContent";
	}
	
	//상품내역 업데이트
	@RequestMapping(value="/productContent", method=RequestMethod.POST)
	public String dbShopContentPost(MultipartFile file, ProductVO vo) {
		if(vo.getProductSubImg().indexOf("src=\"/") != -1)	productService.imgDelete(vo.getProductSubImg());
		vo.setProductSubImg(vo.getProductSubImg().replace("/data/shop/product/", "/data/shop/"));
		productService.imgCheck(vo.getProductSubImg());
		vo.setProductSubImg(vo.getProductSubImg().replace("/data/shop/", "/data/shop/product/"));
		productService.setProductUpdate(file,vo);
		msgFlag = "productUpdateOk$idx="+vo.getIdx();
		return "redirect:/msg/" + msgFlag;
	}
	
	// 옵션수정
	@ResponseBody
	@RequestMapping(value="/optionContent", method=RequestMethod.POST)
	public String optionUpdatePost(OptionVO vo) {
		productService.setOptionUpdate(vo);
		return "";
	}
	
	// 옵션삭제
	@ResponseBody
	@RequestMapping(value="/optionDel", method=RequestMethod.POST)
	public String optionDelPost(int idx) {
		productService.setProductOPDelete(idx);
		return "";
	}
	
	
	// 상품 선택삭제
	@ResponseBody
	@RequestMapping(value="/productListDel", method = RequestMethod.POST)
	public String productListDelPost(String delItems) {
		String[] idxs = delItems.split("/");
		for(String idx : idxs) {
			productService.setProductDelete(Integer.parseInt(idx));
		}
		return"";
	}
	// 상품 옵션삭제
	@ResponseBody
	@RequestMapping(value="/productListOPDel", method = RequestMethod.POST)
	public String productListDelOPPost(String delItems) {
		String[] idxs = delItems.split("/");
		for(String idx : idxs) {
			productService.setProductOPDelete(Integer.parseInt(idx));
		}
		return"";
	}
	
	//상품내역 삭제
	@RequestMapping(value="/productContentDel", method=RequestMethod.POST)
	public String dbShopContentPost(int idx) {
		// 게시글에 사진이 존재한다면 실제 서버파일 시스템에서 사진파일을 삭제처리한다
		ProductVO vo = productService.getProductContent(idx);
		if(vo.getProductSubImg().indexOf("src=\"/") != -1)	productService.imgDelete(vo.getProductSubImg());
		// DB애서 실제 게시글을 삭제처리
		productService.setProductDelete(idx);
		msgFlag = "productDeleteOk";
		return "redirect:/msg/" + msgFlag;
	}
	
	@ResponseBody
	@RequestMapping("/imageUpload")
	public void imageUploadGet(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String originalFilename = upload.getOriginalFilename();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		originalFilename = sdf.format(date) + "_" + originalFilename;
		byte[] bytes = upload.getBytes();
		// ckeditor에서 올린 파일을 서버 파일시스템에 저장시켜준다
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/shop/");
		OutputStream outStr = new FileOutputStream(new File(uploadPath + originalFilename));
		outStr.write(bytes);
		// 서버 파일시스템에 저장된 파일을 화면(textarea)에 출력하기
		PrintWriter out = response.getWriter();
		String fileUrl = request.getContextPath() + "/data/shop/" + originalFilename;
		out.println("{\"originalFilename\":\""+originalFilename+"\",\"uploaded\":1,\"url\":\""+fileUrl+"\"}");
		out.flush();
		outStr.close();
	}
}

