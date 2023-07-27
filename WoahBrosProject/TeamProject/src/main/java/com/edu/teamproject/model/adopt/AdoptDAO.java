package com.edu.teamproject.model.adopt;

import java.util.List;
import java.util.Map;

import com.edu.teamproject.domain.Adopt;

public interface AdoptDAO {
	public List selectAll();
	public List selectBySearch(Map map);
	public Adopt select(int adopt_idx);
	public void insert(Adopt adopt);
	public void update(Adopt adopt);
	public void updateBySuccess(Adopt adopt);
	public void delete(int adopt_idx);
}
