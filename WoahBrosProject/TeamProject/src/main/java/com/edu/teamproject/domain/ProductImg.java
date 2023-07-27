package com.edu.teamproject.domain;

import lombok.Data;

@Data
public class ProductImg {
	private int productimg_idx;
	private Product product;
	private String filename;
}
