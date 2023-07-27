package com.edu.teamproject.model.category;

import java.util.List;

import com.edu.teamproject.domain.Category;

public interface CategoryService {
	public List selectAll();
	public Category select(int category_idx);
	public void insert(Category category);
	public void update(Category category);
	public void delete(int category_idx);
}
