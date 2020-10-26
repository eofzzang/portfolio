package org.gasan.service;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class InfoServiceImpl implements InfoService {
	
	@Override
	public String getMovieName(String movieName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTheaterCode(String theaterNumber) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String getStartTime(String startTime) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getEndTime(String endTime) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Date getPlayDate(String playDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getScheduleCode(String scheduleCode) {
		// TODO Auto-generated method stub
		return null;
	}


}
