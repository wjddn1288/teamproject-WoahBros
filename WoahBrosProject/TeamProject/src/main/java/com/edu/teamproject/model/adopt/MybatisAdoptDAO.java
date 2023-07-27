package com.edu.teamproject.model.adopt;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.teamproject.domain.Adopt;
import com.edu.teamproject.exception.AdoptException;

@Repository
public class MybatisAdoptDAO implements AdoptDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemlate;
	
	@Override
	public List selectAll() {
		return sqlSessionTemlate.selectList("Adopt.selectAll");
	}

	@Override
	public Adopt select(int adopt_idx) {
		return sqlSessionTemlate.selectOne("Adopt.selectByName", adopt_idx);
	}

	@Override
	public void insert(Adopt adopt) throws AdoptException{
		int result = sqlSessionTemlate.insert("Adopt.insert", adopt);
		if(result<1) {
			throw new AdoptException("등록실패");
		}
	}

	@Override
	public void update(Adopt adopt) throws AdoptException{
		int result = sqlSessionTemlate.insert("Adopt.update", adopt);
		if(result<1) {
			throw new AdoptException("수정실패");
		}
	}

	@Override
	public void delete(int adopt_idx) throws AdoptException{
		int result = sqlSessionTemlate.insert("Adopt.delete", adopt_idx);
		if(result<1) {
			throw new AdoptException("삭제실패");
		}
	}

	@Override
	public List selectBySearch(Map map) {
		return sqlSessionTemlate.selectList("Adopt.selectBySearch", map);
	}

	@Override
	public void updateBySuccess(Adopt adopt) {
		int result = sqlSessionTemlate.update("Adopt.updateBySuccess", adopt);
	}

}
