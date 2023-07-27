package com.edu.teamproject.exception;

public class CampaignException extends RuntimeException{

	public CampaignException(String msg) {
		super(msg);
	}
	
	public CampaignException(String msg, Throwable e) {
		super(msg, e);
	}
}
