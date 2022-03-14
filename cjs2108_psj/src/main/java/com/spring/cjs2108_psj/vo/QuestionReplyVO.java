package com.spring.cjs2108_psj.vo;

import lombok.Data;

@Data
public class QuestionReplyVO {
	private int idx;
	private int questionIdx;
	private String mid;
	private String dateNow;
	private String hostIp;
	private String content;
}
