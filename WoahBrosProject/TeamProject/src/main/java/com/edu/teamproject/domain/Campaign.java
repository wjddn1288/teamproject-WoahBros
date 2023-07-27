package com.edu.teamproject.domain;

import lombok.Data;

@Data
public class Campaign {
	private int campaign_idx;
	private Member member;
	private String title;
	private String author;
	private String content;
	private String regdate;
	private int hit;
}
