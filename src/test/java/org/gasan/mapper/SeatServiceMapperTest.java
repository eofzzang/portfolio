package org.gasan.mapper;

import org.gasan.domain.SeatReservationVO;
import org.gasan.domain.SeatVO;
import org.gasan.domain.SelectedScheduleVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SeatServiceMapperTest {

	@Setter(onMethod_ = @Autowired)
	private SeatServiceMapper mapper;

	@Test
	public void showTotalSeatTest() {
		mapper.showRemainedSeat(1);
	}

	@Test
	public void showRemainedSeatTest() {
		mapper.showRemainedSeat(1);
	}

	@Test
	public void reserveCancelTest() {

		for (int i = 0; i < 1; i++) {
			SeatVO seat = new SeatVO();
			SeatReservationVO seatReservationVO = new SeatReservationVO();
			seatReservationVO.setScheduleCode(1);
			seat.setSeat("A6");
			mapper.reserveSeatCancel(seatReservationVO, seat);
		}
	}

}
