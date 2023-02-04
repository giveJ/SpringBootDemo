package org.a.controller;

import java.util.ArrayList;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.a.domain.HA_CartVO;
import org.a.domain.HA_OrderItemVO;
import org.a.service.HA_CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/order/*")
@AllArgsConstructor	//생성자 주입 : 인스턴스 변수로 선언된 모든 것을 파라미터로 받는 생성자를 작성하게 됨.
public class HA_OrderController {

	@Setter(onMethod_ = @Autowired)	//Setter 주입
	private HA_CartService cartService;
	
	@RequestMapping(value = "/orderView",method=RequestMethod.POST)
	  /*public String orderView(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			  HA_OrderItemVO orderItemVO, Model model,int totalPrice,int totalVol) throws Exception{
		  List<HA_OrderItemVO> orderList = new ArrayList<>(); 
		  for(int i=0; i < (orderItemVO.getProduct_id()).length; i++) {
			
			  HA_OrderItemVO VO = new HA_OrderItemVO();
			  VO.setOrder_item_img(orderItemVO.getProduct_url()[i]);
			  VO.setOrder_item_name(orderItemVO.getProduct_name()[i]);
			  VO.setOrder_item_price(orderItemVO.getProduct_price()[i]);
			  VO.setOrder_item_no(orderItemVO.getProduct_id()[i]);
			  VO.setOrder_select_vol(orderItemVO.getMoney()[i]);
			  orderList.add(VO);

		  }*/
		public String orderView(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			  HA_OrderItemVO orderItemVO, Model model,int totalPrice,int totalVol) throws Exception{
		/*  List<HA_OrderItemVO> orderList = new ArrayList<>(); 
		  for(int i=0; i < (orderItemVO.getItem_no()).length; i++) {
			
			  HA_OrderItemVO VO = new HA_OrderItemVO();
			  VO.setOrder_item_img(orderItemVO.get()[i]);
			  VO.setOrder_item_name(orderItemVO.getItem_name()[i]);
			 // VO.setOrder_item_option(orderItemVO.getItem_option()[i]);
			  VO.setOrder_item_price(orderItemVO.getItem_price()[i]);
			 // VO.setOrder_option_no(orderItemVO.getOption_no()[i]);
			  VO.setOrder_item_no(orderItemVO.getItem_no()[i]);
			  VO.setOrder_select_vol(orderItemVO.getSelect_vol()[i]);
			  orderList.add(VO);

		  }
		  
		  model.addAttribute("order", orderList);
		  model.addAttribute("totalPrice", totalPrice);
		  model.addAttribute("totalVol", totalVol);
		  */
		  /*if(session.getAttribute("member") != null) {
		  	MemberVO memberVO = (MemberVO) session.getAttribute("member");
		  model.addAttribute("coupon", mainService.orderCoupon(memberVO.getMEM_NO()));
		  }*/
		  return "/ha_product/orderList";
	  }
	
}
