package com.edu.teamproject.model.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.teamproject.domain.Notice;
import com.edu.teamproject.exception.NoticeException;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDAO noticeDAO;
	
	@Override
	public List selectAll() {
		return noticeDAO.selectAll();
	}

	@Override
	public Notice select(int notice_idx) {
		return noticeDAO.select(notice_idx);
	}

	@Override
	public List selectBySearch(Map map) {
		return noticeDAO.selectBySearch(map);
	}

	@Override
	public void insert(Notice notice) throws NoticeException{
		noticeDAO.insert(notice);
	}

	@Override
	public void update(Notice notice) throws NoticeException{
		noticeDAO.update(notice);
	}

	@Override
	public void delete(int notice_idx) throws NoticeException{
		noticeDAO.delete(notice_idx);
	}
}
