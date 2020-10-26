package org.gasan.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {

	private String userid;
	private String userpw;
	private String userName;
	private String userGender;
	private String userBirth;
	private String userPhone;
	private String userEmail;
	private String userGenre;
	private Date regDate;
	private Date updateDate;
	private boolean enabled;
	private boolean userCertification;
	
	
	private List<AuthVO> authList;
}
