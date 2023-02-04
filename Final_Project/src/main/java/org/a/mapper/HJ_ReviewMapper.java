package org.a.mapper;

import java.util.List;

import org.a.domain.Criteria;
import org.a.domain.HJ_ReviewVO;

public interface HJ_ReviewMapper {
	public List<HJ_ReviewVO> getList();
	
	public void insert(HJ_ReviewVO review);
	
	public List<HJ_ReviewVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public HJ_ReviewVO read(long rno);
	
	public int update(HJ_ReviewVO vo);
	
	public int delete(long rno);
	
}
