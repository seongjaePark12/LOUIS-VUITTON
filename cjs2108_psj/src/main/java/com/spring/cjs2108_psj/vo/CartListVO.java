package com.spring.cjs2108_psj.vo;

import lombok.Data;

@Data
public class CartListVO {
	private int idx;
	private String cartDate;
	private String mid;
	private int productIdx;
	private String productName;
	private String productCode;
	private int realPrice;
	private int mainPrice;
	private int point;
	private int disPrice;
	private String productMainImg;
	private String optionIdx;
	private String optionName;
	private String optionColor;
	private String optionNum;
	private int totalPrice;
}
