package org.a.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HA_CartVO {
	private int cart_id;			// 장바구니 번호
	private int product_id;			// 상품 번호
	private String user_ID;			// 사용자 아이디
	private int amount;				// 구매 수량
    private String user_NAME;		// 사용자 이름
    private String product_name;	// 상품 이름
    private int product_price;		// 상품 단가
    private int money;				// 상품 가격
    private String product_url;
}
