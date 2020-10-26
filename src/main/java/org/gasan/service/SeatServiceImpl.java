package org.gasan.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.gasan.domain.SeatReservationVO;
import org.gasan.domain.SeatVO;
import org.gasan.domain.SelectedScheduleVO;
import org.gasan.mapper.SeatServiceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class SeatServiceImpl implements SeatService {

	@Setter(onMethod_ = @Autowired)
	private SeatServiceMapper seatServiceMapper;


	@Override
	public void reserve(SeatReservationVO seatReservationVO) {

		for (int i = 0; i < seatReservationVO.getSelectedSeatList().size(); i++) {
			SeatVO seat = new SeatVO();
			seat.setSeat(seatReservationVO.getSelectedSeatList().get(i));
			seatServiceMapper.reserveSeat(seatReservationVO, seat);
		}
	}
	
	@Override
	public void reserveCancel(SeatReservationVO seatReservationVO) {
		
		for (int i = 0; i < seatReservationVO.getSelectedSeatList().size(); i++) {
			SeatVO seat = new SeatVO();
			seat.setSeat(seatReservationVO.getSelectedSeatList().get(i));
			seatServiceMapper.reserveSeatCancel(seatReservationVO, seat);
		}
	}

}
