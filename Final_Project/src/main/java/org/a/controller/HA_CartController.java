package org.a.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.a.domain.HA_CartVO;
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
@RequestMapping("/cart/*")
@AllArgsConstructor
public class HA_CartController {

	//@Inject
	@Setter(onMethod_ = @Autowired)
	private HA_CartService cartService;
	
	// 1. 장바구니 추가
	//@GetMapping과 같음
	@RequestMapping("insert.do")	
	public String insert(@ModelAttribute HA_CartVO vo, HttpSession session) {
		log.info("----------------------------------");
		// 로그인 여부를 체크하기 위해 세션에 저장된 아이디 확인
		String user_ID = (String) session.getAttribute("user_ID");
		vo.setUser_ID(user_ID);
		// 장바구니에 기존 상품이 있는지 검사
		
		log.info("----------------------------------"+vo.getProduct_id());
		int count = cartService.countCart(vo.getProduct_id(), user_ID);
		//count == 0 ? cartService.updateCart(vo) : cartService.insert(vo);
		if(count == 0) {
			// 없으면 insert
			cartService.insert(vo);	// 장바구니 테이블에 저장됨
		} else {
			// 있으면 update
			cartService.updateCart(vo);
		}
		return "redirect:/cart/list.do";	// 장바구니 목록으로 이동
	}
	
	// 2. 장바구니 목록
	// 장바구니 상품 목록처리 매핑
	// 변수 list에 장바구니 리스트 객체를 저장
	// 변수 sumMoney에 장바구니에 담긴 전체 상품의 금액을 저장
	@RequestMapping("list.do")
	public String list(HttpSession session, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();

		//session에 저장된 userid를 getAttribute()메소드를 사용해서 얻어오고 오브젝트 타입이기 때문에
		//String 타입으로 타입변환한다. 
		String user_ID = (String) session.getAttribute("user_ID");	// session에 저장된 user_ID
		
		user_ID = "asdf2";
		
		List<HA_CartVO> list = cartService.listCart(user_ID);	// 장바구니 정보
		
		int sumMoney = cartService.sumMoney(user_ID);	// 장바구니 전체 금액 호출
		
		// 장바구니 전체 금액에 따라 배송비 지불 여부를 구분
		// 배송료(5만원 이상 => 무료, 미만 => 2500원)
		int fee = sumMoney >= 50000 ? 0 : 2500;
		
		//map의 put 메소드를 사용하여 (key:value) 형식으로 데이터를 저장함
		map.put("list", list);			// 목록, 장바구니 정보를 map에 저장
		log.info(list + "-list 부분입니다~");
		
		if(list.size() > 0) {
			log.info(list.get(0).getCart_id() + "-------------찾아라~");
			map.put("count", list.size());	// 장바구니 상품의 유무
			map.put("sumMoney", sumMoney);	// 장바구니 전체 금액
			map.put("fee", fee);			// 배송금액
			map.put("allSum", sumMoney+fee);// 주문 상품 전체 금액
		}
		
		model.addAttribute("map", map);		// map 변수 저장
		
		return "ha_product/cartList";
		
	}
	
	// 3. 장바구니 삭제
	// 장바구니 상품 레코드 삭제처리 매핑
	// 레코드 삭제처리 후 장바구니 목록으로 리다이렉트 
	@RequestMapping("delete.do")
	public String delete(@RequestParam int cart_id) {
		log.info(cart_id+"~~~~~~~삭제해요");
		cartService.delete(cart_id);
		log.info("-------------삭제한다~");
		return "redirect:/cart/list.do";
	}
	
	// 4. 장바구니 수정
	// 장바구니 수량 변경처리 매핑
	// 장바구니 수정 처리작업을 장바구니 목록의 레코드의 길이만큼 반복문을 수행
	//여기선 @RequestParam int amount할 필요가 없음..
	@RequestMapping(value = "/update.do", method = RequestMethod.GET)
	public String update(int amount, 
						int product_id, 
						HttpSession session) {
		
		String user_ID = (String) session.getAttribute("user_ID");
		user_ID = "asdf2";
		
		HA_CartVO vo = new HA_CartVO();
		vo.setAmount(amount);
		vo.setProduct_id(product_id);
		vo.setUser_ID(user_ID);
		cartService.modifyCart(vo);
			
		return "redirect:/cart/list.do";
	}
	

	
	// 5. 주문페이지
	/*@RequestMapping("orderView")	//상품목록 화면으로 이동(페이지 단순 이동)
	public String orderlist(Model model, HttpSession session) {
		//log.info("list...");
		//session.setAttribute("user_ID", "asdf2");	//임시계정삽입
		//model.addAttribute("list", cartService.());
		
	    return "/ha_product/orderList";
	}
	*/
	
	// 6. 주문페이지 목록
	@RequestMapping("orderView")
	public String orderlist(HttpSession session, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();

		String user_ID = (String) session.getAttribute("user_ID");	// session에 저장된 user_ID
		
		user_ID = "asdf2";
		
		List<HA_CartVO> list = cartService.listCart(user_ID);	// 장바구니 정보
		
		int sumMoney = cartService.sumMoney(user_ID);	// 장바구니 전체 금액 호출
		
		// 장바구니 전체 금액에 따라 배송비 지불 여부를 구분
		// 배송료(5만원 이상 => 무료, 미만 => 2500원)
		int fee = sumMoney >= 50000 ? 0 : 2500;
		
		//map의 put 메소드를 사용하여 (key:value) 형식으로 데이터를 저장함
		map.put("list", list);			// 목록, 장바구니 정보를 map에 저장
		log.info(list + "-list 부분입니다~");
		
		if(list.size() > 0) {
			log.info(list.get(0).getCart_id() + "-------------찾아라~");
			map.put("count", list.size());	// 장바구니 상품의 유무
			map.put("sumMoney", sumMoney);	// 장바구니 전체 금액
			map.put("fee", fee);			// 배송금액
			map.put("allSum", sumMoney+fee);// 주문 상품 전체 금액
		}
		
		model.addAttribute("map", map);		// map 변수 저장
		
		return "ha_product/orderList";
		
	}
	
	
	
	
	
	
	
	
	
}
