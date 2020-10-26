package org.gasan.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentVO {

	private int paymentNumber;
	private int reservationNumber;
	private String userId;
	private String movieName;
	private int theaterNumber;
	private String scheduleDate;
	private String startTime;
	private String endTime;
	private int adultType;
	private int youthType;
	private int preferentialType;
	private String seatList;
	private int payAmount;
	private Date payTime;
	
}
