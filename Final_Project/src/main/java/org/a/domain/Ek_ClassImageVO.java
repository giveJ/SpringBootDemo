package org.a.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Ek_ClassImageVO {
	private String uuid, uploadPath, fileName;
	private String fileType;
	private long cno;
	
	
	private Ek_ClassLectureVO Ek_ClassLectureVO;
	public String getImageURL(){    //추후에 전체 경로가 필요한 경우를 대비하여 생성
        try{
            return URLEncoder.encode(uploadPath+"/"+uuid+"_"+fileName,"UTF-8");
        }catch (UnsupportedEncodingException e){
            e.printStackTrace();
        }
        return "class_list";
    }

}
