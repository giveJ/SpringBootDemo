package org.a.controller;
import java.io.File;

import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.a.domain.JJ_comAttachVO;
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
public class JJ_comUploadController {
	
	
//	@GetMapping("/JJ_uploadForm")
//	public String uploadForm() {
//		
//		log.info("upload form");
//		
//		return "/JJ_uploadForm";
//	}
	
	@PostMapping("/JJ_uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		
		/*
		 * MultipartFile 의 메소드
		 * String getName()						- 파라미터의 이름 <input> 태그의 이름
		 * String getOriginalFileName()			- 업로드 파일의 이름
		 * boolean isEmpty()					- 파일이 존재하지 않는 경우 true
		 * long getSize()						- 업로드 파일의 크기
		 * byte[] getBytes()					- byte[]로 파일 데이터 변환
		 * InputStream getInputStream()			- 파일 데이터와 연결된 InputStream 반환
		 * transforTo(File file)				- 파일 저장
		 */
		
		String uploadFolder = "C:\\upload";
		
		for(MultipartFile multipartFile : uploadFile) {
			
			log.info("----------------------");
			log.info("upload File Name : " + multipartFile.getOriginalFilename() );
			log.info("upload File Size : " + multipartFile.getSize());
			
			
			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
			
			
		}
	}
	
	
	@GetMapping("/JJ_uploadAjax")
	public String uploadAjax() {
		log.info("uploadAjax");
		
		return "/JJ_uploadAjax";
	}
	
	
	@PostMapping(value= "/JJ_uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<JJ_comAttachVO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		log.info("updata ajax post.........");
		
		
		List<JJ_comAttachVO> list = new ArrayList<JJ_comAttachVO>();
	
		
		log.info(uploadFile.length);
		
		
		String uploadFolder = "C:\\upload";
		
		// make folder
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath );
		
		log.info("upload path: " + uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		
		// 파일의 갯수만큼 타는 for문 
		for(MultipartFile multipartFile : uploadFile) {
			
			log.info("----------------------");
			log.info("upload File Name : " + multipartFile.getOriginalFilename() );
			log.info("upload File Size : " + multipartFile.getSize());
			
			
			JJ_comAttachVO attachVo = new JJ_comAttachVO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			// 올린 파일 명
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			log.info("only file name : " + uploadFileName);
			
			attachVo.setFileName(uploadFileName);	//dto에 파일 명(원본이름) 저장
			
			
			// 파일 명 앞에 붙어있는 랜덤값
			UUID uuid = UUID.randomUUID();
			
			// 업로드 되는 파일의 최종이름
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			
			try {
				
				File saveFile = new File(uploadPath, uploadFileName );
				multipartFile.transferTo(saveFile);
				
				attachVo.setUuid(uuid.toString());
				attachVo.setUploadPath(uploadFolderPath);
				
				list.add(attachVo);
				
				
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		
		}	// end for
		return new ResponseEntity<List<JJ_comAttachVO>>(list,HttpStatus.OK);	
	}
	
	
	private String getFolder() {
		SimpleDateFormat sdf=  new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
		
	}
	
	
	// 업로드 된 파일 다운로드 하기
	@GetMapping(value="/JJ_download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(String fileName) {
		
		log.info("download file : " + fileName);
		Resource resource = new FileSystemResource("C:\\upload\\" + fileName);
		log.info("resource : " + resource);
		
		String resourceName = resource.getFilename();
		
		
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_")+1);
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			headers.add("Content-Disposition", "attachment; filename="+ new String(resourceOriginalName.getBytes("utf-8"), "ISO-8859-1"));
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
		
	}
	
	
	// 파일 삭제하기
	@PostMapping("JJ_deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName){
		
		log.info("deleteFile : " + fileName);
		
		File file = null;
		try {
			file = new File("C:\\upload\\"+ URLDecoder.decode(fileName, "utf-8"));
			// decode : 던질 때 인코딩 해서 던짐. 받을 때 decode.
			
			file.delete();
			
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
	}
	
	
	
	
}
