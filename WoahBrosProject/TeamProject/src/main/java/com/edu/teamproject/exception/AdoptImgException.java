package com.edu.teamproject.exception;

public class AdoptImgException extends RuntimeException{

	public AdoptImgException(String msg) {
		super(msg);
	}
	
	public AdoptImgException(String msg, Throwable e) {
		super(msg, e);
	}
}
