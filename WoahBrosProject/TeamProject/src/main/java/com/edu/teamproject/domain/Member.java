package com.edu.teamproject.domain;

import lombok.Data;

@Data
public class Member {
	private int member_idx;
	private String id;
	private String email;
	private String name;
	private String sns;
	private String regdate;
	private int checking;
}