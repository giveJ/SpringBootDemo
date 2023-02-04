package org.a.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class JJ_qnaReplyVO {
	private int rno, bno;
	private String reply;
	private Date replydate;
}
