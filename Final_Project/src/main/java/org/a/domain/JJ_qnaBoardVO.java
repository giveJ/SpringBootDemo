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
public class JJ_qnaBoardVO {
	private int bno, secret, replyCnt;
	private String title, content, writer, category;
	private Date regdate;
}
