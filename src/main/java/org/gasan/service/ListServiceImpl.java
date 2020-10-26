package org.gasan.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.gasan.controller.ParseByDate;
import org.gasan.domain.DateVO;
import org.gasan.domain.MovieVO;
import org.gasan.domain.ScheduleVO;
import org.gasan.mapper.ScheduleListMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ListServiceImpl implements ListService {

	@Setter(onMethod_ = @Autowired)
	private ScheduleListMapper listMapper;
	
	

	@Override
	public List<MovieVO> getMovieList(Date date) throws Exception { //아무것도 선택하지 않은상태의 영화 리스트

		log.info("getMovieList..............");

		ArrayList<MovieVO> movieList = new ArrayList<MovieVO>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		ParseByDate parseByDate = new ParseByDate();
		movieList = (ArrayList<MovieVO>) parseByDate.getMovieByDate(sdf.format(date));

		return movieList;
	}

	@Override
	public List<DateVO> getDateList(Date date) { //예매가능 날짜 얻어오기.
		List<DateVO> dateList = new ArrayList<DateVO>();
		DateVO dateVO = null;
		Calendar cal = Calendar.getInstance();
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String[] dayOfWeek = new String[] {"일", "월", "화", "수", "목", "금", "토"};
		for(int i = 0; i<15; i++) {
			dateVO = new DateVO();
			cal.setTime(date); //today
			cal.add(Calendar.DATE, +i);
			dateVO.setYear(cal.get(Calendar.YEAR));
			dateVO.setMonth(cal.get(Calendar.MONTH)+1);
			dateVO.setDay(cal.get(Calendar.DATE));
			dateVO.setDayOfWeek(dayOfWeek[cal.get(Calendar.DAY_OF_WEEK)-1]);
			dateList.add(dateVO);
		}

		return dateList;
	}

	@Override
	public List<ScheduleVO> getScheduleListByDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		List<ScheduleVO> scheduleList = new ArrayList<ScheduleVO>();
		List<ScheduleVO> scheduleFromDB = listMapper.getScheduleListByDate(sdf.format(date));
		for(int i = 0; i<scheduleFromDB.size(); i++) {
			if(scheduleFromDB.get(i).getPlayDate().equals(sdf.format(date))) {
				scheduleList.add(scheduleFromDB.get(i));
			}
		}

		return scheduleList;
	}

	@Override
	public List<ScheduleVO> getScheduleListByName(String movieName) {
		List<ScheduleVO> scheduleList = new ArrayList<ScheduleVO>();
		List<ScheduleVO> scheduleFromDB = listMapper.getScheduleListByName(movieName);
		for(int i = 0; i<scheduleFromDB.size(); i++) {
			scheduleList.add(scheduleFromDB.get(i));
		}

		return scheduleList;
	}

	@Override
	public List<ScheduleVO> getScheduleListByAll(Date date, String movieName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		List<ScheduleVO> scheduleList = new ArrayList<ScheduleVO>();
		List<ScheduleVO> scheduleFromDB = listMapper.getScheduleListByAll(sdf.format(date), movieName);
		for(int i = 0; i<scheduleFromDB.size(); i++) {
			scheduleList.add(scheduleFromDB.get(i));
		}

		return scheduleList;
	}





}
