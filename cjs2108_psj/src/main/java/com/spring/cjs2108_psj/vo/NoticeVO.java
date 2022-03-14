package com.spring.cjs2108_psj.vo;

import lombok.Data;

@Data
public class NoticeVO {
	private int idx;
	private String name;
	private String title;
	private String content;
	private String dateNow;
	private String hostIp;
	private String mid;
	private int notice;
	private int diffTime; // 시간 계산을 위해 저장한 변수(sql에서 시간단위로 계산해서 넘어온 값을 저장) 
	private String oriContent; // 원본 content의 내용을 저장 시켜두기 위한 필드
}
