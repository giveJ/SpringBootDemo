package org.a.service;

import java.util.List;

import org.a.domain.HS_BookingVO;
import org.a.domain.HS_PetsitterVO;
import org.a.domain.HS_PstReplyVO;
import org.a.dto.HS_RequestDTO;


public interface HS_CareService {
	
	
	//이용 후기 등록
	public void carereply(HS_PstReplyVO pvo);
	
	// 돌봄서비스 접수 등록
	public void careBooking(HS_BookingVO bvo);
	
	// 이용 후기 페이징
	public List<HS_PstReplyVO> getListWithPaging();
	
	// 이용 후기 리스트 불러오기 
	public List<HS_RequestDTO> outputReply();
	
	// 후기 상세페이지 불러오기
	public HS_RequestDTO replyView(int PST_REPLYNUM);
	
	// 돌봄서비스 예약 정보 불러오기
	public HS_RequestDTO bkView(int bk_no);
	
	// 후기 등록시 이용정보 불러오기
	public HS_RequestDTO insertReply(int PST_REPLYNUM);
	
	// 후기 삭제
	public int updateReply(HS_PstReplyVO pvo);
	
	// 후기 수정
	public int deleteReply(int PST_REPLYNUM);
	
	// 펫시터 등록
	public void insertPst(HS_PetsitterVO pvo);

	// 펫시터 리스트 불러오기 
	public List<HS_PetsitterVO> outputPst();
	
	// 펫시터 상세 불러오기
	public HS_PetsitterVO viewPst(int PST_NO);
	
	// 후기 수정
	public boolean updatePst(HS_PetsitterVO pvo);
}
