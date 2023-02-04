package org.a.controller;

import java.net.http.HttpRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.a.domain.Ek_ClassDateVO;
import org.a.service.Ek_ClassDateService;
import org.a.service.Ek_ClassImageService;
import org.a.service.Ek_ClassLectureService;
import org.apache.ibatis.session.SqlSession;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/date/*")
@AllArgsConstructor
public class Ek_ClassDateController {
	private Ek_ClassDateService dservice;
	private Ek_ClassLectureService service;
	private Ek_ClassImageService iservice;
	
	
	@GetMapping("/insert_date")
	public String insertDate(long cno) {
		return "/ek_class/modify_detail";
	}
	
	@PostMapping("/insert_date")
	public String insertDate(Ek_ClassDateVO dvo) {
		log.info( "나아아알짜 입력 시작!! : " + dvo);
		
		dvo.setCno(40);
		dservice.insertDate(dvo);
		
		return "redirect:/main/main";
	}
	
	
	
	
	
	@GetMapping("/insertD")
	public String insertD() {
		return "/ek_class/modify_detail";
	}
	
	
	@PostMapping("/selectDate")
	public String insertDate(@RequestParam("s_date") String s_date, Model model){
		model.addAttribute("date",dservice.selectDate(s_date));
		return "redirect:/date/insert_date";
	}
	
	
	@GetMapping(value = "/{s_date}" , produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<Ek_ClassDateVO>> get(@PathVariable("s_date") String s_date){
		log.info("날짜 정보 가져와아아아아!!!!!!!!!!......." + s_date);
		return new ResponseEntity<List<Ek_ClassDateVO>>(dservice.selectDate(s_date),HttpStatus.OK);
	}
	
	}
	
