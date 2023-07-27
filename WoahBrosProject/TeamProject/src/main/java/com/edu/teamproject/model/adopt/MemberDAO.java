package com.edu.teamproject.model.adopt;

import java.util.List;

import com.edu.teamproject.domain.Member;

public interface MemberDAO {
	public List selectAll();
	public Member selectById(String id);
	public Member selectByIdx(int member_idx);
	public void insert(Member member);
	public void updateByValunteer(int member_idx);
}
