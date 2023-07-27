package com.edu.teamproject.model.info;

import java.util.List;
import java.util.Map;

import com.edu.teamproject.domain.Campaign;

public interface CampaignService {
	public List<Campaign> selectAll();
	public List<Campaign> selectBySearch(Map map); 
	public Campaign select(int campaign_idx);
	public void insert(Campaign campaign);
	public void update(Campaign campaign);
	public void delete(int campaign_idx);
}
