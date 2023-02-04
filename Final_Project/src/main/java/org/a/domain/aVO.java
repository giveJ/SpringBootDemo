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
public class aVO {
	private String user_ID;
	private String user_PW;
	private String user_NAME;
	private String user_EMAIL;
	private String user_TEL;
	private String user_ADDR;
	private Date user_JOIN_DATE;
	private int user_age;
	private int user_grade;
	
	private int bk_no, pet_num;
}
