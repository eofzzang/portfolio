package org.gasan.controller;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.gasan.domain.DateVO;
import org.gasan.domain.MovieVO;
import org.gasan.domain.ScheduleVO;
import org.gasan.domain.SeatReservationVO;
import org.gasan.domain.SelectedScheduleVO;
import org.gasan.service.ListService;
import org.gasan.service.PayService;
import org.gasan.service.SeatService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/*")
@Log4j
@AllArgsConstructor
public class GasanController {

    private ListService listService;
    private SeatService seatService;
    private PayService payService;

    @GetMapping(value = "/movieList")
    public String getAllListBySelectedDate(Model model) throws Exception { // 영화리스트를 얻어온다.

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

        Calendar cal = Calendar.getInstance();
        cal.set(2020, 03, 25);
        log.info("Calendar : " + cal.getTime());
        log.info("getAllList ..... movieList");

        List<MovieVO> movieList = new ArrayList<MovieVO>(); // 영화 리스트(미선택)
        movieList = listService.getMovieList(cal.getTime());
        model.addAttribute("movieList", movieList);

        // --------------------------------------------------------------------

        log.info("getAllList ....... dateList");
        String month = null;
        String day = null;
        List<DateVO> dateList = new ArrayList<DateVO>(); // 날짜 리스트(현재날짜)
        dateList = listService.getDateList(cal.getTime());
        if (dateList.get(0).getMonth() < 10) {
            month = "0" + dateList.get(0).getMonth();
        } else {
            month = Integer.toString(dateList.get(0).getMonth());
        }
        if (dateList.get(0).getDay() < 10) {
            day = "0" + dateList.get(0).getDay();
        } else {
            day = Integer.toString(dateList.get(0).getDay());
        }

        model.addAttribute("today", Integer.toString(dateList.get(0).getYear()) + month + day);
        model.addAttribute("dateList", dateList);

        // --------------------------------------------------------------------

        log.info("getAllList ....... scheduleList");

        List<ScheduleVO> scheduleList = new ArrayList<ScheduleVO>(); // 현재날짜 기준 상영시간표 리스트
        scheduleList = listService.getScheduleListByDate(cal.getTime());
        model.addAttribute("scheduleList", scheduleList);

        return "movieList";
    }

    @PostMapping("/seatList")
    public String getSeatList(SelectedScheduleVO selectedScheduleVO, HttpSession session, Model model)
            throws ParseException {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Calendar cal = Calendar.getInstance();
        cal.setTime(sdf.parse(selectedScheduleVO.getSelectedDate()));
        String[] weekDay = new String[] {"일", "월", "화", "수", "목", "금", "토"};

        session.setAttribute("movie", selectedScheduleVO);
        session.setAttribute("scheduleCode", selectedScheduleVO.getSelectedScheduleCode());
        session.setAttribute("dayOfWeek", weekDay[cal.get(Calendar.DAY_OF_WEEK) - 1]);
        model.addAttribute("schedule", selectedScheduleVO);
        model.addAttribute("dayOfWeek", weekDay[cal.get(Calendar.DAY_OF_WEEK) - 1]);

        log.info("getList .............. seatList");
        log.info(selectedScheduleVO);
        log.info("scheduleCode : "+session.getAttribute("scheduleCode"));

        return "seatList";
    }

    @PostMapping("/payment")
    public String getPayment(SeatReservationVO seatReservationVO, HttpSession session, Model model) {

        seatReservationVO.setScheduleCode((int)session.getAttribute("scheduleCode"));
        seatService.reserve(seatReservationVO);
        model.addAttribute("seatReservation", seatReservationVO);
        session.setAttribute("seatReservation", seatReservationVO);
        
        log.info("payment............................................");
        log.info(session.getAttribute("movie"));
        log.info(seatReservationVO);

        return "payment";
    }

    @PostMapping(value = "/pay", produces = "application/json;charset=utf-8")
    @ResponseBody
    public void pay(HttpSession session, @RequestBody Map<String, String> map, Principal principal) { //ajax로 보낸 data map으로 받음.

    	log.info("/pay 매핑됨.");
    	
        SelectedScheduleVO schedule = (SelectedScheduleVO)session.getAttribute("movie");
        SeatReservationVO seat = (SeatReservationVO)session.getAttribute("seatReservation");
        session.setAttribute("seatStr", seat.getSelectedSeatList().toString().replace("[", "").replace("]", ""));
        payService.pay(schedule, seat, (String)session.getAttribute("seatStr"), map.get("imp_uid"), map.get("merchant_uid"), principal.getName()); //DB에 데이터 추가.

        log.info("i'mport 고유번호 : " + map.get("imp_uid"));
        log.info("가맹점 결제 고유번호 : " + map.get("merchant_uid"));
        log.info(seat.getSelectedSeatList().toString().replace("[", "").replace("]", ""));

    }

    @GetMapping("/ajax") // ajax 연습용
    public String getAjax() {

        log.info("ajax");

        return "ajax";
    }

    @GetMapping("/iamportEx")
    public String dd() {
        return "iamportEx";
    }
    
    @GetMapping("/modalTest")
    public String modal() {
    	return "modalTest";
    }

}
