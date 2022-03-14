package com.spring.cjs2108_psj.vo;

import lombok.Data;

@Data
public class ProductVO {
	private int idx;
	private String productCode;
	private String productName;
	private int realPrice;
	private int mainPrice;
	private int point;
	private int disPrice;
	private String productMainImg;
	private String productContent;
	private String productContent2;
	private String productSubImg;
	private int wishCnt;
	
	private String categoryMainCode;
	private String categoryMainName;
	private String categoryMiddleCode;
	private String categoryMiddleName;
	private String categorySubCode;
	private String categorySubName;
	
	private int diffTime; // 시간 계산을 위해 저장한 변수(sql에서 시간단위로 계산해서 넘어온 값을 저장) 
	
	private String wishCheck; 
}
