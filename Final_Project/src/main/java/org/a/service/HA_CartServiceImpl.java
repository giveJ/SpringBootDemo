package org.a.service;

import java.util.List;

import org.a.domain.HA_CartVO;
import org.a.mapper.HA_CartMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class HA_CartServiceImpl implements HA_CartService {
	
	@Setter(onMethod_ = @Autowired)
	private HA_CartMapper mapper;
	
	// 1. 장바구니 추가
	@Override
	public void insert(HA_CartVO vo) {
		log.info("insert..." + vo);
		mapper.insert(vo);	//void이기 때문에 리턴 신경 안 써도 됨
	}
	
	// 2. 장바구니 목록
	@Override
	public List<HA_CartVO> listCart(String user_ID) {
		log.info("listCart..." + user_ID);
		return mapper.listCart(user_ID);
		//return SqlSession.listCart("cart.listCart", user_ID);
	}
	
	// 3. 장바구니 삭제
	@Override
	public void delete(int cart_id) {
		log.info("delete..." + cart_id);
		mapper.delete(cart_id);
	}
	
	// 4. 장바구니 수정(수량 덮어쓰기)
	// 장바구니 화면에서 상품수량을 변경할 때
	// 장바구니 상품수량 변경처리 메소드 호출
	@Override
	public void modifyCart(HA_CartVO vo) {
		log.info("modifyCart..." + vo);
		mapper.modifyCart(vo);
	}
	
	// 5. 장바구니 금액 합계
	@Override
	public int sumMoney(String user_ID) {
		log.info("sumMoney..." + user_ID);
		return mapper.sumMoney(user_ID);
	}
	
	// 6. 장바구니 상품 확인
	@Override
	public int countCart(int product_id, String user_ID) {
		log.info("countCart...product_id" + product_id);
		log.info("countCart...user_ID" + user_ID);
		return mapper.countCart(product_id, user_ID);
	}
	
	// 7. 장바구니 상품 수량 변경(수량 합산하기)
	// 상품목록 화면에서 동일한 상품을 장바구니에 담았을 때
	// 동일한 상품일 경우 상품수량을 합산하는 메소드 호출
	@Override
	public void updateCart(HA_CartVO vo) {
		log.info("updateCart" + vo);
		mapper.updateCart(vo);
	}
	

	
	
	
}
