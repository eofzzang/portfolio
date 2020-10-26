package org.gasan.domain;

import lombok.Data;

@Data
public class DailyBoxOfficeVO {

	private String openDate; //개봉일
	private String movieName; //영화제목
	private int rnum; //API상에서의 순번
	
}
