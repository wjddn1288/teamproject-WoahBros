package com.edu.teamproject.model.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.teamproject.domain.ProductImg;
import com.edu.teamproject.exception.ProductImgException;

@Repository
public class MybatisProductImgDAO implements ProductImgDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectAll() {
		List list=sqlSessionTemplate.selectList("ProductImg.selectAll");
		return list; 
	}

	@Override
	public List selectByProduct(int product_idx) {
		return sqlSessionTemplate.selectList("ProductImg.selectByProduct", product_idx);
	}

	@Override
	public void insert(ProductImg productImg) throws ProductImgException{
		int result=sqlSessionTemplate.insert("ProductImg.insert", productImg);
		if(result<1) {
			throw new ProductImgException("상품 이미지 등록 실패");
		}
	}

	@Override
	public void delete(int product_idx)  throws ProductImgException{
		int result=sqlSessionTemplate.delete("ProductImg.delete", product_idx);
		if(result<1) {
			throw new ProductImgException("상품 이미지 삭제 실패");
		}
		
	}


}
