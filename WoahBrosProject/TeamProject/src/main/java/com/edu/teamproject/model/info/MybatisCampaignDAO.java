package com.edu.teamproject.model.info;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.teamproject.domain.Campaign;
import com.edu.teamproject.exception.CampaignException;

@Repository
public class MybatisCampaignDAO implements CampaignDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<Campaign> selectAll() {
		return sqlSessionTemplate.selectList("Campaign.selectAll");
	}

	@Override
	public List<Campaign> selectBySearch(Map map) {
		return sqlSessionTemplate.selectList("Campaign.selectBySearch", map);
	}

	@Override
	public Campaign select(int campaign_idx) {
		return sqlSessionTemplate.selectOne("Campaign.select", campaign_idx );
	}

	@Override
	public void insert(Campaign campaign) throws CampaignException{
		int result = sqlSessionTemplate.insert("Campaign.insert", campaign);
		if(result<1) {
			throw new CampaignException("글등록 실패");
		}
	}

	@Override
	public void update(Campaign campaign) {
		int result = sqlSessionTemplate.update("Campaign.update", campaign);
		if(result<1) {
			throw new CampaignException("글수정 실패");
		}
	}

	@Override
	public void delete(int campaign_idx) {
		int result = sqlSessionTemplate.delete("Campaign.delete", campaign_idx);
		if(result<1) {
			throw new CampaignException("글삭제 실패");
		}
	}


}
