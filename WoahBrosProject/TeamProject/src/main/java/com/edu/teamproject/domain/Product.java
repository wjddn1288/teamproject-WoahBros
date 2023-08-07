package com.edu.teamproject.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Product {
	private int product_idx;
	private Category category; //필요없음
	private String name;
	private String content;
	private String category_name;
	private int price;
	private List<ProductImg> productImgList;
	private MultipartFile[] productphoto;
}
