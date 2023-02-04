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
public class HS_PetVO {
	private String user_ID; // 회원 아아디
	private String PET_NAME; // 반려동물이름 
	private String PET_GENDER; // 성별
	private String PET_KIND; // 품종
	private String PET_WEIGHT; // 몸무게
	private String PET_CONTENT; // 돌봄 특이사항
	private int PET_num; // 반려동물 고유번호
	private String PET_AGE; // 반려동물 나이
	private Date START_DATE; // 돌봄 시작일
	private Date END_DATE;	// 돌봄 종료일
}
