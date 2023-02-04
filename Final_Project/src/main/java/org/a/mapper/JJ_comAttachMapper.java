package org.a.mapper;

import java.util.List;

import org.a.domain.JJ_comAttachVO;


public interface JJ_comAttachMapper {
	public void insert(JJ_comAttachVO vo);
	public void delete(String uuid);
	public List<JJ_comAttachVO> findByBno(int bno);
	// 첨부 파일의 경우 수정 개념이 없기 때문에 삽입, 삭제만 처리한다
	
	public void deleteAll(int bno);
	
	
}
