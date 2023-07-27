package com.edu.teamproject.model.product;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.teamproject.domain.Product;
import com.edu.teamproject.exception.ProductException;

@Repository
public class MybatisProductDAO implements ProductDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List selectAll() { // 전체
		return sqlSessionTemplate.selectList("Product.selectAll");
	}
	
	@Override
	public List selectBySearch(Map map) { //검색
		return sqlSessionTemplate.selectList("Service.selectBySearch", map);
	}

	@Override
	public Product select(int product_idx) { // 한건
		return sqlSessionTemplate.selectOne("Product.select", product_idx);
	}

	@Override // 상품등록
	public void insert(Product product) throws ProductException {
		int result = sqlSessionTemplate.insert("Product.insert", product);
		if (result < 1) {
			throw new ProductException("상품 등록 실패");
		}
	}

	@Override // 상품 수정
	public void update(Product product) throws ProductException {
		int result = sqlSessionTemplate.update("Product.update", product);
		if (result < 1) {
			throw new ProductException("상품 수정 실패");
		}
	}

	@Override // 상품 삭제
	public void delete(int product_idx) throws ProductException {
		int result = sqlSessionTemplate.delete("Product.delete", product_idx);
		if (result < 1) {
			throw new ProductException("상품 삭제 실패");
		}
	}
}
