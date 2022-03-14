package com.spring.cjs2108_psj.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs2108_psj.vo.CategoryVO;
import com.spring.cjs2108_psj.vo.OptionVO;
import com.spring.cjs2108_psj.vo.ProductVO;

public interface ProductDAO {

	public List<CategoryVO> getCategoryMain();

	public List<CategoryVO> getCategoryMiddle();

	public List<CategoryVO> getCategorySub();

	public List<CategoryVO> getCategoryMiddleName(@Param("categoryMainCode")String categoryMainCode);

	public List<CategoryVO> getCategorySubName(@Param("categoryMainCode")String categoryMainCode,@Param("categoryMiddleCode") String categoryMiddleCode);

	public CategoryVO getCategoryMainOne(@Param("categoryMainCode")String categoryMainCode,@Param("categoryMainName") String categoryMainName);

	public List<CategoryVO> getCategoryMiddleOne(@Param("vo")CategoryVO vo);

	public List<CategoryVO> getCategorySubOne(@Param("vo")CategoryVO vo);

	public List<ProductVO> getDbProductOne(@Param("categorySubCode")String categorySubCode);
	
	public void categoryMainInput(@Param("vo")CategoryVO vo);
	
	public void categoryMiddleInput(@Param("vo")CategoryVO vo);

	public void categorySubInput(@Param("vo")CategoryVO vo);
	
	public void delCategoryMain(@Param("categoryMainCode")String categoryMainCode);
	
	public void delCategoryMiddle(@Param("categoryMiddleCode")String categoryMiddleCode);

	public void delCategorySub(@Param("categorySubCode")String categorySubCode);

	public ProductVO productCodeCheck(@Param("productCode")String productCode);

	public void setProductInput(@Param("vo")ProductVO vo);

	public List<ProductVO> getShopList(@Param("startIndexNo")int startIndexNo,@Param("pageSize") int pageSize,@Param("disPriceSw") String disPriceSw);

	public List<CategoryVO> getCategoryProuctName(@Param("categoryMainCode")String categoryMainCode,@Param("categoryMiddleCode") String categoryMiddleCode,@Param("categorySubCode") String categorySubCode);

	public void optionInput(@Param("vo")OptionVO vo);

	public ProductVO getProductIdx(@Param("categoryMainCode")String categoryMainCode,@Param("categoryMiddleCode") String categoryMiddleCode,@Param("categorySubCode") String categorySubCode);

	public int totRecCnt();

	public void setProductDelete(@Param("idx")int idx);

	public int totRecProductNameCnt(@Param("productName")String productName);

	public List<ProductVO> getShopListProduct(@Param("startIndexNo")int startIndexNo,@Param("pageSize")int pageSize,@Param("productName") String productName);

	public void setProductOPDelete(@Param("idx")int idx);

	public ProductVO getProductContent(@Param("idx")int idx);

	public void setProductUpdate(@Param("vo")ProductVO vo);

	public void setOptionUpdate(@Param("vo")OptionVO vo);


}
