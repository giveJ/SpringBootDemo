package org.a.mapper;

import java.util.List;

import org.a.domain.HJ_AdoptVO;

public interface HJ_AdoptMapper {
	public List<HJ_AdoptVO> getList();
	
	public void insert(HJ_AdoptVO adopt);
	
	public HJ_AdoptVO read(long ano);
	
	public int update(HJ_AdoptVO vo);
	
	public int delete(long ano);
}
