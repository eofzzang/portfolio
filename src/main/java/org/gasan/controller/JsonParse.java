package org.gasan.controller;


import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.web.servlet.ModelAndView;

public class JsonParse {
	
	
	
	JSONValue value = new JSONValue();
	
	@SuppressWarnings("unchecked")
	public static void main(String[] args) throws IOException, ParseException {
		
		JSONObject obj = new JSONObject();
		JSONArray array = new JSONArray();
//		obj.put("name", "value");
//		obj.put("age", 2019);
//		
//		array.add("messages01");
//		array.add("messages02");
//		array.add("messages03");
//		
//		obj.put("messages", array);
//		obj.put("hold", "line");
//		
//		
//		System.out.println(obj.get("name"));
//		System.out.println(obj.get("hold"));
//		System.out.println(obj);
		JSONParser parser = new JSONParser(); //json파일의 형태로 바꿔준다.
		
		Reader reader = new FileReader("c:\\MOCK_DATA.json"); //지정된 경로에 있는 json파일을 읽는다.
//		obj = (JSONObject) ((JSONArray) parser.parse(reader)).get(0);
//		System.out.println(obj);
		
		array = (JSONArray) parser.parse(reader); //읽어온 json 파일을 array타입의 array라는 변수에 맵형태인 json타입으로 바꿔서 저장
		int size = array.size(); //array의 길이. 각각의 인덱스마다 JSONObject가 들어있다.
		for(int i = 0; i<size; i++) {
			obj = (JSONObject) array.get(i); //array의 i번째 인덱스의 정보를 얻어서 obj에 저장. array의 데이터 형태는 key : value 인 맵 형태.
			String city = (String) obj.get("city"); //각각의 array에서 "city"라는 key의 value를 String city에 저장.
			System.out.println(obj); //출력
			System.out.println(city); //출력
		}
		
		
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
