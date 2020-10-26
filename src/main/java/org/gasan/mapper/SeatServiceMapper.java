package org.gasan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.gasan.domain.SeatReservationVO;
import org.gasan.domain.SeatVO;
import org.gasan.domain.SelectedScheduleVO;

public interface SeatServiceMapper {

	public int showRemainedSeat(@Param("scheduleCode") int scheduleCode); 
	
	public List<SeatVO> showEnabledSeat(@Param("scheduleCode") int scheduleCode);
	
	public void reserveSeat(@Param("reservation") SeatReservationVO seatReservationVO, @Param("seat") SeatVO seatVO);
	
	public void reserveSeatCancel(@Param("reservation") SeatReservationVO seatReservationVO, @Param("seat") SeatVO seatVO);
}
