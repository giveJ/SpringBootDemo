package org.a.service;

import java.util.HashMap;
import java.util.List;

import org.a.domain.Ek_ClassDateVO;
import org.a.domain.Ek_ClassImageVO;
import org.a.domain.Ek_ClassLectureVO;
import org.a.mapper.Ek_ClassDateMapper;
import org.a.mapper.Ek_ClassImageMapper;
import org.a.mapper.Ek_ClassLectureMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class Ek_ClassLectureServiceImpl implements Ek_ClassLectureService{
	
	@Setter(onMethod_ = @Autowired)
	private Ek_ClassLectureMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private Ek_ClassImageMapper imapper;
	
	@Setter(onMethod_ = @Autowired)
	private Ek_ClassDateMapper dmapper;
	
	
	//class_list로 이동
	@Override
	public List<Ek_ClassLectureVO> getList() {
		log.info("class_list......");
		return mapper.getList(); 
	}

	//선택한 클래스 상세보기 이동
	@Override
	public Ek_ClassLectureVO classGet(long cno) {
		log.info("classGet_SERVICE" + cno);
		
		return mapper.classGet(cno);
	}

	
	//클래스 만들기
	@Override
	public void insert_class(Ek_ClassLectureVO lvo) {
		log.info("INSERT_CLASS----------+" + lvo);
		mapper.insert_class(lvo);
		
		long cno = mapper.getCno();
		log.error("RECENT CNO VALUE.....+ : "+cno);
		if(lvo.getClassImageList() != null && lvo.getClassImageList().size() > 0) {
			for(Ek_ClassImageVO vo : lvo.getClassImageList()) {
				vo.setCno(cno);
				imapper.insert(vo);
			}
		}
		
	}

	/*
	 * @Override public List<Ek_ClassLectureVO> MList(Ek_ClassLectureVO lvo) {
	 * log.info("id가 **인 회원이 생성한 클래스 뽑기" + lvo);
	 * 
	 * return mapper.MList(lvo.setUser_ID("admin")); }
	 */








	
	
	
}
