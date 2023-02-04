package org.a.service;

import java.util.List;

import org.a.domain.Criteria;
import org.a.domain.HJ_FamilyVO;

public interface HJ_FamilyService {
	
	public List<HJ_FamilyVO> getList();
	
	public List<HJ_FamilyVO> getListWithPaging(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public void register(HJ_FamilyVO vo);
	
	public HJ_FamilyVO get(long fno);
	
	public boolean modify(HJ_FamilyVO vo);
	
	public boolean remove(long fno);
	
}
