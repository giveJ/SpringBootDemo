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
public class Ek_ClassImageServiceImpl implements Ek_ClassImageService{
	
	
	@Setter(onMethod_ = @Autowired)
	private Ek_ClassImageMapper imapper;
	
	
	

	//선택한 클래스의 이미지 전체 리스트 불러오기
	@Override
	public List<Ek_ClassImageVO> getAttachList(long cno) {
		log.info("getAttachList.... : " + cno);
		
		List<Ek_ClassImageVO> list= imapper.findByCno(cno);
		log.info("getAttach List.......  "+list);
		
		return list;
	}


	
	@Override
	public List<Ek_ClassImageVO> fileType(Ek_ClassImageVO ivo) {  //fileType이 1인 이미지들
		log.info("FILE _ TYPE IS......? : " + ivo);
		List<Ek_ClassImageVO> list = imapper.fileType(ivo);
		ivo.getCno();
		ivo.getFileType();
		
		return list;
	}








	
	
	
}
