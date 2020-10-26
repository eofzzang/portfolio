package org.gasan.domain;

import lombok.Data;

@Data
public class TimeTableVO {
	
	private String movieName; //영화제목
	private String theaterNumber; //상영관
	private String showTime; //상영시간
	private String currentSeat; //현재좌석
	
}
