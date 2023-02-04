package org.a.service;


import javax.inject.Inject;

import org.a.domain.aVO;
import org.a.mapper.aMapper;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j

public class aServiceImpl implements aService {
	
	@Inject aMapper mapper;
	
	// 회원가입
	@Override
	public void register(aVO vo) throws Exception {
		
		mapper.register(vo);
		
	}
	
	// 로그인
	@Override
	public aVO login(aVO vo) throws Exception {
		return mapper.login(vo);
	}
	
	
	// 회원정보 수정
	@Override
	public void memberUpdate(aVO vo) throws Exception {
		mapper.memberUpdate(vo);
		
	}

	
	// 회원 탈퇴
	@Override
	public void memberDelete(aVO vo) throws Exception {
		mapper.memberDelete(vo);
		
	}
	
	
	// 회원 탈퇴 비밀번호 확인
	@Override
	public int passChk(aVO vo) throws Exception {
		int result = mapper.passChk(vo);
		return result;
	}
	
	
	// 아이디 중복체크
	@Override
	public int idCheck(String user_ID) throws Exception {
		return mapper.idCheck(user_ID);
	}
	
	

	

}
