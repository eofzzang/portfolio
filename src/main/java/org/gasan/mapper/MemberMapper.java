package org.gasan.mapper;

import org.gasan.domain.MemberVO;

public interface MemberMapper {
	
	//가입과 권한 조인
	public MemberVO read(String userid);
	
	//회원가입
	public void createMember(MemberVO vo);
	public void createMemberAuth(MemberVO vo);
	
	//회원 정보 수정
	public void memberUpdate(MemberVO vo);
	
	//아이디 중복 체크
	public int idChk(MemberVO vo);
	
	//이메일 인증키
	public void createAuthKey(String userEmail, String authKey);

	//이메일 인증
	public void userAuth(String userEmail);
	
}
