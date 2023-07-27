package com.edu.teamproject.model.product;

import java.util.List;

import com.edu.teamproject.domain.ProductImg;

public interface ProductImgDAO {
	public List selectAll();
	public List selectByProduct(int product_idx);
	public void insert(ProductImg productImg);
	public void delete(int product_idx);
	
}
