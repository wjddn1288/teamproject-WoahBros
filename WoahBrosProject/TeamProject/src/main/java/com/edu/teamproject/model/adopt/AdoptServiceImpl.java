package com.edu.teamproject.model.adopt;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.edu.teamproject.domain.Adopt;
import com.edu.teamproject.domain.AdoptImg;
import com.edu.teamproject.exception.AdoptException;
import com.edu.teamproject.exception.AdoptImgException;
import com.edu.teamproject.exception.UploadException;
import com.edu.teamproject.util.FileManager;

@Service
public class AdoptServiceImpl implements AdoptService{
	
	@Autowired
	private AdoptDAO adoptDAO;
	@Autowired
	private AdoptImgDAO adoptImgDAO;
	
	@Autowired
	private FileManager fileManager;	
	

	@Override
	public List selectAll() {
		return adoptDAO.selectAll();
	}

	@Override
	public Adopt select(int adopt_idx) {
		return adoptDAO.select(adopt_idx);
	}

	@Transactional(propagation = Propagation.REQUIRED)
	public void regist(Adopt adopt, String dir) throws AdoptException, AdoptImgException, UploadException{
		
		//입양정보 등록
		adoptDAO.insert(adopt);
		
		//파일저장
		fileManager.save(adopt, dir);
		
		//이미지저장
		List<AdoptImg> adoptImgList = adopt.getAdoptImgList();
		
		for(AdoptImg adoptImg:adoptImgList) {
			adoptImgDAO.insert(adoptImg);
		}
	}

	@Override
	public void update(Adopt adopt) {
		adoptDAO.update(adopt);
	}

	@Override
	public void delete(int adopt_idx) {
		
		// 해당 게시물에 올라간 이미지 삭제 
		adoptImgDAO.delete(adopt_idx);
		
		// 해당 입양 게시물 삭제
		adoptDAO.delete(adopt_idx);
	}

	@Override
	public List selectBySearch(Map map) {
		return adoptDAO.selectBySearch(map);
	}

	@Override
	public void updateBySuccess(Adopt adopt) {
		adoptDAO.updateBySuccess(adopt);
	}

}
