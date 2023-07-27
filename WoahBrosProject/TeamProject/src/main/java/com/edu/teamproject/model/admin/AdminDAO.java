package com.edu.teamproject.model.admin;

import javax.servlet.http.HttpSession;

import com.edu.teamproject.domain.Admin;

public interface AdminDAO {
	public Admin select(Admin admin);
}
