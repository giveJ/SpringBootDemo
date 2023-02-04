<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#map{
		text-align: center;
	}
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc5e429549191aea0e6828bbfb1d6524"></script>
<script type="text/javascript">
	
	$(function(){
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(37.48203830646917,126.89797802694689), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	var marker = new kakao.maps.Marker({ 
	    // 지도 중심좌표에 마커를 생성합니다 
	    position: map.getCenter() 
	}); 
	
	
	marker.setMap(map);
	
		var actionForm = $("#actionForm");
		
		 $(".pop_bt").click(function(){
				actionForm.attr("action","/HJ_family/HJ_list");
				actionForm.submit();
		});
			
	});
	

	var result = '<c:out value="${result}"/>';
	
	if(result != ''){
		checkResult(result);
	}
	
	history.replaceState({}, null,null);
	function checkResult(result){
		
		if(result === '' || history.state){	
			alert("처리가 완료");
			return;
		}
		if(result === 'success'){	
			alert("처리 완료");
			return;
		}
		if(result === 'ok'){
			alert("신청이 완료되었습니다.");
		}
	
	}	
</script>
</head>
<body>

	 <div id="check" class="check">
      <!-- Modal content -->
      <div class="check-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">신청이 완료되었습니다!</span></b></span></p><br/><br/>
                <p style="text-align: center: ;"><span style="font-size: 10pt;"><b><span style="font-size: 15pt; text-align: center;">- 보호소에서 확인 후 연락드리겠습니다.<br/>
- 입양은 선착순으로 진행되지 않으며, 개별 연락 후 조건에 맞는 분에게 입양하게 될 예정입니다.<br/>
- 나이는 일정한 수입이 있는 25세 이상, 60세 이하여야 하며 19세 미만은 부모님이 직접 입양을 신청하셔야 합니다.<br/>
- 입양이 확정될 경우 별도의 입양계약서/입양 책임비에 대한 절차가 있음을 알려드립니다.<br/>
- 입양책임비는 입양에 대한 최소한의 책임감을 담보하기 위해 받기로 결정하였습니다.<br/>
 하지만 저희는 귀중한 아이들의 생명이 영리적인 목적으로 사용되길 원치 않습니다. <br/>
 입양비는 입양 전 접종비 등 실비에 사용되며, 그 외 금액은 보증금 형식으로 보관하여 입양 6개월에서 1년 후 <br/>
 아이들이 잘 정착한 것을 확인한 뒤 돌려드리고자 합니다. 단, 입양 후 파양 시 입양책임비는 돌려드리지 않습니다.</span></b></span></p>
                <p style="text-align: left; line-height: 1.5;"></p>
                <p style="text-align: center;"><span style="font-size: 10pt;"><b><span style="font-size: 15pt;"></span></b></span></p>
                <p style="text-align: left; line-height: 1.5;"></p>
                <p style="text-align: center;"><span style="font-size: 10pt;"><b><span style="font-size: 15pt;"></span></b></span></p>
                <p style="text-align: left; line-height: 1.5;"></p>
                <p><br/></p>
           
      </div>
    </div>
    <h2>smile paws 오시는 길</h2>
    <h3><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
  <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
</svg>주소 서울특별시 구로구 시흥대로163길 33 주호타워 2층</h3>
<h3><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
</svg>문의번호 1588-8324</h3>
    <div id="map" style="width:100%;height:400px;"></div>
    
    
     <br/>
    <br/>
    <br/>
     <div style="cursor:pointer;background-color:skyblue;text-align: center;padding-bottom: 10px;padding-top: 10px; border-radius: 10px;">
                <span class="pop_bt" style="font-size: 13pt;" >
                     목록으로
                </span>
            </div>
	
		<form action="/HJ_adopt/HJ_adopt_list" method="get" id="actionForm">
			<input type="hidden" name="pageNum" value="1">
			<input type="hidden" name="amount" value="20">
		</form>
	
<%@ include file="../include/footer.jsp" %>
</body>
</html>