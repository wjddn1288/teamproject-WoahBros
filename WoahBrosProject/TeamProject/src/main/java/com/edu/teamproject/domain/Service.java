package com.edu.teamproject.domain;

import lombok.Data;

@Data
public class Service {
	private int service_idx;
	private String title;
	private String content;
	private String regdate;
	private int hit;
	private int max;
}
