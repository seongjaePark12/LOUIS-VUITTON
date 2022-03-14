package com.spring.cjs2108_psj.vo;

import lombok.Data;

@Data
public class OrderVO {
	private int idx;
	private String orderIdx;
	private String mid;
	private int productIdx;
	private String orderDate;
	private String productName;
	private int realPrice;
	private int mainPrice;
	private int point;
	private int disPrice;
	private String productMainImg;
	private String optionName;
	private String optionColor;
	private String optionNum;
	private int totalPrice;
    private int cartIdx;  // 장바구니 고유번호.
    private int maxIdx;   // 주문번호를 구하기위한 기존 최대 비밀번호필드
}
