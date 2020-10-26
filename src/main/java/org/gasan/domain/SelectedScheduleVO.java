package org.gasan.domain;

import lombok.Data;

@Data
public class SelectedScheduleVO {

	private int selectedScheduleCode; //스케쥴 번호(기본키)
	private int selectedTheaterNumber; //상영관 번호
	private int selectedMovieCode; //+상영영화코드
	private String selectedDate; //상영 날짜
	private String selectedStartTime; //시작 시간
	private String selectedEndTime; //마치는 시간
	private String selectedMovie; //영화이름
	private String selectedPoster; // 영화 포스터 사진
	
}
