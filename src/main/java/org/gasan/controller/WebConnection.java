package org.gasan.controller;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.gasan.domain.MovieVO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class WebConnection{
	public String json;
	public WebConnection() throws Exception{
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance();
		//시스템상의 날짜는 2020.04.25로 설정.
		cal.set(2020, 03, 25);
		String date = sdf.format(cal.getTime()); //2020.04.25 날짜로 박스오피스 정보 받아오기.
		
		String address = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=09a9ba7f2b8c18c566fb30f6ee83ae4f&targetDt="+date;
		BufferedReader br;
		URL url;
		HttpURLConnection conn;
		String protocol = "GET";

		url = new URL(address);
		conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod(protocol);
		br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

		json = br.readLine(); //읽어옴
		
	}
	
	public List<MovieVO> parseBoxOffice() throws Exception {
		
		
		List<MovieVO> movieList = new ArrayList<MovieVO>();
		MovieVO movieVO = null;
		WebConnection wc = new WebConnection();
		JSONParser parser = new JSONParser();
		JSONObject obj = new JSONObject();
		obj = (JSONObject) parser.parse(wc.json);
		//			System.out.println(obj.get("boxOfficeResult"));
		JSONObject boxOfficeResult = (JSONObject) obj.get("boxOfficeResult");
		JSONArray array = (JSONArray) boxOfficeResult.get("dailyBoxOfficeList");

		for(int i = 0; i< array.size(); i++) {
			movieVO = new MovieVO();
			JSONObject movie = (JSONObject) array.get(i);
			movieVO.setMovieName((String)movie.get("movieNm"));
			movieVO.setOpenDate((String)movie.get("openDt"));
			movieList.add(movieVO);
		}
		return movieList;
	}

}

