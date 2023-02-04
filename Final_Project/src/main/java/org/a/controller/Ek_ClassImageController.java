package org.a.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.a.domain.Ek_ClassImageVO;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class Ek_ClassImageController{
	
	@PostMapping("/Ek_uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		
		String uploadFolder ="C:\\upload";
		for(MultipartFile multipartFile : uploadFile) {
			log.info("-----------------------");
			log.info("upload File Name : " + multipartFile.getOriginalFilename());
			log.info("upload File Size : " + multipartFile.getSize());
		
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
	}
	
	@PostMapping(value = "/Ek_uploadAjaxAction", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<Ek_ClassImageVO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		log.info("updata ajax post..................");
		
		List<Ek_ClassImageVO> list = new ArrayList<Ek_ClassImageVO>();
		
		String uploadFolder ="C:\\upload";
		
		//make folder
		//중복되는 파일 처리
		//중복되는 파일 처리할 폴더 make folder
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		log.info("upload path : " + uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			log.info("-----------------------");
			log.info("upload File Name : " + multipartFile.getOriginalFilename());
			log.info("upload File Size : " + multipartFile.getSize());
			
			Ek_ClassImageVO ivo = new Ek_ClassImageVO();
			
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			//내가 업로드한 원본 파일명
			log.info("only file name : " + uploadFileName);
			
			ivo.setFileName(uploadFileName);  //dto에 파일명(원본) 저장
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;  
			//파일명 앞에 랜덤의 문자열들이 나열되기 때문에 중복되는 파일이 있을 수 없다
			
			
			
			try {
				File saveFile = new File(uploadPath ,uploadFileName);
				multipartFile.transferTo(saveFile);
				
				ivo.setUuid(uuid.toString());	
				ivo.setUploadPath(uploadFolderPath);
				
				log.warn("**********" + ivo.getUuid());
				log.warn("**********" + ivo.getUploadPath());
				log.warn("**********" + ivo.getFileName());
				list.add(ivo);
				
				
				
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}//end for문
	
		
		return new ResponseEntity<List<Ek_ClassImageVO>>(list, HttpStatus.OK);
	}
	
	//현재 날짜로 파일 저장되는 거 
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("_", File.separator);
	}
	
	
	@GetMapping(value = "/Ek_download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<Resource> downloadFile(String fileName) {
		log.info("download file : " + fileName);
		Resource resource = new FileSystemResource("C:\\upload\\" + fileName);
		log.info("resource : "+resource);
		
		String resourceName = resource.getFilename();
		
		String resourcOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			headers.add("Content-Disposition", "attachment; fileName=" + new String(resourcOriginalName.getBytes("utf-8"), "ISO-8859-1"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	@PostMapping("Ek_deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName){
		log.info( "delete file : " + fileName);
		
		
		File file = null;
		
		try {
			file = new File("C:\\upload\\" + URLDecoder.decode(fileName, "utf-8"));
			//인코딩해서 파일 받았으니까 디코딩 해준다
			file.delete();
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){
		log.info("fileName : " + fileName);
		
		File file = new File("C:\\upload" + fileName);
		log.info("file: " + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result=new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header, HttpStatus.OK);
		}catch(IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
}
