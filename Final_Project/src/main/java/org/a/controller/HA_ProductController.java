package org.a.controller;

import org.a.service.HA_ProductService;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.a.domain.Criteria;
import org.a.domain.HA_ProductAttachVO;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/*")
@AllArgsConstructor  //의존성주입
public class HA_ProductController {
	   
	private HA_ProductService service;
	
	@GetMapping("/main")	//메인화면으로 이동
	public String main() {
	   return "main";
	} 
	
	// 1. 상품 목록 페이지
	@GetMapping("/list")	//상품목록 화면으로 이동(페이지 단순 이동)
	public String list(Model model, HttpSession session) {
		log.info("list...");
		session.setAttribute("user_ID", "asdf2");	//임시계정삽입
		model.addAttribute("list", service.getList());
		
	    return "/ha_product/productList";
	}
	
	/*
	@GetMapping("/listFeed")	//카테고리 사료로 이동
	public String listFeed() {
		return "/ha_product/productListFeed";
	}
	
	@GetMapping("/listSnack")	//카테고리 간식으로 이동
	public String listSnack() {
		return "/ha_product/productListSnack";
	}
	
	@GetMapping("/listEtc")		//카테고리 기타용품으로 이동
	public String listEtc() {
		return "/ha_product/productListEtc";
	}
	
	@GetMapping("/productD")	//상품 상세페이지로 이동
	public String productD() {
		return "/ha_product/productDesc";
	}
	*/
	/*
	// 2. 상품 상세보기
	@RequestMapping("/detail/{product_id}")
	public ModelAndView detail(@PathVariable("product_id") int product_id, ModelAndView mav) {
		mav.setViewName("/productDetail");
		mav.addObject("vo", productService.detailProduct(product_id));
		return mav;
	}
	*/
	
	// 2. 상품 상세 페이지
	@GetMapping("/productD")
	public String get(@RequestParam("product_id") int product_id, Model model, Criteria cri) {
		//상세페이지로 갈 때 그냥 가는게 아닌 데이터를 갖고 가야 함
		//상품번호를 갖고 디비에서 하나의 데이터를 갖고 오고 그걸 저장해서 뿌리기
		log.info("/productD");
		model.addAttribute("vo", service.get(product_id));	//product_id 값을 model에 담아 던짐
		//model.addAttribute("ivo", service.getAttachList(product_id));
		model.addAttribute("cri", cri);	//cri 값을 model에 담아 던짐, 그럼 get에서도 cri사용가능
		return "/ha_product/productDesc";
	}
	
	// 2-1. 상품문의(문의사항) 페이지
	@GetMapping("/qna")	
	public String qna() {
	   return "";
	}
	
	
	/*
	// 3. 장바구니 페이지
	@GetMapping("/cart")		//장바구니로 이동
	public String cart() {
		return "/ha_product/cartList";
	}
	*/
	
	// 첨부파일 
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<HA_ProductAttachVO>> getAttachList(int product_id) {
		log.info("getAttachList.." + product_id);
		return new  ResponseEntity<List<HA_ProductAttachVO>>(service.getAttachList(product_id), HttpStatus.OK);
	   }	
	
	
}
