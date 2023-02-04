package org.a.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HA_OrderItemInsertVO {
	//주문아이템VO(주문 상품이 들어갈 VO)
	
	private int[] Inorderitem_no; //주문아이템 pr
	private String[] Inorderitem_img; //
	private String[] Inorderitem_name;
	private String[] Inorderitem_option;
	private String[] Inorderitem_price;

	private int[] Inorderitem_item_no;
	private int[] Inorderitem_select_vol;
	
	
	
	
	private int orderitem_no; //주문아이템 pr
	private int orderitem_order_no; // 주문번호
	private int orderitem_mem_no;
	private String orderitem_img; //
	private String orderitem_name;
	private String orderitem_option;
	private String orderitem_price;
	
    private int orderitem_item_no;
	private int orderitem_select_vol;
    
    //getter&setter
	
	
	
	
	
	
}
