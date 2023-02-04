package org.a.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HA_ProductAttachVO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;	//fileType: 이미지 파일, 이미지 파일 그 외 두개를 나누는 판단하는 작업(수업에선 존재하지만 사용하지 않을 거임)
	private int product_id;
	
}
