<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/ha_header.jsp" %>



 <!-- ------------------------내용 시작---------------------------------- -->
    <a href="/product/listSnack"><div class="banner1"></div></a>	<!-- class="banner1" 닫힘 -->
   
	<div class="container">
	
	<br/><br/><br/>
	      
      <div class="productA">
      	<br/><br/><br/>
      	
		<table>
			<tr>
				<td style="padding-right: 70px; padding-bottom: 35px;">
					<img src="${path }/img/${vo.product_url}" width="600" height="600">
				</td>
				<td>
					<!-- 상품명 테이블 폭 -->
					<table style="height: 300px; width: 450px; padding-bottom: 20px;">	
						<tr align="left">
							<td style="padding-right: 70px; padding-bottom: 35px;">
								<font face="서울꿈" size="5" style="font-weight: bold;">${vo.product_name}</font>
							</td>
						</tr>
						<tr align="left">
							<td style="padding-bottom: 20px;">${vo.product_desc}</td>
						</tr>
						<tr align="left">
							<td style="padding-bottom: 20px;">
								<font size="5" style="font-weight: bold;">
									<fmt:formatNumber value="${vo.product_price }" pattern="###,###,###원"/>
								</font>	
							</td>
						</tr>
						<tr align="center">
							<td colspan="2">
								<form name="form1" method="post" action="${path}/cart/insert.do">	<!-- 상품을 장바구니에 추가시키기 위해 상품ID번호, 수량을 form 태그로 전송 -->
									<input type="hidden" name="product_id" value="${vo.product_id }">	<!-- 현재의 상품ID를 입력받기 위해 hidden 속성으로 처리 -->
									<select name="amount">
										<c:forEach begin="1" end="10" var="i">
											<option value="${i }">${i }</option>
										</c:forEach>
									</select>&nbsp;개&nbsp;&nbsp;
									<input class="cart_in" type="submit" value="장바구니에 담기">
								</form>
							</td>
						</tr>
					</table>
					<hr/>
					<table style="height: 120px; width: 450px;">
						<tr align="left">
							<th style="padding-bottom: 7px;">
								<font color="#3498db">
									스마일배송
								</font>
							</th>
						</tr>
						<tr align="left">	
							<th style="padding-bottom: 7px;">
								오전11시 이전 주문 시 오늘 출발
							</th>
						</tr>
						<tr align="left">	
							<th style="padding-bottom: 7px;">
								무료배송(50,000원 이상 구매 시)
							</th>
						</tr>
					</table>
					<hr/>
					<table style="height: 110px; width: 450px;">
						<tr>
							<td>
								<a href="/product/list">♡ 다른 상품 고르러 가기 ♡</a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<!-- <hr/> -->
		
		<table style="width: 900px; padding-right: 50px; padding-bottom: 25px;">
			<tr align="center">
				<td>
					상품정보
				</td>
				<!-- <td>
					<a href="#">구매후기</a>
				</td> -->
				<td>
					<a href="/JJ_qnaBoard/list">상품문의</a>	<!-- 나중에 완성된거 합치면 문의사항 페이지로 이동하기 -->
				</td>
				<td style="width: 235px;">
					<a href="#box">취소/교환/반품 안내</a>
				</td>
			</tr>
		</table>
		<hr/>
		
		<!-- 상품정보 테이블 영역 -->
		<table style="height:100px; width: 900px;">	
			<tr>
				<td>
					<font size="4" style="font-weight: bold;">
						상품정보
					</font>
				</td>
			</tr>
		</table>
		
		<!-- 상품정보 이미지 -->
		<table style="margin: auto;">	
			<tr>
				<td>
					<img src="${path }/img/${vo.product_detail}">
				</td>
			</tr>
		</table>
		<br/><br/><br/><br/>
		
		<div id="box">
			<br/><br/>
			<h3>취소/교환/반품 안내</h3><br/>
			<b>주문취소</b><br/>
			
			주문취소는 '입금대기, 입금완료' 단계에서만 가능합니다.<br/>
			주문 내 일부 상품의 부분 취소는 불가능합니다.<br/>
			주문취소는 '마이페이지 > 주문 · 배송 > 주문취소 > 주문 상세 보기' 를 통해 직접 취소하실 수 있습니다.<br/>
			입금완료 후 신속한 발송을 위하여 주문 상태가 빠르게 '발송준비중' 으로 변경될 수 있으며, '발송준비중' 단계에서는 주문 취소가 불가능합니다.<br/>
			'발송준비중, 발송처리완료' 단계에서는 상품 수령 후 교환 또는 반품만 가능합니다.<br/><br/>
			
			
			<b>교환/반품</b><br/>
			
			교환 및 반품은 배송 완료일 기준으로 7일 이내 신청 가능합니다.<br/>
			교환/반품하려는 상품은 처음 배송한 택배사에서 수거하므로 다른 택배사 이용은 불가능합니다.<br/>
			판매자배송 상품은 판매자 및 상품에 따라 배송비가 다를 수 있으며, 상품의 도착지가 처음 발송한 주소와 다를 수 있으므로 고양이대통령 고객센터로 먼저 문의해 주시기 바랍니다.<br/><br/>
			
			
			<b>교환/반품이 불가능한 경우</b><br/>
			
			교환/반품 요청 기간이 지난 경우<br/>
			주문제작 상품으로 재판매가 불가능한 경우<br/>
			포장이 훼손되어 상품 가치가 감소한 경우<br/>
			상품을 설치하거나 사용한 경우<br/>
			시간의 경과에 의하여 재판매가 곤란할 정도로 상품의 가치가 현저히 감소한 경우<br/>
			구성품을 분실하였거나 고객님의 부주의로 인한 파손/고장/오염으로 재판매가 불가능한 경우<br/><br/>
			
			
			<b>교환/반품 배송비</b><br/>
			
			단순변심으로 인한 교환/반품은 고객님께서 배송비를 부담하셔야 합니다.<br/>
			상품의 불량 또는 파손, 오배송의 경우에는 고양이대통령에서 배송비를 부담합니다.<br/>
			판매자배송 상품은 판매자 및 상품에 따라 교환/반품 배송비가 다를 수 있으므로 고양이대통령 고객센터로 문의해 주시기 바랍니다.<br/>
			제주, 도서산간 지역은 추가 배송비가 발생할 수 있습니다.<br/><br/>
		</div>	<!-- id="box" 닫힘 -->
		
		
      </div>	<!-- class = "productA" 닫힘 -->	
      
      <br/><br/><br/>
      
  	</div>	<!-- class="container" 닫힘 -->

	<a href="/product/list"><div class="banner2"></div></a>
	

<script type="text/javascript">
	$(function(){
		var product_idValue = '${vo.product_id}';
		
		// 첨부 파일 스크립트 -------------------------------
        $.ajax({
            url : '/product/getAttachList',
            type : 'get',
            data : {product_id:product_idValue},
            contentType : 'application/json; charset=utf-8',
            success : function (arr) {            // 리스트로 넘어옴
               console.log(arr);
            
            //데이터 넣어주기
               var str = '';
				
				for(var i=0; i<arr.length; i++){
					var obj = arr[i];
					
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/" +
															obj.uuid + "_" + 
															obj.fileName);
					
					//console.log(fileCallPath);
					
					str += '<li data-path="'+obj.uploadPath+'" data-uuid="'+obj.uuid+'" data-filename="'+obj.fileName+'">';
					str += '<a href="/download?fileName='+fileCallPath+'">';
					str += '<img src="/resources/img/attach.png" style="width:15px">' + obj.fileName;
					str += '</a>';
					/* str += '<span data-file="'+fileCallPath+'"> X </span>';	//조회에서는 파일 삭제하는 기능 없애기 */
					str += '</li>';
				}
            
				$(".uploadResult ul").html(str);
				
            
            }
            
        });
		
		//console.log(replyService);	//테스트 코드
		
		var product_idValue = '${vo.product_id}';
		var replyUL = $(".chat");
		
		showList();

</script>


<%@ include file="../include/ha_footer.jsp" %>