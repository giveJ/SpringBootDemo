package org.a.mapper;

import org.a.domain.aVO;

public interface aMapper {
	public aVO read(String user_id);
	
	// 회원가입
	public void register(aVO vo);
	
	// 로그인
	public aVO login(aVO vo);
	
	// 회원정보 수정
	public void memberUpdate(aVO vo);
	
	// 회원 탈퇴
	public void memberDelete(aVO vo)throws Exception;
	
	// 회원 탈퇴 비밀번호 확인
	public int passChk(aVO vo) throws Exception;
	
	// 아이디 중복체크
	public int idCheck(String user_ID) throws Exception;
	
}
