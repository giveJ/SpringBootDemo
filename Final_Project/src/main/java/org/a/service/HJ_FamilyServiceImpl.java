package org.a.service;

import java.util.List;

import org.a.domain.Criteria;
import org.a.domain.HJ_FamilyVO;
import org.a.mapper.HJ_FamilyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Service
@Log4j
public class HJ_FamilyServiceImpl implements HJ_FamilyService{
	
	@Setter(onMethod_ = @Autowired)
	private HJ_FamilyMapper mapper;
	
	
	@Override
	public List<HJ_FamilyVO> getList() {
		
		log.info("getList>>>>");
		return mapper.getList();
	}

	@Override
	public void register(HJ_FamilyVO vo) {
		
		log.info("register.." + vo);
		
		mapper.insert(vo);
	}

	@Override
	public List<HJ_FamilyVO> getListWithPaging(Criteria cri) {
		log.info("get List with Criteria" + cri);
		return mapper.getListWithPaging(cri);
	}

	
	@Override
	public int getTotal(Criteria cri) {
		log.info("getTotalCount........");
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public HJ_FamilyVO get(long fno) {
		
		log.info("get..."+fno);
		
		return mapper.read(fno);
	}
	
	@Override
	public boolean modify(HJ_FamilyVO vo) {
		
		log.info("modify.."+vo);
		
		int result = mapper.update(vo);
		
		return result == 1 ? true : false;
	}
	
	@Override
	public boolean remove(long fno) {
		log.info("modify.."+fno);
		
		return mapper.delete(fno) == 1;
	}
	
	
	
}
