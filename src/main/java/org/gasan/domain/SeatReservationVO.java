package org.gasan.domain;

import java.util.List;

import lombok.Data;

@Data
public class SeatReservationVO {

	private int adultType; // 성인
	private int youthType; // 청소년
	private int preferentialType; // 우대
	private int totalPeople; // 총 인원 수 
	private int payAmount; // 결제금액
	private List<String> selectedSeatList; // 선택좌석 리스트
	private int theaterCode; // 상영관번호
	private int scheduleCode; // 스케쥴번호
	
}
