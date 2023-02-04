package org.a.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.a.domain.Ek_ClassDateVO;
import org.a.domain.Ek_ClassImageVO;
import org.a.domain.Ek_ClassLectureVO;
import org.a.service.Ek_ClassImageService;
import org.a.service.Ek_ClassLectureService;
import org.apache.ibatis.annotations.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@Log4j
@RequestMapping("/main/*")
@AllArgsConstructor  //의존성주입
public class Ek_ClassLectureController {
	private Ek_ClassLectureService service;
	private Ek_ClassImageService iservice;
	
	//메인 화면
	@GetMapping("/main")
	public String main() {
		return "/ek_class/main";
	}
	
	//클래스 등록 페이지로 이동
	@GetMapping("/insert_class")
	public String insert_class() {
		log.info("INSERT _ CLASS........+" );
		
		return "/ek_class/insert_class";
	}
	
	
	
	
	//실제 클래스 등록
	@PostMapping("/insert_class")
	public String insert_class(Ek_ClassLectureVO lvo , RedirectAttributes rttr) {
		log.info("INSERT _ CLASS........+" + lvo);
		service.insert_class(lvo); 
		log.info("CLASSLECTURE_CLASSiMAGElIST........+++ : "+lvo.getClassImageList().size());
		List<Ek_ClassImageVO> list = lvo.getClassImageList();
		
		log.info("classImageList++++++++:  "+list);
		
		if(list.size() > 0) {
			for(Ek_ClassImageVO vo : list) {
				log.info("----FILENAME..........: " + vo.getFileName());
				log.info("----FILEpath..........: " + vo.getUploadPath());
				log.info("----FILEuuid..........: " + vo.getUuid());
				log.info("----FILEtype..........: " + vo.getFileType());
			}
		}
		
		return "redirect:/main/class_list?fileType=1";
	}
	
	//등록된 클래스 불러오기
	@GetMapping("/class_list")
	public String classList(Model model, Ek_ClassImageVO ivo) {
		log.info("list.......");

		List<Ek_ClassLectureVO> list = service.getList();
		
		List<Ek_ClassImageVO> iList = new ArrayList<Ek_ClassImageVO>();
		
		for(Ek_ClassLectureVO lvo : list) {
			long cno = lvo.getCno();
			// cno를 통해서 image 테이블에 있는 fileType= 1에 해당하는 데이터 1개 가져와서 리스트에 담아 주기
			List<Ek_ClassImageVO> tmpVO = iservice.fileType(ivo);  
			iList.addAll(tmpVO);
		}
		
		
		
		
		model.addAttribute("vo", list);
		model.addAttribute("ivo", iList);
		
		
		return"/ek_class/class_list";
	}
	
	//클래스 상세 페이지
	@GetMapping("/class_get")
	public String class_get(Model model, long cno) {
		log.info("CLASS_GET........... + ");
		model.addAttribute("lvo", service.classGet(cno));
		model.addAttribute("ivo", iservice.getAttachList(cno));
		return "/ek_class/class_get";
	}
	
	
	
	 @GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<Ek_ClassImageVO>> getAttachList(long cno) {
		log.info("getAttachList....... : " + cno);
		return new ResponseEntity<List<Ek_ClassImageVO>>(iservice.getAttachList(cno), HttpStatus.OK);
	}
	

	
	
	@GetMapping("/my_page")
	public String my_page() {
		return "/ek_class/myPage";
	}
	
	// ↓
	
	@GetMapping("/modify_page")
	public String modify_class() {
		return "/ek_class/modify_class";
	}
	
	/*
	 * @PostMapping("/modify_page") public String modify_class(String user_ID) {
	 * 
	 * log.info("Its Controller for mList"+user_ID); service.MList(); return
	 * "/ek_class/modify_class"; }
	 */
	// ↓
	
	@GetMapping("/modify_detail")
	public String modify_detail() {
		return "/ek_class/modify_detail";
	}
	
	
	
	
	
}
