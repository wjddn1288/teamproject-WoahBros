package com.edu.teamproject.exception;

public class DonateException extends RuntimeException{

	public DonateException(String msg) {
		super(msg);
	}
	
	public DonateException(String msg, Throwable e) {
		super(msg, e);
	}
}
