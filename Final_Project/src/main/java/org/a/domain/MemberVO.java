package org.a.domain;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {
	private String userid;
	private String userpw;
	private String username;
	private Date regdate;
	private Date updatedate;
	private boolean enabled;
	
	private List<aVO> authList;
	
}
