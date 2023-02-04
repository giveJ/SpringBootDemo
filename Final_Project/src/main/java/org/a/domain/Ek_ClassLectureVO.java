package org.a.domain;





import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Ek_ClassLectureVO {
	private long cno;
	private String user_ID, 
	class_name, 
	class_type, 
	class_intro, 
	class_detail, 
	class_runtime, 
	class_price,
	tutor_intro, 
	tutor_nickname,
	keyword, 
	class_loc
	, class_loc_detail,
	class_start, 
	class_end, 
	class_tel; 
	
	
	private List<Ek_ClassImageVO> classImageList;
	
}
