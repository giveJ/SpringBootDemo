package org.a.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Criteria {
	
	private int pageNum, amount;
	private String type;	//검색
	private String keyword;	//검색
	
	
}
