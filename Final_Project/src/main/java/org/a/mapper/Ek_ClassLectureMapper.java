package org.a.mapper;

import java.util.List;

import org.a.domain.Ek_ClassLectureVO;

public interface Ek_ClassLectureMapper {
	public List<Ek_ClassLectureVO> getList();  //클래스 전체 나열
	public Ek_ClassLectureVO classGet(long cno); //클래스 상세보기
	public void insert_class(Ek_ClassLectureVO lvo);//클래스 추가하기
	public long getCno(); //최신 cno값 
	public List<Ek_ClassLectureVO> MList(Ek_ClassLectureVO lvo);
	
	
}
