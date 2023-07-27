package com.edu.teamproject.domain;

import lombok.Data;

@Data
public class Shelter {
	private int shelter_idx;
	private String loc;
	private String name;
	private String phone;
	private double lat;
	private double lng;
}
