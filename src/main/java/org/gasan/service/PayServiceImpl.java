package org.gasan.service;

import org.gasan.domain.SeatReservationVO;
import org.gasan.domain.SelectedScheduleVO;
import org.gasan.mapper.PayServiceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PayServiceImpl implements PayService {

    @Setter(onMethod_ = @Autowired)
    private PayServiceMapper payServiceMapper;

    @Override
    public void pay(SelectedScheduleVO selectedScheduleVO, SeatReservationVO seatReservationVO, String seatList,
            String imp_uid, String merchant_uid, String userId) {
        payServiceMapper.registPaymentHistory(userId, imp_uid, merchant_uid, selectedScheduleVO, seatReservationVO, seatList);
    }

	@Override
	public String createPaymentNumber() {
		
		String paymentNumber = "";
    	
    	do {
    		paymentNumber = "ORD"+String.valueOf((int)(Math.random()*99999));
    	} while(payServiceMapper.checkPaymentNumber(paymentNumber) != 0);
    	
		return paymentNumber;
	}

}
