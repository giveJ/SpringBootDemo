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
public class HJ_ReviewVO {
	private long rno;
	private String r_title, r_content;
	private Date r_date;
	private String reviewImg,r_Img;
}
