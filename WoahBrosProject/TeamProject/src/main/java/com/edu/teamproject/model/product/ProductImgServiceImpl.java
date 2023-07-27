package com.edu.teamproject.model.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.teamproject.domain.ProductImg;

@Service
public class ProductImgServiceImpl implements ProductImgService{

	@Autowired
	private ProductImgDAO productImgDAO;
	
	@Override
	public List selectAll() {
		return productImgDAO.selectAll();
	}

	@Override
	public List selectByProduct(int product_idx) {
		return productImgDAO.selectByProduct(product_idx);
	}

	@Override
	public void insert(ProductImg productImg) {
		productImgDAO.insert(productImg);
	}

	@Override
	public void delete(int product_idx) {
		productImgDAO.delete(product_idx);
	}

}
