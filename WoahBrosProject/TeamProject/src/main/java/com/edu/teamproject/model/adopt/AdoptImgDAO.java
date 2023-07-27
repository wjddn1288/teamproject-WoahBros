package com.edu.teamproject.model.adopt;

import java.util.List;

import com.edu.teamproject.domain.AdoptImg;

public interface AdoptImgDAO {
	
	public List selectAll();
	public List selectByAdopt(int adopt_idx);
	public void insert(AdoptImg adoptImg);
	public void delete(int adopt_idx);
}