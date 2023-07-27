package com.edu.teamproject.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.edu.teamproject.domain.Adopt;
import com.edu.teamproject.domain.AdoptImg;
import com.edu.teamproject.domain.Product;
import com.edu.teamproject.domain.ProductImg;
import com.edu.teamproject.exception.UploadException;

@Component
public class FileManager {
	
	//파일명 생성하기
	public String createFileName(String filename) {
		Long time = System.currentTimeMillis();
		String ext = filename.substring(filename.lastIndexOf(".")+1,filename.length());
		
		return time+"."+ext;
	}
	
	//지정된 디렉토리로 파일저장  path 저장될 디렉토리 위치
	public void save(Adopt adopt, String dir) throws UploadException{
		
		//등록으로 채워진 adopt 테이블의 photo의 값을 List 로 담음.
		MultipartFile[] photoList=adopt.getPhoto();
		
		//AdoptImg 타입만 담는 List 를 adoptImgList변수명으로 생성.
		List<AdoptImg> adoptImgList =new ArrayList<AdoptImg>();
		adopt.setAdoptImgList(adoptImgList);
		
		try {
			for(MultipartFile photo : photoList) {
				
				try {
					Thread.sleep(10);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				AdoptImg adoptImg = new AdoptImg();
				adoptImg.setAdopt(adopt);  // pk 존재함.
				adoptImg.setFilename(createFileName(photo.getOriginalFilename()));
				
				//리스트에 pimg 추가.
				adoptImgList.add(adoptImg);
				
				
				//파일생성?
				photo.transferTo(new File(dir+adoptImg.getFilename()));
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
			throw new UploadException("업로드 실패", e);
		} catch (IOException e) {
			e.printStackTrace();
			throw new UploadException("업로드 실패", e);
		}
	}

	// -------------------------------------------------------------------------------------------
	//지정된 디렉토리로 파일저장  path 저장될 디렉토리 위치
	public void saveproduct(Product product, String dir) throws UploadException{
		
		//등록으로 채워진 product 테이블의 productp의 값을 List 로 담음.
		MultipartFile[] productList=product.getProductphoto();
		
		//productImg 타입만 담는 List 를 productImgList변수명으로 생성.
		List<ProductImg> productImgList =new ArrayList<ProductImg>();
		product.setProductImgList(productImgList); 
		
		try {
			for(MultipartFile productphoto : productList) {
				
				try {
					Thread.sleep(10);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				ProductImg productImg= new ProductImg();
				productImg.setProduct(product);  // 이 시점에 pk 존재
				productImg.setFilename(createFileName(productphoto.getOriginalFilename()));
				
				//리스트에 productImg 추가
				productImgList.add(productImg);
				
				//파일생성?
				productphoto.transferTo(new File(dir+productImg.getFilename()));
			}
		} catch (IllegalStateException e) { //예외전환, 우리가 만든 예외처리
			e.printStackTrace();
			throw new UploadException("상품 사진 업로드 실패", e);
		} catch (IOException e) {
			e.printStackTrace();
			throw new UploadException("상품 사진 업로드 실패", e);
		}
	}
}
