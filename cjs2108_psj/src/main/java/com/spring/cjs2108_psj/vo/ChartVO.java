package com.spring.cjs2108_psj.vo;

import lombok.Data;

@Data
public class ChartVO {
	private int idx;
	private int productIdx;
	private String orderDate;
	private String productName;
	private int realPrice;
	private int disPrice;
	private int margin;
	private int selNum;
	
	private String yearDate;
	private String monthDate;
	private String dayDates;
	private String realPrices;
	private String disPrices;
	private String margins;
	private String selNums;
	
}
