package org.gasan.domain;

import java.util.List;

import lombok.Data;

@Data
public class UserVO {

	private String userId;//+아이디(기본키)
	private String userPwd;//+비밀번호
	private String userName;//+이름
	private String userBirth;//+생년월일
	private String userPhone;//+전화번호
	private String userEmail;//+이메일
	private String userRegDate;//+가입일
	private List<String> userGenre;//+선호장르1,2,3
}
