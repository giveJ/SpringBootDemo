package org.a.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.a.domain.Criteria;
import org.a.domain.HJ_FamilyVO;
import org.a.domain.PageDTO;
import org.a.service.HJ_FamilyService;
import org.a.utils.HJ_UploadFileUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/HJ_family/*")
@AllArgsConstructor		
public class HJ_FamilyController {
	
	
	private HJ_FamilyService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	/*
	@GetMapping("/HJ_list")
	public String list(HJ_FamilyVO vo,Model model, Criteria cri) {
		log.info("list..........");
		
		model.addAttribute("list", service.getList());
		
		return "HJ_family/HJ_list";
	}
	*/
	@GetMapping("/HJ_list")
	public String list(Model model, Criteria cri) {
		
		List list = service.getListWithPaging(cri);
		
		log.info("list.........."+cri);
		
		int total = service.getTotal(cri);
		log.info(total);	
		if(!list.isEmpty()) {
			model.addAttribute("list", service.getListWithPaging(cri));
		}else {
			model.addAttribute("listCheck","empty");
		}
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "HJ_family/HJ_list";
	
	}
	@PostMapping("/HJ_register")
	public String register(@ModelAttribute HJ_FamilyVO vo,RedirectAttributes rttr, MultipartFile file,Criteria cri) throws Exception {
		
		log.info("HJ_register..." + vo);
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = HJ_UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

			if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			 fileName =  HJ_UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
			 // 원본 파일 경로 + 파일 저장
			 vo.setF_Img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			 // 썸네일 파일 경로 + 썸네일 파일 저장
			 vo.setFamilyImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
			
			} else {// 첨부된 파일이 없으면
			 fileName = File.separator + "images" + File.separator + "no.png";
			  // no.png파일을 대신 출력함
			 
			 vo.setF_Img(fileName);
			 vo.setFamilyImg(fileName);
			}
		
		
		service.register(vo);

		rttr.addFlashAttribute("result", "ok");
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/HJ_family/HJ_list";
		
	}
	
	@GetMapping("/HJ_register")
	public String register(Model model,HJ_FamilyVO vo, Criteria cri){
		
		model.addAttribute("cri", cri);
		
		
		return "HJ_family/HJ_register";
	}
	
	@GetMapping("/HJ_get")
	public String get(@RequestParam("fno") long fno, Model model, Criteria cri) {
		
		log.info("/HJ_get");
		
		model.addAttribute("vo", service.get(fno));
		model.addAttribute("cri", cri);
		
		return "/HJ_family/HJ_get";
		
	}
	
	@GetMapping("/HJ_modify")
	public String modify(@RequestParam("fno") long fno, Model model, Criteria cri) {
		
		log.info("/modify....."+fno);
		
		model.addAttribute("vo", service.get(fno));
		model.addAttribute("cri", cri);
		
		return "HJ_family/HJ_modify";
	}
	
	@PostMapping("/HJ_modify")
	public String modify(HJ_FamilyVO vo, RedirectAttributes rttr, Criteria cri, MultipartFile file) throws Exception {
		
		  log.info(vo);
		  
		  	String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = HJ_UploadFileUtils.calcPath(imgUploadPath);
			String fileName = null;

			if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			fileName =  HJ_UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
			// 원본 파일 경로 + 파일 저장
			vo.setF_Img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			// 썸네일 파일 경로 + 썸네일 파일 저장
			vo.setFamilyImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
				
			} else {// 첨부된 파일이 없으면
			fileName = File.separator + "images" + File.separator + "no.png";
			// no.png파일을 대신 출력함
				 
			vo.setF_Img(fileName);
			vo.setFamilyImg(fileName);
			}
		  
		  
		  service.modify(vo);
		  
		  rttr.addFlashAttribute("result", "success");
		  rttr.addAttribute("pageNum", cri.getPageNum());
		  rttr.addAttribute("amount", cri.getAmount());
		  rttr.addAttribute("type", cri.getType());		
		  rttr.addAttribute("keyword", cri.getKeyword());
		 
		  System.out.println(service.modify(vo));
		
		return "redirect:/HJ_family/HJ_list";
	}
	
	@PostMapping("/HJ_remove")
	public String remove(@RequestParam("fno") long fno, RedirectAttributes rttr, Criteria cri) {
		
		log.info(fno);
		
		service.remove(fno);
		rttr.addFlashAttribute("result", "success");
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());		
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/HJ_family/HJ_list";
		
	}
	
	
	
	
	
}
