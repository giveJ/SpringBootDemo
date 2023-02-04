package org.a.controller;


import java.util.List;


import org.a.domain.Criteria;
import org.a.domain.JJ_comReplyVO;
import org.a.domain.PageDTO;
import org.a.service.JJ_comReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@RequestMapping("/com_replies/")
@RestController
public class JJ_comReplyController {
	
	@Setter(onMethod_= @Autowired)
	private JJ_comReplyService service;

	// 1. 댓글 등록
	// consumes = 수신할 데이터 포맷
	// produces = 출력할 데이터 포맷    
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody JJ_comReplyVO vo) {
		log.info("ReplyVO...." + vo);

		int insertCount = service.register(vo);
		log.info("Reply Insert Count : " + insertCount);

		return insertCount == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

	// 2. 목록
	@GetMapping(value = "/pages/{bno}/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<List<JJ_comReplyVO>> getList(@PathVariable("bno") int bno, @PathVariable("page") int page) {
		log.info("getList...."+bno);
		
		
		return new ResponseEntity<List<JJ_comReplyVO>>(service.getList(bno), HttpStatus.OK);
	}

	
	// 3. 조회
	@GetMapping(value = "/{rno}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<JJ_comReplyVO> get(@PathVariable("rno") int rno) {
		log.info("get......." + rno);

		return new ResponseEntity<JJ_comReplyVO>(service.read(rno), HttpStatus.OK);

	}

	// 4. 삭제
	@DeleteMapping(value = "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("rno") int rno) {
		log.info("remove...." + rno);

		return service.remove(rno) == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);

	}
	
	
	// 5. 수정
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value="/{rno}", consumes = "application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody JJ_comReplyVO vo,
				@PathVariable("rno") int rno){
		log.info("rno..."+rno);
		log.info("modify..." + vo);
		
		int modifyCount = service.update(vo);
		log.info("Reply Modify Count : " + modifyCount);
		
		return modifyCount == 1?
				new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
