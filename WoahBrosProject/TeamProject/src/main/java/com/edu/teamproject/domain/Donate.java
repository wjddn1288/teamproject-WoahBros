package com.edu.teamproject.domain;

import lombok.Data;

@Data
public class Donate {
	private int donate_idx;
	private Member member;
	private int price;
	private String regdate;
}
