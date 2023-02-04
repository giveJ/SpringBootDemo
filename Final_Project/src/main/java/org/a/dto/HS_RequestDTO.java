package org.a.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HS_RequestDTO {
	// select용 RequestDTO
	
	private String RE_CONTENT; // 후기 내용
	private String bk_content; // 후기 내용
	private int PST_REPLYNUM; // 이용후기 번호
	private int BK_NO; // 부킹번호
	private String user_ID; // 회원 아이디
	private String user_TEL; // 회원전화번호
	private String PET_NAME; // 반려동물 이름
	private int PET_num; // 반려동물 번호
	private String PST_NAME; // 펫시터 이름
	private String bk_time; // 방문시간대
	private String bk_addr1; // 주소
	private String bk_addr2; // 상세주소
	private Date START_DATE,END_DATE; // 서비스이용 시작/종료일
	private Date RE_DATE; // 후기 등록일
	private Date bk_date; // 예약일
	
}
