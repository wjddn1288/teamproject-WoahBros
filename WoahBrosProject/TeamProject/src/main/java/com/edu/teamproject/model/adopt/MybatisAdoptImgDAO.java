package com.edu.teamproject.model.adopt;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.teamproject.domain.AdoptImg;
import com.edu.teamproject.exception.AdoptImgException;

@Repository
public class MybatisAdoptImgDAO implements AdoptImgDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("AdoptImg.selectAll");
	}

	@Override
	public List selectByAdopt(int adopt_idx) {
		return sqlSessionTemplate.selectList("AdoptImg.selectByAdopt", adopt_idx);
	}

	@Override
	public void insert(AdoptImg adoptImg) throws AdoptImgException{
		int result = sqlSessionTemplate.insert("AdoptImg.insert",adoptImg);
		if(result<1) {
			throw new AdoptImgException("사진등록 실패");
		}
	}

	@Override
	public void delete(int adopt_idx) throws AdoptImgException{
		int result = sqlSessionTemplate.delete("AdoptImg.delete",adopt_idx);
		if(result<1) {
			throw new AdoptImgException("사진삭제 실패");
		}		
	}

}
