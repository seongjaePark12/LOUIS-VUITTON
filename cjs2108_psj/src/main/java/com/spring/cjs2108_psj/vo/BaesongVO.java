package com.spring.cjs2108_psj.vo;

import lombok.Data;

@Data
public class BaesongVO {
	private int idx;
	private int oIdx;
	private String orderIdx;
	private int orderTotalPrice;
	private String mid;
	private String name;
	private String address;
	private String getCode;
	private String email;
	private String message;
	private String payment;
	private String payMethod;
    private String baesongNum;
    private String orderStatus;
    
    // 아래는 주문테이블에서 사용된 필드리스트이다.
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
}
