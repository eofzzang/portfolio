package org.gasan.domain;

import lombok.Data;

@Data
public class ScheduleVO { //영화 하나에 해당하는 스케쥴
	
	private int scheduleCode; //스케쥴 번호(기본키)
	private int theaterCode; //상영관 번호
	private int movieCode; //+상영영화코드
	private String playDate; //상영 날짜
	private String startTime; //시작 시간
	private String endTime; //마치는 시간
	private String movieName; //영화이름
	private String poster; // 영화 포스터 사진
	

}
