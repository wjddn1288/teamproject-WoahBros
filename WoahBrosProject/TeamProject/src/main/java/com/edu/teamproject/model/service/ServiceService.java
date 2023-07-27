package com.edu.teamproject.model.service;

import java.util.List;
import java.util.Map;

import com.edu.teamproject.domain.Service;

public interface ServiceService {
	public List selectAll();
	public Service select(int service_idx);
	public List selectBySearch(Map map);
	public void insert(Service service);
	public void update(Service service);
	public void delete(int service_idx);
}
