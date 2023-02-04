package org.a.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Ek_ClassDateVO {
	private long cno, dno;
	private String p_time_start_unit;
	private String p_time_end_unit;
	private String s_date_unit;
	
	private List<String> p_time_start;
	private List<String> p_time_end;
	private List<String> s_date;
	private int class_max;
	
	
}
