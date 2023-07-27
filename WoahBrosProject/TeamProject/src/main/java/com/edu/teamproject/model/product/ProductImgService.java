package com.edu.teamproject.model.product;

import java.util.List;

import org.springframework.stereotype.Service;

import com.edu.teamproject.domain.ProductImg;

public interface ProductImgService {

	public List selectAll();
	public List selectByProduct(int product_idx);
	public void insert(ProductImg productImg);
	public void delete(int product_idx);
}
