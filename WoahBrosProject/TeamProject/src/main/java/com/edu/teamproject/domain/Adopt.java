package com.edu.teamproject.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Adopt {
	private int adopt_idx;
	private Admin admin;
	private String name;
	private String gender;
	private String type;
	private int age;
	private String content;
	private String regdate;
	private int status;
	
	private List<AdoptImg> adoptImgList; 
	
	private MultipartFile[] photo;
}
