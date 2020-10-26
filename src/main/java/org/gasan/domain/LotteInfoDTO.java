package org.gasan.domain;


import lombok.Data;

@Data
public class LotteInfoDTO {

//	private String fileName,uploadPath,uuid;
//	private boolean image;
	
	public String posters, ranks, movieAges, movieTitles,
	movieRates, movieRates2, likes;
	public LotteInfoDTO(){
		
	}
	public LotteInfoDTO(String a,String b,String c,String d,String e,String f,String g){
		posters = a; ranks = b; movieAges=c; movieTitles=d;
		movieRates=e; movieRates2=f; likes=g;
	}
	
}
