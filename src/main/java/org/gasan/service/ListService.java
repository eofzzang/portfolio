package org.gasan.service;


import java.text.ParseException;
import java.util.Date;
import java.util.List;

import org.gasan.domain.DateVO;
import org.gasan.domain.MovieVO;
import org.gasan.domain.ScheduleVO;

public interface ListService {
	
	public List<MovieVO> getMovieList(Date date) throws Exception; //영화 리스트

	public List<DateVO> getDateList(Date date) throws ParseException; //현재 4월 25일로 설정해둔 상태 추후 매개변수 추가할 것, +15일까지 표시.
	
	public List<ScheduleVO> getScheduleListByDate(Date date); 
	//날짜 기준으로 스케쥴표 얻어옴.
	
	public List<ScheduleVO> getScheduleListByName(String movieName); 
	
	
	public List<ScheduleVO> getScheduleListByAll(Date date, String movieName);
	//상영날짜 + 영화제목 으로 스케쥴표 얻어옴

	
}
