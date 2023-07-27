package com.edu.teamproject.exception;

public class AdoptException extends RuntimeException{

	public AdoptException(String msg) {
		super(msg);
	}
	
	public AdoptException(String msg, Throwable e) {
		super(msg, e);
	}
}
