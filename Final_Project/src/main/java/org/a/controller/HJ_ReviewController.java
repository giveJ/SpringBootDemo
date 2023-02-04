package org.a.controller;

import java.io.File;

import javax.annotation.Resource;

import org.a.domain.Criteria;
import org.a.domain.HJ_ReviewVO;
import org.a.domain.PageDTO;
import org.a.service.HJ_ReviewService;
import org.a.utils.HJ_UploadFileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/HJ_review/*")
@AllArgsConstructor	
public class HJ_ReviewController {
	
	private HJ_ReviewService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@GetMapping("/HJ_review_list")
	public String list(Model model, Criteria cri) {
		
		log.info("review list..." + cri);
		
		int total = service.getTotal(cri);
		log.info(total);
		
		model.addAttribute("list", service.getListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "HJ_review/HJ_review_list";
	}
	
	@PostMapping("/HJ_review_register")
	public String register(@ModelAttribute HJ_ReviewVO vo,RedirectAttributes rttr,MultipartFile file,Criteria cri) throws Exception{
		
		log.info("HJ_review_register..." + vo);
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = HJ_UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		
			if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			 fileName =  HJ_UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
			 // 원본 파일 경로 + 파일 저장
			 vo.setR_Img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			 // 썸네일 파일 경로 + 썸네일 파일 저장
			 vo.setReviewImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
			
			} else {// 첨부된 파일이 없으면
			 fileName = File.separator + "images" + File.separator + "no.png";
			  // no.png파일을 대신 출력함
			 
			 vo.setR_Img(fileName);
			 vo.setReviewImg(fileName);
			}
		
		service.register(vo);
		
		rttr.addFlashAttribute("result", "ok");
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/HJ_review/HJ_review_list";
	}
	
	@GetMapping("/HJ_review_register")
	public String register(Model model, HJ_ReviewVO vo,Criteria cri) {
		
		model.addAttribute("cri", cri);
		
		return "HJ_review/HJ_review_register";
	}
	
	@GetMapping("/HJ_review_get")
	
	public String get(@RequestParam("rno") long rno, Model model, Criteria cri) {
		
		log.info("/HJ_review_get");
		
		model.addAttribute("vo", service.get(rno));
		model.addAttribute("cri", cri);
		
		return "/HJ_review/HJ_review_get";
	}
	
	@GetMapping("/HJ_review_modify")
	
	public String modify(@RequestParam("rno") long rno, Model model,Criteria cri) {
		
		log.info("modify>>>"+rno);
		
		model.addAttribute("vo", service.get(rno));
		model.addAttribute("cri",cri);
		
		return "HJ_review/HJ_review_modify";
	}
	
	@PostMapping("/HJ_review_modify")
	public String modify(HJ_ReviewVO vo, RedirectAttributes rttr, MultipartFile file, Criteria cri) throws Exception {
		
		log.info(vo);
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = HJ_UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;  // 기본 경로와 별개로 작성되는 경로 + 파일이름

		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		 fileName =  HJ_UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		 // 원본 파일 경로 + 파일 저장
		 vo.setR_Img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		 // 썸네일 파일 경로 + 썸네일 파일 저장
		 vo.setReviewImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		} else {// 첨부된 파일이 없으면
		 fileName = File.separator + "images" + File.separator + "no.png";
		  // no.png파일을 대신 출력함
		 
		 vo.setR_Img(fileName);
		 vo.setReviewImg(fileName);
		}
		
		
		service.modify(vo);
		
		rttr.addFlashAttribute("result", "success");
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/HJ_review/HJ_review_list";
		
	}
	
	@PostMapping("/HJ_review_remove")
	public String remove(@RequestParam("rno") long rno, RedirectAttributes rttr, Criteria cri) {
		
		log.info(rno);
		
		service.remove(rno);
		rttr.addFlashAttribute("result", "success");
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/HJ_review/HJ_review_list";
		
	}
	
	
	
	
}
