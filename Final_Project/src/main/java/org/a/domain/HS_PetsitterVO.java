package org.a.domain;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HS_PetsitterVO {
	private int PST_NO; // 펫시터 번호
	private String user_ID; // 회원 아이디
	private String PST_NAME; // 펫시터 이름
	private String PST_LICENSE; // 펫시터 자격및경력
	private String PST_MYSELF; // 펫시터 소개
	private String PST_ADDR; // 활동지역
	private int PET_NUM; // 반려동물 번호
}
