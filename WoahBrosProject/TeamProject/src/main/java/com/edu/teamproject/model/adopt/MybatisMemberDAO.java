package com.edu.teamproject.model.adopt;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.teamproject.domain.Member;
import com.edu.teamproject.exception.MemberException;

@Repository
public class MybatisMemberDAO implements MemberDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("Member.selectAll");
	}


	@Override
	public void insert(Member member) throws MemberException{
		int result = sqlSessionTemplate.insert("Member.insert", member);
		if(result<1){
			throw new MemberException("회원등록 실패");
		}		
	}

	@Override
	public Member selectById(String id) {
		return sqlSessionTemplate.selectOne("Member.selectById",id);
	}

	@Override
	public Member selectByIdx(int member_idx) {
		return sqlSessionTemplate.selectOne("Member.selectByIdx",member_idx);
	}

	@Override
	public void updateByValunteer(int member_idx) throws MemberException{
		int result= sqlSessionTemplate.update("Member.updateByValunteer",member_idx);
		if(result<1) {
			throw new MemberException("자원봉사처리 실패");
		}
	}
}
