package org.a.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class JJ_NoticeVO {
	
	private int no;
	private String title, content;
	private Date regdate;
	
	
}
