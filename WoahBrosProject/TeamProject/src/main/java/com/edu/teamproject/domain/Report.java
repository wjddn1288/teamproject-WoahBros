package com.edu.teamproject.domain;

import lombok.Data;

@Data
public class Report {
	private int report_idx;
	private String title;
	private String kind;
	private String content;
}
