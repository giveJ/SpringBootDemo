package org.a.controller;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/sample/*")
public class SampleController {
	// /sample/all 		-> 로그인 하지 않은 사용자도 접근 가능한 URI
	// /sample/member 	-> 로그인 한 사용자들만 접근할 수 있는 URI
	// /sample/admin	-> 로그인 한 사용자들 중 관리자 권한을 가진 사용자만 접근할 수 있는 URI
	
	
	@GetMapping("/all")
	public String doAll() {
		log.info("do all can access everybody");
		return "/sample/all";
	}
	
	@GetMapping("/member")
	public String doMember() {
		log.info("logined member.....");
		return "/sample/member";
	}
	
	@GetMapping("/admin")
	public String doAdmin() {
		log.info("admin only");
		return "/sample/admin";
	}
	
	
	
	/*
	 * @Secured - 스프링 시큐리티 초기부터 사용되었고, () 안에 'ROLE_ADMIN'과 같은 문자열
	 * 				혹은 문자 배열을 이용
	 * @PreAuthrize, @PostAuthrize - 3 버전 부터 지원되며, ()안에 표현식을 사용할 수 있으므로 최근에 많이 사용
	 * 
	 * *** 주의 사항 - 컨트롤러에서 사용하는 시큐리티의 어노테이션을 활성화 하기 위해서는
	 * security-context.xml이 아닌 스프링 MVC의 설정을 담당하는 servlet-context.xml에 설정을 추가해야 함
	 */
	
	//권한 있는 사람만 탈 수 있음
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
	@GetMapping("/annoMember")
	public void domember2() {
		log.info("로그인 어노테이션 멤버");
	}
	
	@Secured({"ROLE_ADMIN"})
	@GetMapping("/annoAdmin")
	public void doAdmin2() {
		log.info("어드민 어노테이션");
	}
	
	
	
	
	
	
}
