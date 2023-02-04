package org.a.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Data
@NoArgsConstructor
@AllArgsConstructor
public class HS_PstReplyVO {
	private String RE_CONTENT; // 이용 후기
	private int PST_REPLYNUM;  // 후기 번호
	private int BK_NO; // 돌봄서비스 예약번호
	private String BK_TIME; // 이용 시간
	private Date START_DATE; // 돌봄 시작일
	private Date END_DATE;	// 돌봄 종료일
	private Date RE_DATE;	// 후기 작성일
	private String user_ID; // 회원 아이디
	private int PET_num; // 반려동물 고유번호
	private int PST_NO; // 펫시터 번호
	private int pstReplynum;
	private String reContent;
	
	
}
