package com.edu.teamproject.domain;

import lombok.Data;

@Data
public class Admin {
	private int admin_idx;
	private String id;
	private String pass;
	private String email;
	
@Override
public String toString() {
	return "Admin [id=" +id+", passwd=" + pass + ", email=" + email + "]";
}
}
