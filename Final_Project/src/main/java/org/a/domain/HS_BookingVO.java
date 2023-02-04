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
public class HS_BookingVO {
	private String BK_TIME; // 방문시간
	private String BK_ADDR1; // 주소지
	private String BK_ADDR2; // 상세주소
	private String BK_CONTENT; // 돌봄특이사항
	private String user_ID; // 회원 아이디
	private int BK_NO; // 돌봄 예약번호
	private int PET_num; // 반려동물 고유번호
	private Date START_DATE; // 돌봄 시작일
	private Date END_DATE;	// 돌봄 종료일
	private Date BK_DATE;	// 예약일
	private int PST_NO; // 펫시터번호
}
