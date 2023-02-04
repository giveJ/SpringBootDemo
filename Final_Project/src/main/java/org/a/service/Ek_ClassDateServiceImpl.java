package org.a.service;


import java.util.List;

import org.a.domain.Ek_ClassDateVO;
import org.a.domain.Ek_ClassImageVO;
import org.a.domain.Ek_ClassLectureVO;
import org.a.mapper.Ek_ClassDateMapper;
import org.a.mapper.Ek_ClassLectureMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j
public class Ek_ClassDateServiceImpl implements Ek_ClassDateService{
	
	@Setter(onMethod_ = @Autowired)
	private Ek_ClassDateMapper dmapper;
	
	@Setter(onMethod_ = @Autowired)
	private Ek_ClassLectureMapper mapper;
	

	@Override
	public void insertDate(Ek_ClassDateVO dvo) {
		log.info("날짜 으아앙 입려여여ㅓㄱ : " + dvo);
		log.info("너 길이가 뭐야!!!왜 하나 빼고 돌아!! : "+dvo.getS_date().size());
		log.info(dvo.getS_date());
		for(int i = 0; i<dvo.getS_date().size(); i++) {
			Ek_ClassDateVO tmp_vo = new Ek_ClassDateVO();
			tmp_vo.setS_date_unit(dvo.getS_date().get(i));
			
			for(int j=0; j<dvo.getP_time_start().size(); j++) {
				tmp_vo.setCno(dvo.getCno());
				tmp_vo.setP_time_start_unit(dvo.getP_time_start().get(j));
				tmp_vo.setP_time_end_unit(dvo.getP_time_end().get(j));
				tmp_vo.setClass_max(dvo.getClass_max());
				dmapper.insertDate(tmp_vo);
			}
			
		}
	}


	@Override
	public List<Ek_ClassDateVO> selectDate(String s_date) {
		
		return dmapper.selectDate(s_date);
	}

	
	
}
