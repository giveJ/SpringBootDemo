package org.a.service;


import java.util.List;

import org.a.domain.Ek_ClassDateVO;
import org.a.domain.Ek_ClassImageVO;
import org.a.domain.Ek_ClassLectureVO;

public interface Ek_ClassImageService {
	
	
	public List<Ek_ClassImageVO> getAttachList(long cno);  //cno값 가지고 있는 이미지 뽑기
	public List<Ek_ClassImageVO> fileType(Ek_ClassImageVO ivo);
	
	
	
}