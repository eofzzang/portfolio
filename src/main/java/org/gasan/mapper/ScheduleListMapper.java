package org.gasan.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.gasan.domain.ScheduleVO;

public interface ScheduleListMapper {
	
	public List<ScheduleVO> getScheduleListByDate(@Param("date") String date); 
	//영화무관 날짜에만 맞는 리스트 출력
	public List<ScheduleVO> getScheduleListByName(@Param("movieName") String movieName);
	//영화제목에만 상관있는 리스트 출력
	public List<ScheduleVO> getScheduleListByAll(@Param("date") String date, @Param("movieName") String movieName);
	//날짜와 영화 모두 상관있는 리스트 출력

}
