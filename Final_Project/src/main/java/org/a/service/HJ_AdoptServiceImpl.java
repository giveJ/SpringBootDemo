package org.a.service;

import java.util.List;

import org.a.domain.HJ_AdoptVO;
import org.a.mapper.HJ_AdoptMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class HJ_AdoptServiceImpl implements HJ_AdoptService{
	
	@Setter(onMethod_ = @Autowired)
	private HJ_AdoptMapper mapper;
	
	@Override
	public List<HJ_AdoptVO> getList() {
	
		log.info("getList...");
		
		return mapper.getList();
	}
	
	@Override
	public void register(HJ_AdoptVO vo) {
		
		log.info("register"+vo);
		
		mapper.insert(vo);
	}
	
	@Override
	public HJ_AdoptVO get(long ano) {

		log.info(ano);
		
		return mapper.read(ano);
	}
	
	@Override
	public boolean modify(HJ_AdoptVO vo) {

		log.info("modify"+vo);
		
		int result = mapper.update(vo);
		
		return result == 1 ? true : false;
	}
	
	@Override
	public boolean remove(long ano) {

		log.info("remove"+ano);
		
		return mapper.delete(ano)==1;
	}
	
}
