package org.gasan.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.gasan.domain.MemberVO;
import org.springframework.stereotype.Repository;

import lombok.extern.log4j.Log4j;

@Log4j
@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject SqlSession sql;
	
	private String namespace = "org.gasan.mapper.MemberMapper";
	
	//가입과 권한 조인
	@Override
	public MemberVO read(String userid){
		return sql.selectOne(namespace + ".read", userid); 
	}
	
	//회원가입
	@Override
	public void createMember(MemberVO vo) throws Exception{
		sql.insert(namespace + ".createMember", vo);
	}
	
	//회원 권한
	@Override
	public void createMemberAuth(MemberVO vo) throws Exception{
		sql.insert(namespace + ".createMemberAuth", vo);
	}
		
	//아이디 중복 체크
	@Override
	public int idChk(MemberVO vo) throws Exception{
		int result = sql.selectOne(namespace + ".idChk", vo);
		return result;
	}
	
	//이메일 인증권한
	@Override
	public void createAuthKey(String userEmail, String authKey) throws Exception { // 인증키 DB에 넣기
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("userEmail", userEmail);
		map.put("authKey", authKey);

		sql.selectOne(namespace + ".createAuthKey", map);
	}

	// 이메일 인증
	@Override
	public void userAuth(String userEmail) throws Exception { // 인증키 일치시 DB칼럼(인증여부) false->true 로 변경
		sql.update(namespace + ".userAuth", userEmail);
	}
	
	//회원 탈퇴
	@Override
	public void memberDelete(MemberVO vo) throws Exception{
		sql.delete(namespace + ".memberDelete", vo);
	}
	
	//서비스에서 보낸 파라미터들을 memberUpdate(MemberVO vo)에 담습니다.
	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		//vo에 담긴 파라미터들은 memberMapper.xml에 org.gasan.mapper.MemberMapper라는 namespace에
		//아이디가 memberUpdate인 쿼리에 파라미터들을 넣어줍니다.
		sql.update(namespace + ".memberUpdate", vo);
	}
}
