package org.gasan.mapper;

import org.apache.ibatis.annotations.Param;
import org.gasan.domain.SeatReservationVO;
import org.gasan.domain.SelectedScheduleVO;

public interface PayServiceMapper {

    public void registPaymentHistory(@Param("userId") String userId, @Param("imp_uid") String imp_uid, @Param("merchant_uid") String merchant_uid,
            @Param("schedule") SelectedScheduleVO selectedScheduleVO,
            @Param("seat") SeatReservationVO seatReservationVO, @Param("seatList") String seatList);
    
    public int checkPaymentNumber(@Param("paymentNumber") String paymentNumber);
}
