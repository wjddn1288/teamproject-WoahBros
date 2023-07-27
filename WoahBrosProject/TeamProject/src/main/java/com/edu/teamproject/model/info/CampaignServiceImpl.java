package com.edu.teamproject.model.info;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.teamproject.domain.Campaign;
import com.edu.teamproject.exception.CampaignException;

@Service
public class CampaignServiceImpl implements CampaignService{

	@Autowired
	private CampaignDAO campaignDAO;
	
	@Override
	public List<Campaign> selectAll() {
		return campaignDAO.selectAll();
	}

	@Override
	public Campaign select(int campaign_idx) {
		return campaignDAO.select(campaign_idx);
	}

	@Override
	public void insert(Campaign campaign) throws CampaignException{
		campaignDAO.insert(campaign);
	}

	@Override
	public void update(Campaign campaign) throws CampaignException{
		campaignDAO.update(campaign);
	}

	@Override
	public void delete(int campaign_idx) throws CampaignException{
		campaignDAO.delete(campaign_idx);
	}

	@Override
	public List<Campaign> selectBySearch(Map map) {
		return campaignDAO.selectBySearch(map);
	}

}
