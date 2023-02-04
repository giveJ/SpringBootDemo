package org.a.mapper;

import java.util.List;

import org.a.domain.HA_ProductAttachVO;

public interface HA_ProductAttachMapper {
	public void insert(HA_ProductAttachVO vo);
	public void delete(String uuid);
	public List<HA_ProductAttachVO> findByBno(int product_id);
	// 첨부 파일의 경우 수정 개념이 없기 때문에 삽입, 삭제만 처리한다.
}
