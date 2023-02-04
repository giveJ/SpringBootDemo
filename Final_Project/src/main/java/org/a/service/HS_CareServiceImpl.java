package org.a.service;


import java.util.List;

import org.a.domain.HS_BookingVO;
import org.a.domain.HS_PetsitterVO;
import org.a.domain.HS_PstReplyVO;
import org.a.dto.HS_RequestDTO;
import org.a.mapper.HS_CareMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Component
@Service
public class HS_CareServiceImpl implements HS_CareService {
	
	@Setter(onMethod_ = @Autowired )
	private HS_CareMapper mapper;
	
	
	@Override
	public void carereply(HS_PstReplyVO pvo) {
		log.info("ReplyInsert..." + pvo);
		
		mapper.inputReply(pvo);
	}
	
	@Override	
	public void careBooking(HS_BookingVO bvo) {
		log.info("ReplyInsert..." + bvo);
		
		mapper.inputBooking(bvo);
	}
	
	@Override
	public List<HS_PstReplyVO> getListWithPaging() {
		log.info("get List with Criteria..." );
		return mapper.getListWithPaging();
	}
	
	@Override
	public List<HS_RequestDTO> outputReply() {
		log.info("outputReply...");
		return mapper.outputReply();
	}
	
	@Override
	public HS_RequestDTO insertReply(int PST_REPLYNUM) {
		log.info("ReplyInfo.." + PST_REPLYNUM);
		return mapper.insertReply(PST_REPLYNUM);
	}
	
	@Override
	public HS_RequestDTO replyView(int PST_REPLYNUM) {
		log.info("ReplyInfo.." + PST_REPLYNUM);
		return mapper.replyView(PST_REPLYNUM);
	}
	
	@Override
	public int deleteReply(int PST_REPLYNUM) {
		log.info("ReplyInfo.." + PST_REPLYNUM);
		return mapper.deleteReply(PST_REPLYNUM);
	}
	
	@Override
	public int updateReply(HS_PstReplyVO pvo) {
		log.info("ReplyInfo.." + pvo);
		
		return mapper.updateReply(pvo);
	}
	
	@Override
	public HS_RequestDTO bkView(int bk_no) {
		return mapper.bkView(bk_no);
	}
	@Override
	public void insertPst(HS_PetsitterVO pvo) {
		log.info("insertPst..." + pvo);
		mapper.insertPst(pvo);
	}
	@Override
	public List<HS_PetsitterVO> outputPst() {
		log.info("outputPst...");
		return mapper.outputPst();
	}
	
	@Override
	public HS_PetsitterVO viewPst(int PST_NO) {
		log.info("viewPst.." + PST_NO);
		return mapper.viewPst(PST_NO);
	}
	
	@Override
	public boolean updatePst(HS_PetsitterVO pvo) {
		log.info("updatePst.." + pvo);
		return mapper.updatePst(pvo);
	}
}
