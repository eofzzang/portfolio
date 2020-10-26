package org.gasan.service;

import java.util.ArrayList;
import java.util.List;

import org.gasan.controller.WebConnection;
import org.gasan.domain.MovieVO;
import org.gasan.domain.ScheduleVO;
import org.gasan.mapper.ScheduleListMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ListServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private ScheduleListMapper listMapper;
	

	@Test
	public void getMoiveListTest() throws Exception {
		
		log.info("getMovieListTest..............");
		
		ArrayList<MovieVO> movieList = new ArrayList<MovieVO>();

			WebConnection wc = new WebConnection();
			movieList = (ArrayList<MovieVO>) wc.parseBoxOffice();
			
			for(int i = 0; i< movieList.size(); i++) {
				System.out.println(movieList.get(i).getMovieName());
			}

	}
//
//	@Test
//	public void getDateListTest() { //예매가능 날짜 얻어오기.
//		List<DateVO> dateList = new ArrayList<DateVO>();
//		DateVO dateVO = null;
//		Calendar cal = Calendar.getInstance();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
//		String[] dayOfWeek = new String[] {"일", "월", "화", "수", "목", "금", "토"};
//		for(int i = 0; i<15; i++) {
//			dateVO = new DateVO();
//			cal.set(2020, 03, 25); //2020.03.25로 날짜 세팅
//			cal.add(Calendar.DATE, +i);
//			dateVO.setYear(cal.get(Calendar.YEAR)); //몇년도인지
//			dateVO.setMonth(cal.get(Calendar.MONTH)+1); //몇월인지
//			dateVO.setDay(cal.get(Calendar.DATE)); //몇일인지 세팅
//			dateVO.setDayOfWeek(dayOfWeek[cal.get(Calendar.DAY_OF_WEEK)-1]); //무슨 요일인지
//			dateList.add(dateVO); //리스트에 추가
//						System.out.println(dateList.get(i));
//		}
//
//	}
	
//	@Test
//	public void getScheduleListTest() {
//		List<ScheduleVO> scheduleList = new ArrayList<ScheduleVO>();
//		List<ScheduleVO> scheduleFromDB = listMapper.getScheduleListAll();
//		for(int i = 0; i<scheduleFromDB.size(); i++) {
//			if(scheduleFromDB.get(i).getPlayDate().equals("20200425")) {
//				scheduleList.add(scheduleFromDB.get(i));
//			}
//		}
//		for(int i = 0; i<scheduleList.size(); i++) {
//		System.out.println(scheduleList.get(i));
//		}
//	}
	
	@Test
	public void getScheduleListByMovieNameTest() {
		List<ScheduleVO> scheduleList = new ArrayList<ScheduleVO>();
		List<ScheduleVO> scheduleFromDB = listMapper.getScheduleListByAll("20200703", "베테랑");
		for(int i = 0; i<scheduleFromDB.size(); i++) {
			scheduleList.add(scheduleFromDB.get(i));
			System.out.println(scheduleList.get(i));
		}
		
	}
	


}
