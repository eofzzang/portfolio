package org.gasan.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class PracticeCalendar {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Calendar cal = Calendar.getInstance();
		System.out.println(cal.getTime());
		System.out.println(cal.getTimeZone());
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd hh:mm:ss");
		System.out.println(sdf.format(cal.getTime()));
        System.out.println(cal.get(Calendar.YEAR));
        System.out.println(cal.get(Calendar.MONTH)+1);
        System.out.println(cal.get(Calendar.DATE));
        System.out.println(cal.get(Calendar.DAY_OF_YEAR));
        int nowDate = cal.get(Calendar.DAY_OF_YEAR);
        cal.set(2019, 0, 1); //날짜를 20190101로 세팅
//        System.out.println(cal.getTime()); //20190101에 해당하는 cal 출력
//        System.out.println(sdf.format(cal.getTime())); // format으로 바꾼 cal 출력
//        cal.add(Calendar.DATE, 5); // 20190101에서 5일 이후
//        System.out.println(sdf.format(cal.getTime()));
        for(int i = 0; i<363; i++) {
        	System.out.println(sdf.format(cal.getTime()));
        	cal.add(Calendar.DATE, 1);
        }
	}

}
