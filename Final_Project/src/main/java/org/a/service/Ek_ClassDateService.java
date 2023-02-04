package org.a.service;


import java.util.List;


import org.a.domain.Ek_ClassDateVO;

public interface Ek_ClassDateService {
	
	public void insertDate(Ek_ClassDateVO dvo); 
	
	public List<Ek_ClassDateVO> selectDate(String s_date);

}