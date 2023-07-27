package com.edu.teamproject.model.adopt;

import java.util.List;
import java.util.Map;

import com.edu.teamproject.domain.Adopt;
import com.edu.teamproject.domain.AdoptImg;

public interface AdoptService {
	public List selectAll();
	public List selectBySearch(Map map);
	public Adopt select(int adopt_idx);
	public void regist(Adopt adopt, String dir);
	public void update(Adopt adopt);
	public void updateBySuccess(Adopt adopt);
	public void delete(int adopt_idx);
}