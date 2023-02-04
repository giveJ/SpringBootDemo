package org.a.controller;


import java.lang.System.Logger;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;


import javax.inject.Inject;

import org.a.domain.Criteria;
import org.a.domain.JJ_comAttachVO;
import org.a.domain.JJ_comBoardVO;
import org.a.domain.JJ_comReplyVO;
import org.a.domain.JJ_qnaBoardVO;
import org.a.domain.JJ_qnaReplyVO;
import org.a.domain.PageDTO;
import org.a.service.JJ_comBoardService;
import org.a.service.JJ_comReplyService;
import org.a.service.JJ_qnaBoardService;
import org.a.service.JJ_qnaReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor


public class JJ_comBoardController {
	@Setter(onMethod_ = @Autowired)
	private JJ_comBoardService service;
	private JJ_comReplyService replyService;
	
	
	// 전체목록 가져오기 (페이징 처리 전)
//	@GetMapping("/JJ_comBoard/list")
//	public String list(Model model) {
//		log.info("list");                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
//		model.addAttribute("list",service.getList());
//		
//		return "JJ_comBoard/list";
//	}
//	
	

	// 조회 
	@GetMapping("/JJ_comBoard/get")
	public String get(@RequestParam("bno") int bno, Model model, Criteria cri) {
		log.info("get*****"+ bno);
		
		model.addAttribute("comBoard",service.read(bno));
		model.addAttribute("cri", cri);
		
		// 댓글 조회
		List<JJ_comReplyVO> reply = replyService.getList(bno);
		model.addAttribute("reply", reply);
		
		return "/JJ_comBoard/get";
	}
	
	
	// 등록하는 페이지로 넘어가는 곳
	@GetMapping("/JJ_comBoard/insert")
	public String register(Model model, Criteria cri) {
		log.info("insert page");        
		model.addAttribute("cri",cri);
		return "JJ_comBoard/insert";
	}

	
	// 등록
	@PostMapping("/JJ_comBoard/insert")	//get 방식은 정보노출으로 불가
	public String register(JJ_comBoardVO vo, RedirectAttributes rttr, Criteria cri) {
		
		log.info("register!!! ...." + vo);
		service.insert(vo);
		
		List<JJ_comAttachVO> list = vo.getAttachList();
		
		if(list!= null && list.size() >0) {
			for(JJ_comAttachVO vo2 : list) {
				log.info("----FileName : " + vo2.getFileName());
				log.info("--------path :" + vo2.getUploadPath());
				log.info("-----uuid :" + vo2.getUuid());
			}
		}
		
		rttr.addFlashAttribute("result","ok");
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/JJ_comBoard/list";
	}
		
	

	// 수정 페이지로 이동
	@GetMapping("/JJ_comBoard/modify")
	public String modify(@RequestParam("bno")int bno, Model model, Criteria cri) {
		log.info("modify display****");          
		model.addAttribute("comBoard",service.read(bno));
		model.addAttribute("cri",cri);
		
		return "/JJ_comBoard/modify";
	}
	
	
	// 수정
	@PostMapping("/JJ_comBoard/modify")
	public String modify(JJ_comBoardVO vo, RedirectAttributes rttr, Criteria cri) {
		
		log.info("modify!!!!!!!!!!" + vo);
		
		if(service.update(vo)) {
			rttr.addFlashAttribute("result","success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/JJ_comBoard/list";
		
	}
	
	
	// 삭제
	@PostMapping("/JJ_comBoard/remove")
	public String remove(@RequestParam("bno") int bno , RedirectAttributes rttr, Criteria cri) {
		log.info("remove***" + bno);
		
		List<JJ_comAttachVO> attachList = service.getAttachList(bno);
		
		if(service.delete(bno)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result","success");
		}
		
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/JJ_comBoard/list";
	}
		
	
	// 페이징
	@GetMapping("/JJ_comBoard/list")
	public String list(Criteria cri, Model model, String postType, String animalType) {
		cri.setAmount(30);
		cri.setPageNum(1);

		log.info("list******" + cri);
		
		log.warn("----------------------------" + postType);
		log.warn("----------------------------" + animalType);
		
		// 카테고리 구분 (postType)
		if(postType == null) {
			postType="qna";
		}
		
		// 카테고리 구분 (animalType)
		// animalType 선택 O----------------------------
		if(animalType != null) {
		
			// 전체 데이터 개수 가져오기
			int total = service.getTotalCount();
			log.info("total****" + total);
			
			model.addAttribute("list", service.getListWithPaging2(cri,postType,animalType));
			model.addAttribute("pageMaker", new PageDTO(cri, total));
			
		}else {
			// animalType 선택 X--------------------------------
			int total = service.getTotalCount();
			log.info("total****" + total);
			
			model.addAttribute("list", service.getListWithPaging(cri,postType));
			model.addAttribute("pageMaker", new PageDTO(cri, total));
		}
		model.addAttribute("pt", postType);
		
		return "JJ_comBoard/list";
	}
	

	
	// 6) 첨부파일 리스트 가져오기
		@GetMapping(value="/JJ_getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<List<JJ_comAttachVO>> getAttachList(int bno) {
			log.info("getAttachList...." + bno);
			
			return new ResponseEntity<List<JJ_comAttachVO>>(service.getAttachList(bno), HttpStatus.OK);
		}
		
		
	// 파일 삭제
		private void deleteFiles(List<JJ_comAttachVO> attachList) {
			if(attachList == null || attachList.size() ==0) return;
			log.info(attachList);
			
			attachList.forEach(attach ->{
				try {
		            Path file = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());
		            Files.deleteIfExists(file);
		            if (Files.probeContentType(file).startsWith("image")) {
		               Path thumbNail = Paths.get("C\\projectUpload\\" + attach.getUploadPath() + "\\s_" + attach.getUuid() + "_" + attach.getFileName());
		               Files.delete(thumbNail);
		            }
		         } catch (Exception e) {
		            log.error("delete file error : " + e.getMessage());
		         }
			});
		}
		
		
		
		
		
		

}
