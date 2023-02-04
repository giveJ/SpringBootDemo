package org.a.controller;

import java.io.File;

import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.a.domain.HA_ProductAttachVO;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HA_UploadController {

	@GetMapping("/uploadForm")
	public String uploadForm() {
		log.info("upload form");
		return "/uploadForm";	//메소드의 리턴은 jsp, uploadForm의 jsp로 가라는 말
	}
	
	
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		/*
		 * MultipartFile의 메소드
		 * String getName()				- 파라미터의 이름 <input> 태그의 이름
		 * String getOriginalFileName() - 업로드 파일의 이름
		 * boolean isEmpty()			- 파일이 존재하지 않는 경우 true
		 * long getSize()				- 업로드 파일의 크기
		 * byte[] getSize()				- byte[]로 파일 데이터 변환
		 * InputStream getInputStream()	- 파일 데이터와 연결된 InputStream 반환
		 * transforTo(File file)		- 파일 저장
		 */
		/* 변수가 어디에 적용되고 어떤 함수가 사용됐는지 파악해보자 */
		String uploadFolder = "C:\\upload";
		
		for(MultipartFile multipartFile : uploadFile) {
			log.info("-----------------------");
			log.info("upload File Name : " + multipartFile.getOriginalFilename());
			log.info("upload File Size : " + multipartFile.getSize());
			
			//파일 객체 saveFile 생성
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());

			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
			
			
			
			
			
		}
	}
	
	
	@GetMapping("/uploadAjax")
	public String uploadAjax() {
		log.info("uploadAjax...");
		return "/uploadAjax";
	}
	
	
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)	//던져줄 데이터가 DTO
	@ResponseBody
	//void여서 return이 안 됐었음 *서블릿 특성상 urlMapping이랑 똑같은 곳으로 가려고 함
	//void에서 ResponseEntity<List<AttachFileDTO>>으로 수정함
	public ResponseEntity<List<HA_ProductAttachVO>> uploadAjaxPost(MultipartFile[] uploadFile) {	
		log.info("updata ajax post.........");
		//log.info(uploadFile.length);
		//list로 리턴해줘야 하기 때문에 list 객체 생성
		List<HA_ProductAttachVO> list = new ArrayList<HA_ProductAttachVO>();
		
		String uploadFolder = "C:\\upload";
		
		// make folder(폴더 만들어주기)
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		log.info("upload path : " + uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		
		for(MultipartFile multipartFile : uploadFile) {	//파일의 개수만큼 타도록 하는 for문
			log.info("-----------------------");
			log.info("upload File Name : " + multipartFile.getOriginalFilename());
			log.info("upload File Size : " + multipartFile.getSize());
			
			//DTO 하나 생성
			HA_ProductAttachVO attachDto = new HA_ProductAttachVO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			//uploadFileName : 실제 업로드할 파일명, 원본 파일명
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name : " + uploadFileName);
			
			//원본파일명 DTO에 넣어주기
			attachDto.setFileName(uploadFileName);	// dto에 파일명(원본) 저장
			
			//uuid -> 랜덤값
			UUID uuid = UUID.randomUUID();
			
			//uploadFileName -> uuid까지 붙은 파일명, 최종 파일명
			uploadFileName = uuid.toString() + "_" + uploadFileName;	

			try {
				//파일 객체 saveFile 생성
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				//이전처럼 파일 업로드 시키기
				//DTO에 또 하나 저장
				attachDto.setUuid(uuid.toString());
				attachDto.setUploadPath(uploadFolderPath);
				
				list.add(attachDto);
				
				
			} catch (Exception e) {
				log.error(e.getMessage());
			}
			//ajax는 요청하면 성공했을 때 콜백으로 success 함수를 탐. 결과값이 스트립트로 다시 넘어가야 함
		}// end for문
		
		return new ResponseEntity<List<HA_ProductAttachVO>>(list, HttpStatus.OK);
		
	}
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);	//separator는 split이랑 다른 개념
	}
	
	
	//?로 매개변수 던져서 @GetMapping으로 처리
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(String fileName){
		log.info("download file : " + fileName);
		Resource resource = new FileSystemResource("C:\\upload\\" + fileName);
		log.info("resource : " + resource);
		
		String resourceName = resource.getFilename();

		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			headers.add("Content-Disposition", "attachment; filename=" + 
						new String(resourceOriginalName.getBytes("utf-8"), "ISO-8859-1"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	
	@PostMapping("deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName){
		log.info("deleteFile : " + fileName);
		
		File file = null;
		
		try {
			file = new File("C:\\upload\\" + URLDecoder.decode(fileName, "utf-8"));	//URLDecoder 디코더 나온 이유? 인코딩했기 때문에 받는 쪽에서 디코딩하기 위해, 정보 숨기고자
			file.delete();
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	//<구조>
	//버튼을 누르면 서버에서 우선 파일을 올림
	
	
	
}
