package org.gasan.domain;

import lombok.Data;

@Data
public class SeatVO {

	private int theaterCode; 
	private int scheduleCode;
	private String seat;
	private boolean enabled;
}
