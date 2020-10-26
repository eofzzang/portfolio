package org.gasan.domain;

import java.util.Map;

import lombok.Data;

@Data
public class DateVO {

	private int year; //년
	private int month; //월
	private int day; //일
	private String dayOfWeek; //요일
}
