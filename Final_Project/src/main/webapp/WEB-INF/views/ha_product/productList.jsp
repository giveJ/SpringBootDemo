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

	body {
	/* 고유한 종횡비를 가지는 경우 해당 종횡비를 따르고, 그렇지 않은 경우 1 : 1 비율로 지정 */
	aspect-ratio: auto 1 / 1; 
	}
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
      padding-left: 380px;
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
/*    .middle_m2{
      float: left;
   } */
   
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
		left: 85px;
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
		width: 229px;
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
		/* margin-right: 15%;
		margin-bottom: 10%; */
		/* margin-left: 20%; */
		width: 78%;
   		padding-left: 20%;
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
	    margin-left: auto;
	    margin-right: auto;
	}
	tr{
		margin: 5%;
	}
 	td{
		padding-right: 11px;
	} 
	th{
		padding-bottom: 40px;
	}
	.pro_img_list{
		/* padding-top: 20px;
	    width: 330px; */
	    width: 350px;
	}
	.product-img1{
		/* width:83%; */	/* 상품 이미지 크기 조절(작게 ver) */
		width:70%;	/* 상품 이미지 크기 조절 */
		margin: auto;
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
	
/* 	.product{
	    display: block;
	    width: 225px;
	    text-align: center;
	    text-decoration:none;
	    color: black;
	    float:left;
	    margin-left: 10px;
	    margin-right: 10px;
	    margin-bottom: 30px;
	} */
	
	.product-name{
	    margin-top: 20px;
	    margin-bottom: 4px;
	}
	
	.clearfix{
	    clear: both;
	}
   .menuListBox{
		width: 28%; 
		float: left;
		margin-top: 20px;
		margin-bottom: 40px;
		/* margin-right: 3%; */
   }
	
	/* 신상품 상품 목록 화면 끝 ----------------------------*/
   
   
/* ------------하단바 css------------------------- */

   .footer{
       padding-top: 30px;
       padding-bottom: 30px;
       clear:both;
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
	         <li><a href="/main">Home</a></li>
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
   
   <hr style="clear: both;"/>
   
   


 <!-- ------------------------내용 시작---------------------------------- -->
   	<a href="/product/list"><div class="banner1"></div></a>
   
	<div class="container">
	
	   <div class="container_category">
	   		<h3>category</h3>
	   		<ul>
		   		<li style="list-style-type: none; float: left;"><a href="/product/list">신상품</a></li>
		        <!-- <li style="list-style-type: none; float: left;"><a href="/product/listFeed">사료</a></li>
		        <li style="list-style-type: none; float: left;"><a href="/product/listSnack">간식</a></li>
		        <li style="list-style-type: none; float: left;"><a href="/product/listEtc">기타용품</a></li> -->
		        <li style="list-style-type: none; float: left;"><a href="#box1">사료</a></li>
		        <li style="list-style-type: none; float: left;"><a href="#box2">간식</a></li>
		        <li style="list-style-type: none; float: left;"><a href="#box3">용품</a></li>
	   		</ul> 
	   		
	   </div>	<!-- class="container_category" 닫힘 -->
	  
	   <br/><hr style="clear: both; margin-right: 24%;"/><br/><br/>
      
    <!-- 신상품 상품 목록 화면 시작 -->  
      
      <h3>신상 BEST 상품 할인중!</h3>
      <div class="productA">
      
		<%-- service.getList()를 model.addAttribute으로 list에 담음 --%>
      	<c:forEach var="vo" items="${list }" begin="1" end="15">
	      	<div class="menuListBox">
		      	<a href="/product/productD?product_id=${vo.product_id}">
		      		<img src="${path }/img/${vo.product_url }" class="product-img1">
	    	  	</a>
	      		<div>
	      			<a href="/product/productD?product_id=${vo.product_id}">
		      			${vo.product_name }
	      			</a>
	      		</div>
	      		<div>
	      			<font style="font-weight: bold;">
			        	<fmt:formatNumber value="${vo.product_price }" pattern="###,###,###원"/>
		            </font>
		        </div>
	      	</div>
      	</c:forEach>

      </div>	<!-- class = "productA" 닫힘 -->	
      
      <br/><br/><br/>

	  <div style="padding-top: 134%;"></div>

      <h3 id="box1">사료</h3>
      <div class="productA">
      
		<%-- service.getList()를 model.addAttribute으로 list에 담음 --%>
      	<c:forEach var="vo" items="${list }" begin="16" end="34">
	      	<div class="menuListBox">
		      	<a href="/product/productD?product_id=${vo.product_id}">
		      		<img src="${path }/img/${vo.product_url }" class="product-img1">
		      	</a>
	      		<div class="flex-item">
	      			<a href="/product/productD?product_id=${vo.product_id}">
		      			${vo.product_name }
	      			</a>
	      		</div>
	      		<div class="flex-item">
	      			<font style="font-weight: bold;">
			        	<fmt:formatNumber value="${vo.product_price }" pattern="###,###,###원"/>
		            </font>
		        </div>
	      	</div>
      	</c:forEach>

      </div>	<!-- class = "productA" 닫힘 -->	
      
      <br/><br/><br/>
      
      <div style="padding-top: 187%;"></div>
      
      <h3 id="box2">간식</h3>
      <div class="productA">
      
		<%-- service.getList()를 model.addAttribute으로 list에 담음 --%>
      	<c:forEach var="vo" items="${list }" begin="35" end="44">
	      	<div class="menuListBox">
	      		<a href="/product/productD?product_id=${vo.product_id}">
	      			<img src="${path }/img/${vo.product_url }" class="product-img1">
	      		</a>
	      		<div>
	      			<a href="/product/productD?product_id=${vo.product_id}">
		      			${vo.product_name }
	      			</a>
	      		</div>
	      		<div>
	      			<font style="font-weight: bold;">
			        	<fmt:formatNumber value="${vo.product_price }" pattern="###,###,###원"/>
		            </font>
		        </div>
	      	</div>
      	</c:forEach>

      </div>	<!-- class = "productA" 닫힘 -->	
      
      <br/><br/><br/>
      
      <div style="padding-top: 105%;"></div>
      
      <h3 id="box3">용품</h3>
      <div class="productA">
      
		<%-- service.getList()를 model.addAttribute으로 list에 담음 --%>
      	<c:forEach var="vo" items="${list }" begin="45" end="61">
	      	<div class="menuListBox">
	      		<a href="/product/productD?product_id=${vo.product_id}">
	      			<img src="${path }/img/${vo.product_url }" class="product-img1">
	      		</a>
	      		<div>
	      			<a href="/product/productD?product_id=${vo.product_id}">
		      			${vo.product_name }
	      			</a>
	      		</div>
	      		<div>
	      			<font style="font-weight: bold;">
			        	<fmt:formatNumber value="${vo.product_price }" pattern="###,###,###원"/>
		            </font>
		        </div>
	      	</div>
      	</c:forEach>

      </div>	<!-- class = "productA" 닫힘 -->	
      
      
      <br/><br/><h3 style="padding-top: 164%; padding-left: 30%;">더 많은 상품을 준비중입니다.</h3><br/>
      
      
  	</div>	<!-- class="container" 닫힘 -->

	<a href="/product/list"><div class="banner3"></div></a>

<!-- ------------------------하단바 시작---------------------------------- -->
    
   <hr style="clear: both;"/>
   <div class="footer">
      <div class="footer1" style="float: left;">
         <h3>COMPANY INFO</h3>
         (주) smilepaws<br/>
         대표 아무개<br/>
         사업자등록번호 220-96-11277<br/>
         통신판매업신고번호 제2022-서울금천-8520호<br/>
         주소 서울특별시 구로구 시흥대로163길 33 주호타워 2층
      </div>
      <div class="footer2" style="float: left;">
         <h3>CUSTOMER CENTER</h3>
         <h1 style="color: #3498db;">1588-8324</h1>
         Open : AM 10:00 ~ PM 05:00<br/>
         Lunch : PM 12:00 ~ PM 1:00<br/>
         이메일 smilepaws@smilepaws.com
      </div>
   </div>   
   
   

</body>
</html>