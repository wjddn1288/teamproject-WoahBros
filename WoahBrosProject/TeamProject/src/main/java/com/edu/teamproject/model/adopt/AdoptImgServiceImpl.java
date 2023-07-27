package com.edu.teamproject.model.adopt;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.teamproject.domain.AdoptImg;
import com.edu.teamproject.exception.AdoptImgException;

@Service
public class AdoptImgServiceImpl implements AdoptImgService {

	@Autowired
	private AdoptImgDAO adoptImgDAO;

	@Override
	public List selectAll() {
		return adoptImgDAO.selectAll();
	}

	@Override
	public List selectByAdopt(int adopt_idx) {
		return adoptImgDAO.selectByAdopt(adopt_idx);
	}

	@Override
	public void insert(AdoptImg adoptImg) throws AdoptImgException {
		adoptImgDAO.insert(adoptImg);
	}

	@Override
	public void delete(int adopt_idx) throws AdoptImgException {
		adoptImgDAO.delete(adopt_idx);
	}
}
