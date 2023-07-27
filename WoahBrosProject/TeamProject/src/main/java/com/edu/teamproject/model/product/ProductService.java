package com.edu.teamproject.model.product;

import java.util.List;
import java.util.Map;

import com.edu.teamproject.domain.Product;

public interface ProductService {
	public List selectAll();
	public List selectBySearch(Map map);
	public Product select(int product_idx);
	public void regist(Product product, String dir); //db연동 +file 제어 + 메일발송
	public void insert(Product product);
	public void update(Product product);
	public void delete(int product_idx);
}
