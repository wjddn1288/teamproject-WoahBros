package com.edu.teamproject.model.donate;

import java.util.List;

import com.edu.teamproject.domain.Donate;

public interface DonateService {
	public List<Donate> selectAll();
	public void insert(Donate donate);
}
