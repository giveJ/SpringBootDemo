<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/ha_header.jsp" %>



 <!-- ------------------------내용 시작---------------------------------- -->
    <a href="/product/listSnack"><div class="banner1"></div></a>	<!-- class="banner1" 닫힘 -->
   
	<div class="container">
	
	<br/><br/><br/>
	      
      <div class="product">
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
							<td colspan="1">
								<form action="form1" method="post" action="/product/cart">
									<input type="hidden" name="product_id" value="${vo.product_id }">
									<select name="amount">
										<c:forEach begin="1" end="5" var="i">
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
				<td>
					<a href="#">구매후기</a>
				</td>
				<td>
					<a href="#">문의사항</a>
				</td>
				<td style="width: 235px;">
					<a href="#">취소/교환/반품 안내</a>
				</td>
			</tr>
		</table>
		<hr/>
		
		<!-- 상품정보 테이블 영역 -->
		<table style="height:100px; width: 900px;">	
			<tr>
				<td>
					<font size="5" style="font-weight: bold;">
						상품정보
					</font>
				</td>
			</tr>
		</table>
		
		<!-- 상품정보 이미지 -->
		--상품정보 이미지 영역--
		
      </div>	<!-- class = "product" 닫힘 -->	
      
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