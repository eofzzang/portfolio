package org.gasan.domain;

import lombok.Data;

@Data
public class ReservationVO {

	private int reserveNumber;//+예매번호(기본키)
	private String movieName; //+영화제목
	private int theaterNumber;//+상영관번호
	private String playDate;//+상영날짜
	private int runningTime;//+러닝타임
	private String[] reservedSeat;//+예매좌석
	private String userId;//+예매자 아이디
	private String payTime;//+결제한 시간
	private int pay;//+결제금액
	private int payNumber;//+결제번호
}
