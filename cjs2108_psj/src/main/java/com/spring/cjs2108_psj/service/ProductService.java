package com.spring.cjs2108_psj.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.cjs2108_psj.vo.CategoryVO;
import com.spring.cjs2108_psj.vo.OptionVO;
import com.spring.cjs2108_psj.vo.ProductVO;

public interface ProductService {

	public List<CategoryVO> getCategoryMain();

	public List<CategoryVO> getCategoryMiddle();

	public List<CategoryVO> getCategorySub();

	public List<CategoryVO> getCategoryMiddleName(String categoryMainCode);

	public List<CategoryVO> getCategorySubName(String categoryMainCode, String categoryMiddleCode);

	public CategoryVO getCategoryMainOne(String categoryMainCode, String categoryMainName);

	public void categoryMainInput(CategoryVO vo);

	public List<CategoryVO> getCategoryMiddleOne(CategoryVO vo);

	public void categoryMiddleInput(CategoryVO vo);

	public List<CategoryVO> getCategorySubOne(CategoryVO vo);

	public void categorySubInput(CategoryVO vo);

	public void delCategoryMain(String categoryMainCode);

	public void delCategoryMiddle(String categoryMiddleCode);

	public List<ProductVO> getDbProductOne(String categorySubCode);

	public void delCategorySub(String categorySubCode);

	public ProductVO productCodeCheck(String productCode);

	public void imgCheckProductInput(MultipartFile file, ProductVO vo);

	public List<CategoryVO> getCategoryProuctName(String categoryMainCode, String categoryMiddleCode, String categorySubCode);

	public void optionInput(OptionVO vo);

	public ProductVO getProductIdx(String categoryMainCode, String categoryMiddleCode, String categorySubCode);

	public int totRecCnt();

	public void setProductDelete(int idx);

	public int totRecProductNameCnt(String productName);

	public List<ProductVO> getShopListProduct(int startIndexNo, int pageSize, String productName);

	public List<ProductVO> getShopList(int startIndexNo, int pageSize, String disPriceSw);

	public void setProductOPDelete(int idx);
	
	public void imgDelete(String productSubImg);
	
	public void imgCheck(String productSubImg);
	
	public void setProductUpdate(MultipartFile file, ProductVO vo);

	public ProductVO getProductContent(int idx);

	public void imgCheckUpdate(String productSubImg);

	public void setOptionUpdate(OptionVO vo);

}
