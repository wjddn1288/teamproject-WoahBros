package com.edu.teamproject.model.notice;

import java.util.List;
import java.util.Map;

import com.edu.teamproject.domain.Notice;

public interface NoticeDAO {
	public List selectAll();
	public Notice select(int notice_idx);
	public List selectBySearch(Map map);
	public void insert(Notice notice);
	public void update(Notice notice);
	public void delete(int notice_idx);
}
