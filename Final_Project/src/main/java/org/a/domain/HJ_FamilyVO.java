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
public class HJ_FamilyVO {
	
	private long fno;
	private String variety,f_title;
	private Date f_date;
	private String f_age,f_gender,f_weight,f_color,f_place,f_special,f_check,familyImg,f_Img;
	
	
}
