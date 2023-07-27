package com.edu.teamproject.model.adopt;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.teamproject.domain.Member;
import com.edu.teamproject.exception.MemberException;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public List selectAll() {
		return memberDAO.selectAll();
	}
	
	@Override
	public Member selectById(String id) {
		return memberDAO.selectById(id);
	}
	
	@Override
	public Member selectByIdx(int member_idx) {
		return memberDAO.selectByIdx(member_idx);
	}

	@Override
	public void insert(Member member) throws MemberException{
		memberDAO.insert(member);
	}

	@Override
	public void updateByValunteer(int member_idx) throws MemberException{
		memberDAO.updateByValunteer(member_idx);
	}


}
