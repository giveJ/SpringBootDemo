package org.a.service;

import java.util.List;

import org.a.domain.Criteria;
import org.a.domain.HJ_ReviewVO;

public interface HJ_ReviewService {
	
	public List<HJ_ReviewVO> getList();
	
	public List<HJ_ReviewVO> getListWithPaging(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public void register(HJ_ReviewVO vo);
	
	public HJ_ReviewVO get(long rno);
	
	public boolean modify(HJ_ReviewVO vo);
	
	public boolean remove(long rno); 
}
