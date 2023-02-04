package org.a.service;

import java.util.List;

import org.a.domain.HA_ProductAttachVO;
import org.a.domain.HA_ProductVO;
import org.a.mapper.HA_ProductAttachMapper;
import org.a.mapper.HA_ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class HA_ProductServiceImpl implements HA_ProductService {

	@Setter(onMethod_ = @Autowired)
	private HA_ProductMapper mapper;	//mapper를 컨테이너에 명시해둬서 그냥 쓰면 됨
	
	@Setter(onMethod_ = @Autowired)
	private HA_ProductAttachMapper attachMapper;	
	
	// 1. 상품목록
	@Override
	public List<HA_ProductVO> getList() {
		log.info("getList...");
		return mapper.getList();
	}
	
	// 2. 상품상세
	@Override
	public HA_ProductVO get(int product_id) {
		log.info("get..." + product_id);
		return mapper.read(product_id);
	}
	
	
	
	@Override
	public List<HA_ProductAttachVO> getAttachList(int product_id) {
		log.info(attachMapper);
		return attachMapper.findByBno(product_id);
	}
	
}
