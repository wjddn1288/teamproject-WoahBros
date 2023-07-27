package com.edu.teamproject.model.product;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.edu.teamproject.domain.Product;
import com.edu.teamproject.domain.ProductImg;
import com.edu.teamproject.exception.ProductException;
import com.edu.teamproject.exception.ProductImgException;
import com.edu.teamproject.exception.UploadException;
import com.edu.teamproject.util.FileManager;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private ProductImgDAO productImgDAO;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public List selectAll() {
		return productDAO.selectAll();
	}
	
	@Override
	public List selectBySearch(Map map) {
		return productDAO.selectBySearch(map);
	}

	@Override
	public Product select(int product_idx) {
		return productDAO.select(product_idx);
	}

	@Transactional(propagation = Propagation.REQUIRED)//코드가 실행될때 트랜잭션!
	public void regist(Product product, String dir) throws ProductException, UploadException, ProductImgException{
		
		//부모 상품 저장 (부모 product)
		productDAO.insert(product); //select-key에 의해 pk 존재하게 됨
		
		//파일 저장하기
		fileManager.saveproduct(product, dir);
		
		//이미지 저장하기
		List<ProductImg> productImgList=product.getProductImgList();
		
		for(ProductImg productImg : productImgList) {
			productImgDAO.insert(productImg);
		}
		
	}
	
	@Override
	public void insert(Product product) {
		productDAO.insert(product);
	}
	
	@Override
	public void update(Product product) {
		productDAO.update(product);
	}

	@Override
	public void delete(int product_idx) {
		//한 건 삭제
		productDAO.delete(product_idx);
		
		//이미지 삭제
		productImgDAO.delete(product_idx);
	}

}
