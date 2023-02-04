package org.a.domain;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class JJ_comBoardVO {
	private int bno, replycnt;
	private String title, content, writer, postType, animalType;
	private Date regdate;
	
	
	// 게시글 등록 시 한번에 BoardAttachVO 를 처리하기 위해 list 추가
	private List<JJ_comAttachVO> attachList;
}
