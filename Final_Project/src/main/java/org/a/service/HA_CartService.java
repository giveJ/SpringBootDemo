package org.a.service;

import java.util.List;

import org.a.domain.HA_CartVO;

public interface HA_CartService {

	// 1. 장바구니 추가	
	public void insert(HA_CartVO vo);
	
	// 2. 장바구니 목록
	public List<HA_CartVO> listCart(String user_ID);
	
	// 3. 장바구니 삭제
	public void delete(int cart_id);
	
	// 4. 장바구니 수량 수정
	public void modifyCart(HA_CartVO vo);
	//public int modifyCart(HA_CartVO vo);
	
	// 5. 장바구니 금액 합계
	public int sumMoney(String user_ID);
	
	// 6. 장바구니 상품 확인
	public int countCart(int product_id, String user_ID);
	
	// 7. 장바구니 상품 수량 변경(장바구니에 동일한 상품이 존재하면 수정)
	public void updateCart(HA_CartVO vo);
	
	
	
}
