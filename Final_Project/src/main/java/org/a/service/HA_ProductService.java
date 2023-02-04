package org.a.service;

import java.util.List;

import org.a.domain.HA_ProductAttachVO;
import org.a.domain.HA_ProductVO;

public interface HA_ProductService {

	//전체 목록 가지고 오는 getList
	public List<HA_ProductVO> getList();
	
	public HA_ProductVO get(int product_id);
	
	
	
	
	public List<HA_ProductAttachVO> getAttachList(int product_id);
	
	
}
