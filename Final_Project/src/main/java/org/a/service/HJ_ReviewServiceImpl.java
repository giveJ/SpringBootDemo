package org.a.service;

import java.util.List;

import org.a.domain.Criteria;
import org.a.domain.HJ_ReviewVO;
import org.a.mapper.HJ_ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class HJ_ReviewServiceImpl implements HJ_ReviewService{
	
	@Setter(onMethod_ = @Autowired)
	private HJ_ReviewMapper mapper;
	
	@Override
		public List<HJ_ReviewVO> getList() {
			
			log.info("getList....");
			
			return mapper.getList();
		}
		
	
	@Override
	public List<HJ_ReviewVO> getListWithPaging(Criteria cri) {
		
		log.info("get List,..." + cri);
		
		return mapper.getListWithPaging(cri);
	}
		
	
	@Override
	public int getTotal(Criteria cri) {

		log.info("Total>>>");
		
		return mapper.getTotalCount(cri);
	}
	
	@Override
		public void register(HJ_ReviewVO vo) {
			
			log.info("register"+vo);
			
			mapper.insert(vo);
		}	
	@Override
	public HJ_ReviewVO get(long rno) {
		
		log.info("review get.."+ rno);
		
		return mapper.read(rno);
	}
		
	
	@Override
	public boolean modify(HJ_ReviewVO vo) {
		
		log.info("modify..."+vo);
		
		int result = mapper.update(vo);
		
		return result == 1 ? true : false;
	}
	
	@Override
	public boolean remove(long rno) {
			
		log.info("remove.."+rno);
		
		return mapper.delete(rno)==1;
	}
}
