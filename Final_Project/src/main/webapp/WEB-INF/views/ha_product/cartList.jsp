<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>smile paws</title>
<link rel="icon" href="resources/img/favicon1.png">
<style type="text/css">
/* ---------------상단 css------------------ */
   .logo_menu{
     	padding-left: 40px;
     	padding-top: 10px;
     	padding-bottom: 20px;
   }
   .right_menu{
   		 padding-left: 1450px;
     	 padding-right: 50px;
   }
   
   .middle_m{
      list-style-type: none;
      display: inline-block;
      overflow: hidden;
      position: absolute;
      top: 20px;
      padding-left: 277px;
   }
   .right_m{
      list-style-type: none;
      display: inline-block;
      overflow: hidden;
      position: absolute;
      top: 20px;
   }
   
   ul li{
      list-style-type: none;
      float: left;
   } 
   
   li a, .droptn{
      color: black;
      display: block;
      text-align: center;
      width: 100px;
      padding-top : 20px;
      padding-right : 20px;
      padding-bottom : 20px;
      text-decoration: none;
   }
   
   li a:hover{
      font-weight: bold;
      color:  #3498db;
   }
   
   .droptn-content{
      position: fixed;
      display: none;
      background-color: #d1edff;
   }
   
   .dropdown:hover .droptn-content {
      display: block;
      position: fixed;
      z-index: 1;
   }
   
   .dropdown{
      display: inline-block;
   }
   
/* ---------------양 사이드 영역 css------------------ */
	*{
		margin: 0;
		padding: 0;
	}
	.content{
		margin-left: 170px;
		width: 800px;
	}
	
	/* 신상품 상품 목록 화면 시작 ----------------------------*/
	.content_new{
		margin-left: 290px;
		width: 1220px;
	}
	.banner_new{
		width: 240px;
		height: 710px;
		position: fixed;
		top: 200px;
		right: 70px;
		background-image: url("../img/smilepaws_banner_size.png");
		background-repeat: no-repeat;
		background-color: yellow;	/* 위치 확인용 임시코드 */
	}
	/* 신상품 상품 목록 화면 끝 ----------------------------*/
	
	.banner1{
		width: 200px;
		height: 710px;
		position: fixed;
		top: 200px;
		left: 47px;
		background-image: url("../resources/img/smilepaws_banner_size.png");
		background-repeat: no-repeat;
	}
	.banner2{
		width: 200px;
		height: 710px;
		position: fixed;
		top: 200px;
		right: 45px;
		background-image: url("../resources/img/event_banner_size.png");
		background-repeat: no-repeat;
	}
	.banner3{
		width: 200px;
		height: 710px;
		position: fixed;
		top: 200px;
		right: 45px;
		background-image: url("../resources/img/event_banner01.png");
		background-repeat: no-repeat;
	}
	  
/* ---------내용 css------------------------------------- */
   
   .container_category{
   		/* float: left; //카테고리명 세로로 할 경우 */
   		margin-top: 5%;
  		margin-bottom: 4%;
   }
	.container{
		/* float: right; */
		margin-left: 15%;
		margin-right: 15%;
		margin-bottom: 10%;
	}
	hr{
	  	background-color: #d7ecfa;
	  	height:3px;
	  	border: 0px;
	}
	a{
		text-decoration-line: none;
	}
	.productA{
		/* 원래 코드 */
		/* margin-right: 5%; */	
		width: 1200px;
	    margin-left: auto;
	    margin-right: auto;
	}
	table{
		width:100%;
 		table-layout: fixed;
	}
	.tbl-header{
	  background-color: #d7ecfa;
	 }
	.tbl-content{
	  /* height:300px; */
	  overflow-x:auto;
	  margin-top: 0px;
	  border: 1px solid #d7ecfa;
	}
	th{
	  padding: 10px 15px;
	  color: black;
	  text-transform: uppercase;
	}
	td{
	  padding: 15px;
	  text-align: center;
	  vertical-align:middle;
	  color: black;
	  border-bottom: solid 1px #d7ecfa;
	}
	
	/* demo styles */

	section{
	  margin: 50px;
	}
	
	
	
	.pro_img_list{
		/* padding-top: 20px;
	    width: 330px; */
	    width: 350px;
	}
	
	.product-img1{
/* 		width: 240px;
		height: 220px; */
		/* width: 100%;
  		height: 50%; */
		width: 300px;
		height: 300px;
		padding-bottom: 10px;
		padding-right: 10px;	/* 보류 */
	}
	.product-img2{
		width: 150px;
		height: 150px;
	}
	.pro_price{
		text-align: left;
		padding: 30px;
	}
	.cart_in{
		width: 300px;
		height: 50px;
		background-color: #d7ecfa;
		border-radius: 4px;
	}
	
	/* 신상품 상품 목록 화면 시작 ----------------------------*/
	.hero-header{
    height: 450px;
    background-image: url("https://bakey-api.codeit.kr/files/629/images/hero_header.jpg");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center center;
    }
      
	.product-list{
	    width: 735px;
	    margin-left: auto;
	    margin-right: auto;
	}
	.products h3{
	    font-size: 24px;
	    color: #545454;
	    margin-top:60px;
	    margin-bottom: 60px;
	    text-align: center;
	}
	
	.product{
	    display: block;
	    width: 225px;
	    text-align: center;
	    text-decoration:none;
	    color: black;
	    float:left;
	    margin-left: 10px;
	    margin-right: 10px;
	    margin-bottom: 30px;
	}
	
	.product-name{
	    margin-top: 20px;
	    margin-bottom: 4px;
	}
	
	.clearfix{
	    clear: both;
	}
	
	/* 신상품 상품 목록 화면 끝 ----------------------------*/
   
   
/* ------------하단바 css------------------------- */

   .footer{
       padding-top: 30px;
       padding-bottom: 30px;
   }
   .footer1{
       padding-top: 20px;
       padding-left: 400px;
       padding-bottom: 30px;
   }
   .footer2{
       padding-top: 20px;
       padding-left: 330px;
       padding-bottom: 30px;
   }
   
</style>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	// 상품리스트 페이지로 이동
	function btnList() {
		location.href="/product/list";	
	}
	
	// 주문리스트 페이지로 이동
	function btnOrder() {
		location.href="/cart/orderView";	
	}
	
	$(function(){
		
		$('.btnUpdate').on('click', function(e){
			e.preventDefault();

			var obj = $(this).siblings();	//변경할 버튼이 여러개인데 그 중 하나의 버튼만 잡고 적용되라고 this 사용
	        //필요한 데이터가 2개여서 배열obj[] 사용 
	        var amount = obj[0].value;	 // 변경할 수량
	        var pid = obj[1].value;		// 변경할 상품 번호
			
			location.href='/cart/update.do?amount='+amount+'&product_id='+pid;
			
		});
		
		
		$("input[type=number]").on('change', function(){
			
			var amount = $(this).val();		// 현재 수정된 수량
		});
		
	});


</script>
</head>

<body link="black" vlink="black" alink="#3498db">

<!-- ------------------------상단바 시작---------------------------------- -->
   <div class="menu"> 
   
	   <div class="logo_menu">
		     <img src="../resources/img/smilepaws_logo2.png" width="140px" height="80px" >
	   </div>
	   
	   <div class="middle_menu">
	      <ul class="middle_m">
	         <!-- <li class="middle_m2"><a href="#">Home</a></li> -->
	         <li><a href="/product/main">Home</a></li>
	         <li><a href="#">돌봄</a></li>
	         <li><a href="/product/list">용품</a></li>
	         <li><a href="#">클래스</a></li>
	         <li><a href="#">커뮤니티</a></li>
	         <li><a href="#">가족찾기</a></li>
	         <li class="dropdown">
	            <a href="#" class="droptn">고객센터</a>
	               <div class="droptn-content" onmouseover="this.style.opacity='0.9'">
	                  <a href="#">공지사항</a>
	                  <a href="#">문의사항</a>
	               </div>
	         </li>
	      </ul>
	   </div>

	   <div class="right_menu">
	 		 <ul class="right_m">
			      <li><a href="#">로그인</a></li>
			      <li><a href="#">회원가입</a></li>   
			      <li><a href="${path}/cart/list.do"><img src="../resources/img/main2.png" width="37px" height="35px"></a></li>
	 		 </ul>  
	    </div>
   
   </div>
   
   <hr/>
   
   
 <!-- ------------------------내용 시작---------------------------------- -->
    <a href="/product/list">
  	  <div class="banner1"></div>	<!-- class="banner1" 닫힘 -->
    </a>
   
	<div class="container">
	
	<br/><br/><br/>
	      
      <div class="productA">
      	<h2>장바구니</h2>
      	<h4 style="text-align: right;"><b style="color: #3498db">01 장바구니</b> > 02 주문결제 > 03결제완료</h4>
      	<br/>
      	<c:choose>
      		<c:when test="${empty map.list}">
	      		<hr/><br/><br/>
	      			<div style="text-align: center; padding: 15%;">장바구니가 비어있습니다.</div>
	      		<br/>
      		</c:when>
      		<c:otherwise>
      			<hr/><br/><br/>
	      		<!-- 장바구니에 담긴 상품수량 업데이트 처리 -->
		      	<form name="form1" class="form1" method="post" action="${path}/cart/update.do">
		      		<div>
						<table cellpadding="0" cellspacing="0" border="0">
							<thead class="tbl-header">
								<tr>
									<th colspan="2" >상품정보</th>
									<th>판매가</th>
									<th>수량</th>
									<th>주문가</th>
									<th>삭제</th>
								</tr>
							</thead>
							<tbody class="tbl-content">
							<c:forEach var="row" items="${map.list }" varStatus="i">
								<tr class="pro_img">
									<td>
										<a href="/product/productD?product_id=${row.product_id}">
								      		<img src="${path }/img/${row.product_url }" class="product-img2">
							    	  	</a>
									</td>
									<td style="padding: 20px;">
										${row.product_name}
									</td>
									<td>
										<fmt:formatNumber  pattern="###,###,###원" value="${row.product_price }"/>
									</td>
									<!-- 상품수량 변경, 최소값을 1로 설정해주고 상품수량 변경을 위해 상품ID 번호를 hidden속성으로 입력
										name 속성을 배열첨자([])로 처리하지 않은 이유는 동일한 name 속성이 반복적으로 입력되면 서버에서 배열로 쌓아서 작업을 처리해주기 때문이다.
										즉, 화면으로부터 동일한 name 속성의 값들이 CartController의 update() 메서드의 
										매개변수 int[] amount, int[] product_id에 배열로 저장되어 처리된다. 
										다중 데이터를 던지기 때문에 amount를 배열로 해야하는데 스크립트 처리해야 함 -->
									<td>
										<input type="number" style="width: 40px; text-align: center;" name="amount" value="${row.amount }" min="1">
										<input type="hidden" name="product_id" value="${row.product_id }">
						      			<button type="submit" class="btnUpdate">변경</button>
									</td>
									<td>
										<fmt:formatNumber pattern="###,###,###원" value="${row.money }"/>
									</td>
									<td>
										<a href="/cart/delete.do?cart_id=${row.cart_id }">삭제</a>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					
					</div> <!-- tbl-content 클래스 닫힘 -->
					
					<br/>
					
					<div style="text-align: center; padding: 10px;">
						총 상품 금액 <b><fmt:formatNumber pattern="###,###,###원" value="${map.sumMoney }"/></b>
						<span style="color: #d7ecfa;">&nbsp;&nbsp;|&nbsp;&nbsp;</span> 
						배송비 ${map.fee } 
						<span style="color: #d7ecfa;">&nbsp;&nbsp;|&nbsp;&nbsp;</span> 
						결제 금액 
						<span style="color: #ff6c2b; font-size: 1.8rem; font-family: HGHaeDotum,sans-serif;">
						   	<fmt:formatNumber pattern="###,###,###원" value="${map.allSum }"/>
					    </span>
						<!-- <a href="/cart/orderView"><b style="color: #0270ba; font-size: 1.8rem; background-color: #d7ecfa;">구매하기</b></a> -->
						<br/><br/><br/>
						<div style="padding-left: 44%">
							<div style="text-align: center; padding: 2%; width: 110px; background-color: #d7ecfa; border-radius: 4px;">
								<a href="/cart/orderView"><b style="color: #0270ba;">구매하기</b></a>
							</div>	
						</div>					
					</div>
					
					<!-- <div style="text-align: center; padding: 10px;">
		      			<button type="submit" id="btnOrder">구매하기</button>
					</div> 
					<div style="text-align: center; padding: 2%;">
						<a href="/cart/orderView"><b style="color: #0270ba;">♡ 구매하기 ♡</b></a>
					</div>	
					-->
		      	</form>
      		</c:otherwise>
      	</c:choose>
      	<br/>
      	<hr/>
		<div style="text-align: center; padding: 2%;">
			<a href="/product/list"><b style="color: #0270ba;">♡ 계속 쇼핑하기 ♡</b></a>
		</div>				
      
      </div>	<!-- class = "productA" 닫힘 -->	
      <br/><br/><br/>
      
  	</div>	<!-- class="container" 닫힘 -->

	
	<a href="/product/list"><div class="banner3"></div></a>
	

<%@ include file="../include/ha_footer.jsp" %>