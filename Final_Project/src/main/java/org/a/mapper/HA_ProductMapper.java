package org.a.mapper;

import java.util.List;

import org.a.domain.HA_ProductVO;

public interface HA_ProductMapper {
	
	//추상메소드 생성하기
	// 전체 목록 가져오기 (모든 메소드 다 가져오기)
	public List<HA_ProductVO> getList();

	// 한 개 데이터 가져오기 read(int product_id)
	public HA_ProductVO read(int product_id);
	
	
	
}
