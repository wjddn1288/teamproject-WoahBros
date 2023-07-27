package com.edu.teamproject.model.donate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.teamproject.domain.Donate;
import com.edu.teamproject.exception.DonateException;

@Service
public class DonateServiceImpl implements DonateService{
	
	@Autowired
	private DonateDAO donateDAO;
	
	@Override
	public List<Donate> selectAll() {
		return donateDAO.selectAll();
	}

	@Override
	public void insert(Donate donate) throws DonateException{
		donateDAO.insert(donate);
	}

}
