package com.edu.teamproject.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.teamproject.domain.Service;
import com.edu.teamproject.exception.ServiceException;

@Repository
public class MybatisServiceDAO implements ServiceDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("Service.selectAll");
	}

	@Override
	public List selectBySearch(Map map) {
		return sqlSessionTemplate.selectList("Service.selectBySearch", map);
	}

	@Override
	public void insert(Service service) throws ServiceException{
		int result=sqlSessionTemplate.insert("Service.insert",service);
		if(result<1){
			throw new ServiceException("등록실패");
		}
	}

	@Override
	public void update(Service service) throws ServiceException{
		int result=sqlSessionTemplate.insert("Service.insert",service);
		if(result<1){
			throw new ServiceException("수정실패");
		}
	}

	@Override
	public void delete(int service_idx)  throws ServiceException{
		int result=sqlSessionTemplate.insert("Service.delete",service_idx);
		if(result<1){
			throw new ServiceException("삭제실패");
		}
	}

	@Override
	public Service select(int service_idx) {
		return sqlSessionTemplate.selectOne("Service.select", service_idx);
	}

}
