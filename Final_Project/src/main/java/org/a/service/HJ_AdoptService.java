package org.a.service;

import java.util.List;

import org.a.domain.HJ_AdoptVO;

public interface HJ_AdoptService {
	
	public List<HJ_AdoptVO> getList();
	
	public void register(HJ_AdoptVO vo);
	
	public HJ_AdoptVO get(long ano);
	
	public boolean modify(HJ_AdoptVO vo);
	
	public boolean remove(long ano);
}
