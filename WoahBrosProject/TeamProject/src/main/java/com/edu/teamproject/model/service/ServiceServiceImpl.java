package com.edu.teamproject.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.edu.teamproject.domain.Service;
import com.edu.teamproject.exception.ServiceException;

@org.springframework.stereotype.Service
public class ServiceServiceImpl implements ServiceService{

	@Autowired
	private ServiceDAO serviceDAO;
	
	@Override
	public List selectAll() {
		return serviceDAO.selectAll();
	}

	@Override
	public List selectBySearch(Map map) {
		return serviceDAO.selectBySearch(map);
	}

	@Override
	public void insert(Service service) throws ServiceException{
		serviceDAO.insert(service);
	}

	@Override
	public void update(Service service) throws ServiceException{
		serviceDAO.update(service);	
	}

	@Override
	public void delete(int service_idx) throws ServiceException{
		serviceDAO.delete(service_idx);
	}

	@Override
	public Service select(int service_idx) {
		return serviceDAO.select(service_idx);
	}

}
