package com.edu.teamproject.domain;

import lombok.Data;

@Data
public class Notice {
	private int notice_idx;
	private Admin admin;
	private String title;
	private String content;
	private String regdate;
}
