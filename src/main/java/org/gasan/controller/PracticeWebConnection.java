package org.gasan.controller;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

class PracticeWebConnection{
	String json;
	List<String> list;
	
//	PracticeWebConnection() throws Exception{
//		Calendar cal = Calendar.getInstance();
//		this.list = new ArrayList<String>();
//		String address = null;
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
//		cal.set(2019, 0, 1);
//		for(int i = 0; i<5; i++) {
//			String date = sdf.format(cal.getTime());
//			address = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=09a9ba7f2b8c18c566fb30f6ee83ae4f&targetDt="+date;
//		
//		BufferedReader br;
//		URL url;
//		HttpURLConnection conn;
//		String protocol = "GET";
//
//		url = new URL(address);
//		conn = (HttpURLConnection)url.openConnection();
//		conn.setRequestMethod(protocol);
//		br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//
//
//		json = br.readLine(); //읽어옴
//		list.add(json);
//		cal.add(Calendar.DATE, 1);
//		System.out.println(date);
//		}
//	}
		
			

	public static void main(String[] args) throws Exception {
		Calendar cal = Calendar.getInstance();
		List<String> list = new ArrayList<String>();
		String address = null;
		String json = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String date = null;
		cal.set(2019, 0, 1);
		for(int i = 0; i<60; i++) {
			date = sdf.format(cal.getTime());
			address = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=09a9ba7f2b8c18c566fb30f6ee83ae4f&targetDt="+date;
		
		BufferedReader br;
		URL url;
		HttpURLConnection conn;
		String protocol = "GET";

		url = new URL(address);
		conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod(protocol);
		br = new BufferedReader(new InputStreamReader(conn.getInputStream()));


	    json = br.readLine(); //읽어옴
		list.add(json);
		cal.add(Calendar.DATE, 1);
		System.out.println(date);
//		}
		
//		System.out.println(wc.json);
		JSONParser parser = new JSONParser();
		JSONObject obj = new JSONObject();
//		
//		for(int i = 0; i<5; i++) {
			obj = (JSONObject) parser.parse(list.get(i));
//			System.out.println(obj);
//			System.out.println(obj.get("boxOfficeResult"));
		JSONObject boxOfficeResult = (JSONObject) obj.get("boxOfficeResult");
		JSONArray array = (JSONArray) boxOfficeResult.get("dailyBoxOfficeList");
//		
			for(int j = 0; j<array.size(); j++) {
				JSONObject movie = (JSONObject) array.get(j);
			System.out.println(date+" 에 상영한 "+(j+1)+"번째 영화 : "+movie.get("movieNm"));
			}
		}
		
		
		
	}
}
