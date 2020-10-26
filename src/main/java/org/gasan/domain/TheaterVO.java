package org.gasan.domain;

import java.util.List;

import lombok.Data;

@Data
public class TheaterVO { //상영관 하나가 갖고 있는 정보.

	private int theaterCode; //상영관 번호(기본키)
	private int totalSeatCount; //총 좌석 갯수
	private int currentSeatCount; //현재 좌석 현황
//	private String seatRow;//+좌석 행
//	private int seatColumn;//+좌석 열
//	private String movieName;//영화제목
//	private String movieCode;//+상영영화코드
//	private String playDate;//상영 날짜
//	private String startTime;//시작 시간
//	private String endTime; //마치는 시간
}
