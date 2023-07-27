package com.edu.teamproject.model.donate;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.teamproject.domain.Donate;
import com.edu.teamproject.exception.DonateException;

@Repository
public class MybaticeDonateDAO implements DonateDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<Donate> selectAll() {
		return sqlSessionTemplate.selectList("Donate.selectAll");
	}

	@Override
	public void insert(Donate donate) throws DonateException{
		int result = sqlSessionTemplate.insert("Donate.insert",donate);
		if(result<1) {
			throw new DonateException("등록 실패");
		}
	}

}
