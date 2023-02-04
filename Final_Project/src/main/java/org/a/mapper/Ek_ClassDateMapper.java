package org.a.mapper;

import java.util.List;

import org.a.domain.Ek_ClassDateVO;

public interface Ek_ClassDateMapper {
	public void insertDate(Ek_ClassDateVO dvo);
	public long getCno();
	public List<Ek_ClassDateVO> selectDate(String s_date);
}
