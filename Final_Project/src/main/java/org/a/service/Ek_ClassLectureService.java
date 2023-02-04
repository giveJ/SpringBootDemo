package org.a.service;


import java.util.List;

import org.a.domain.Ek_ClassDateVO;
import org.a.domain.Ek_ClassImageVO;
import org.a.domain.Ek_ClassLectureVO;

public interface Ek_ClassLectureService {
	public List<Ek_ClassLectureVO> getList();  //전체 리스트 
	public Ek_ClassLectureVO classGet(long cno);  //클래스 상세보기
	public void insert_class(Ek_ClassLectureVO lvo);  //클래스 내용 입력
	
	/* public List<Ek_ClassLectureVO> MList(Ek_ClassLectureVO lvo); */
	
}