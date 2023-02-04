package org.a.mapper;


import java.util.List;

import org.a.domain.Ek_ClassImageVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

public interface Ek_ClassImageMapper {
	public List<Ek_ClassImageVO> findByCno(long cno);
	public void insert(Ek_ClassImageVO ivo);
	public void delete(String uuid);
	public List<Ek_ClassImageVO> fileType(Ek_ClassImageVO ivo);
}
