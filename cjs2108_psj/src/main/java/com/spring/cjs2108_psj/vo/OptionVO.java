package com.spring.cjs2108_psj.vo;

import lombok.Data;

@Data
public class OptionVO {
	private int idx;
	private int productIdx;
	private String optionName;
	private String optionColor;
	private int optionNum;
	
	private String categoryMainCode;
	private String categoryMainName;
	private String categoryMiddleCode;
	private String categoryMiddleName;
	private String categorySubCode;
	private String categorySubName;
	private String productCode;
	private String productName;
}
