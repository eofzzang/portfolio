package org.gasan.domain;


import lombok.Data;

@Data
public class CGVInfoDTO {

//	private String fileName,uploadPath,uuid;
//	private boolean image;
	
	public String ranks, imgs, movieAges, movieTitles,
	movieRates, movieOpenDates, likes;
	public CGVInfoDTO(){
		
	}
	public CGVInfoDTO(String a,String b,String c,String d,String e,String f,String g){
		ranks = a; imgs = b; movieAges=c; movieTitles=d;
		movieRates=e; movieOpenDates=f; likes=g;
	}
	
}
