package org.gasan.service;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

public interface InfoService {

	public String getMovieName(@Param("selectedMovie") String movieName);
	
	public int getTheaterCode(@Param("selectedTheaterNumber") String theaterNumber);
	
	public String getStartTime(@Param("selectedStartTime") String startTime);
	
	public String getEndTime(@Param("selectedEndTime") String endTime);
	
	public Date getPlayDate(@Param("selectedDate") String playDate);
	
	public String getScheduleCode(@Param("selectedScheduleCode") String scheduleCode);
}
