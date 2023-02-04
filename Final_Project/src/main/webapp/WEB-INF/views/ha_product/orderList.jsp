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
		width: 52%;
	    height: 100%;
	    text-align-last: end;
	    float: left;
	    padding-top: 2%;
	}
   .right_menu{
   		 padding-left: 1256px;
   }
   
   .middle_m{
      list-style-type: none;
      display: inline-block;
      overflow: hidden;
     /*  position: absolute; */
      /* padding-left: 406px; */
      padding-left: 336px;
   }
   .middle_m_li > li {
      float: left;
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
      float: none;
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
      /* float: left; */
   }
   
   
    /* ----------------로그인박스------------------------- */
   
   
   .login-box{
         border: 1px solid #c0dff4;
         padding: 20px;
   }
   
   
   .login-box-btn{
         color : white;
      background-color: #c0dff4;
      padding: 5px;
      border: none;
      text-align: left;
   }
   
    .login-box-btn:hover {
         color : white;
      background-color: #c0dff4;
      padding: 5px;
      border: none;
      text-align: left;
      cursor: pointer;
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
		top: 300px;
		left: 47px;
		background-image: url("../resources/img/smilepaws_banner_size.png");
		background-repeat: no-repeat;
	}
	.banner3{
		width: 200px;
		height: 710px;
		position: fixed;
		top: 300px;
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
   
   /* 주문구분 시작 ------------------------------------- */
   ul {
	  display: block;
	  list-style-type: disc;
	  margin-block-start: 1em;
	  margin-block-end: 1em;
	  margin-inline-start: 0px;
	  margin-inline-end: 0px;
	  padding-inline-start: 40px;
	}
	
	input[type='text'], input[type='password'], input[type='tel'], input[type='email'] {
	    display: block;
	    width: 100%;
	    height: 50px;
	    line-height: 50px;
	    border: 1px solid #ddd;
	    font-size: 14px;
	}
	
	div, p, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, table, th, td, form, legend, input, textarea, select, pre, menu, button {
	    /* font-size: 13px;
	    line-height: 1.4; */
	}
	
	ul>li {
	    /* 
	    display: flex; 
	    align-items: center;
	    */
	    padding: 10px
	}
	input {
	    display: block;
	    margin: 0;
	    padding: 0 10px;
	    border: 0 none;
	    box-sizing: border-box;
	    color: #4A4A4A;
	}
	textarea {
	    display: block;
	    margin: 0;
	    padding: 10px;
	    width: 100%;
	    border: 1px solid #ddd;
	    background: none;
	    color: #4A4A4A;
	    font-size: 14px;
	    line-height: 20px;
	    box-sizing: border-box;
	    background: #fff;
	}
	.form__content--add .btn {
	    width: 80px;
	    height: 49px;
	    line-height: 40px;
	    margin-left: 5px;
	}
	.btn--point-border {
	    color: #FF6C2B;
	    background: #fff;
	    border: 1px solid #FF6C2B;
	}
	.btn {
	    display: block;
	    font-size: 17px;
	    font-weight: 500;
	    text-align: center;
	    border-radius: 50px;
	    width: 100%;
	    height: 45px;
	    line-height: 40px;
	    background: #fff;
	}
	/* .form__content--add input.input_address {
	    width: calc(100% - 85px);
	} */
	#re_zip{
		width: 90%;
	    float: left;
	    margin-right: 15px;
	    margin-bottom: 10px;
	} 
	.form__content--add input:not(:first-of-type) {
    	margin-top: 10px;
	}
	
	
	
	
	/* 결제수단 -----------------------------css */
	
	
	.order.order-write-page section.box .payment__list {
	    justify-content: unset;
	}
	.order.order-write-page section.box .payment__list {
	    display: flex;
	    flex-wrap: wrap;
	    justify-content: space-between;
	}
	.order.order-write-page section.box .payment__item:nth-of-type(-n+3) {
	    margin-top: 0;
	}
	.order.order-write-page section.box .payment__item {
	    margin-right: 7.5px;
	}
	.order.order-write-page section.box .payment__item {
	    position: relative;
	    width: calc(33.33% - 5px);
	    margin-top: 13px;
	}
	.design-input label {
	    display: block;
	    padding-left: 32px;
	    color: #555;
	    font-size: 16px;
	    height: 24px;
	    line-height: 24px;
	}
	
	
	
	
	/* 청약의사 재확인 -----------------------------css */
	
	
	/* .design-input--check input:checked+label {
	    background: url(../img/checkbox.png) no-repeat 0 center;
	    background-size: 24px;
	} */
	
	#buy_use{
		height: 27px;
	    width: 21px;
	    float: left;
	}
	/* .order .design-input.line2 label span.point {
	    color: #ff6c2b;
	} */
	.btn--point {
	    color: #0270ba;
	    background: #d7ecfa;
	    border: 0;
	    margin-top: 55px;
	}
	
	
	
	
   
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/util.js"></script>
<script type="text/javascript">

$(function(){
    
    var homeForm = $("homeForm");
    
    
    // 로그인 버튼
    $("#login").on("click", function(){
       
       if($("#userId").val()==""){
          alert("아이디를 입력해주세요.");
          $("#userId").focus();
          return false;
       }
       
       if($("#userPw").val()==""){
          alert("비밀번호를 입력해주세요.");
          $("#userId").focus();
          return false;
       }
       
       homeForm.submit();
    });
    
    
    // 로그아웃 버튼
    $("#logoutBtn").on("click", function(){
       location.href="member/logout";
    });
    
    // 회원가입 버튼
    $("#join").on("click", function(){
       location.href="member/register";
    });
    
 });

/* ---------------------------------------- 로그인박스 영역 끝 */


	$(document).ready(function() {
	
		
		$("#fromBtn").on("click", function(){
	    
			var name = document.getElementById('order_to_name').value; 
			var tel =  document.getElementById('order_to_tel').value; 
			var email =  document.getElementById('order_to_email').value; 
			var post =  document.getElementById('order_to_post').value; 
			var adr =  document.getElementById('order_to_adr').value; 
		
			$("#order_from_name").val(name);
			$("#order_from_tel").val(tel);
			$("#order_from_email").val(email);
			$("#order_from_post").val(post);
			$("#order_from_adr").val(adr);
	
			
		});
		
		total();
	});

	
	
	function total() {
		console.log("total실행됨");
		var coupon = document.getElementById("order_coupon");
		var point = document.getElementById("order_point");
		
		var totalPrice = ${totalPrice};

		var order_coupon = coupon.options[coupon.selectedIndex].value;
		var order_coupon_name = coupon.options[coupon.selectedIndex].text;
		var order_point = point.value;
		var mem_point = ${member.MEM_POINT};
        var payment = 0;
		
		if(parseInt(mem_point) < parseInt(order_point)){
			$("#order_point").val(0);
			return false;
		}
		var discount = (parseInt(totalPrice) * (parseInt(order_coupon) * 0.01))

		payment = parseInt(totalPrice) - discount;
		payment = payment - parseInt(order_point) +2500;

		var sum = new Intl.NumberFormat('ko-KR', {
			style : 'currency',
			currency : 'KRW'
		}).format(payment);
		
		var discountSum = new Intl.NumberFormat('ko-KR', {
			style : 'currency',
			currency : 'KRW'
		}).format(discount);
		
		$("#payment").html(sum);
		$("#discount").html(discountSum);
		$("#order_cpn_name").val(order_coupon_name);
		$("#ordered_cpn_disc").val(parseInt(discount));
		$("#ordered_orderprice").val(parseInt(payment));
		
		

	}
	
	function orderBtn(){
		
		var email_rule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var tel_rule = /^\d{2,3}\d{3,4}\d{4}$/;

		if ($("#order_to_name").val() == null || $("#order_to_name").val() == "") {
			toastr.options.preventDuplicates = true;
			toastr.warning("구매자 명을 입력해주세요");
			$("#order_to_name").focus();

			return false;
		}

		if ($("#order_to_tel").val() == null || $("#order_to_tel").val() == "") {
			
			toastr.options.preventDuplicates = true;
			toastr.warning("구매자번호를 입력해주세요.");
			$("#order_to_tel").focus();

			return false;
		}

		if ($("#order_to_email").val() == null || $("#order_to_email").val() == "") {
			toastr.options.preventDuplicates = true;
			toastr.warning("구매자이메일을 입력해주세요.");
			$("#order_to_email").focus();

			return false;
		}

		if ($("#order_to_adr").val() == null || $("#order_to_adr").val() == "") {

			toastr.options.preventDuplicates = true;
			toastr.warning("구매자주소를 입력해주세요.");
			$("#order_to_adr").focus();

			return false;
		}

		if ($("#order_from_name").val() == null || $("#order_from_name").val() == "") {
			toastr.options.preventDuplicates = true;
			toastr.warning("수취인명을 입력해주세요.");
			$("#order_from_name").focus();

			return false;
		}

		if ($("#order_from_tel").val() == null || $("#order_from_tel").val() == "") {
			toastr.options.preventDuplicates = true;
			toastr.warning("수취인번호를 입력해주세요.");
			$("#order_from_tel").focus();

			return false;
		}


		if ($("#order_from_adr").val() == null || $("#order_from_adr").val() == "") {
			toastr.options.preventDuplicates = true;
			toastr.warning("수취인 주소를 입력해주세요.");
			$("#order_from_adr").focus();

			return false;
		}

		if ($("#order_from_post").val() == null || $("#order_from_post").val() == "") {
			toastr.options.preventDuplicates = true;
			toastr.warning("수취인 우편번호를 입력해주세요.");
			$("#order_from_post").focus();

			return false;
		}

		if ($("#order_to_post").val() == null || $("#order_to_post").val() == "") {
			toastr.options.preventDuplicates = true;
			toastr.warning("구매자 우편번호를 입력해주세요.");
			$("#order_to_post").focus();

			return false;
		}
		iamport();
	}
	
	
	function iamport(){
		
		var name = document.getElementById('order_to_name').value; 
		var tel =  document.getElementById('order_to_tel').value; 
		var email =  document.getElementById('order_to_email').value; 
		var post =  document.getElementById('order_to_post').value; 
		var adr =  document.getElementById('order_to_adr').value;  
		console.log("totalPay11=" + payment);
		
		IMP.init('----');
		IMP.request_pay({
		    pg : 'html5_inicis',
		    pay_method : 'card',
		    merchant_uid : new Date().getTime() ,
		    name : 'Homme 결제' ,
		    amount : parseInt(payment), 
		    buyer_email : email,
		    buyer_name : name,
		    buyer_tel : tel,
		    buyer_addr : adr,
		    buyer_postcode : post
		}, function(rsp) {
			console.log(rsp);
		    if ( rsp.success ) {
		    	var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
				
				$("#merchant_uid").val(parseInt(rsp.merchant_uid));

		        orderInsert();
		    } else {
		    	 var msg = '결제에 실패하였습니다.';
		         msg += '//' + rsp.error_msg;
		    }
		    alert(msg);
		});
	}
	
	function orderInsert(){
		
		var formObj = $("form[name='orderForm']");


			formObj.attr("action", "/main/orderInsert");
			formObj.attr("method", "post");
			formObj.submit();
		
	}
	

</script>
</head>

<body link="black" vlink="black" alink="#3498db">

<!-- ------------------------상단바 시작---------------------------------- -->
   <div class="menu"> 
   
	   <div class="logo_menu">
		     <img src="../resources/img/smilepaws_logo2.png" width="160px" height="90px" >
	   </div>
	   
	   <form name='homeForm' method="post" action="/member/login">
<%-- 	   <div class="right_menu">
     	<ul>       
            <li style="float: left;">
                  <c:if test="${member == null}">
                        <div class="login-box">
                        <label for="userId"></label>
                        <input type="text" id="userId" name="user_id" placeholder="아이디">
                        <label for="userPw"></label>
                        <input type="password" id="userPw" name="user_pw" placeholder="비밀번호">
                        <button type="submit" id="login" class="login-box-btn">로그인</button>
                        <button type="button" id="join" class="login-box-btn">회원가입</button>
                  </div>   
               </c:if>
               <c:if test="${member!= null }">
                  <div class="login-box">
                     ${member.user_id}님 환영 합니다.
                     <button id="logoutBtn" type="button" class="login-box-btn">로그아웃</button>
                  </div>
               </c:if>
               <c:if test="${msg == false}">
                  <p style="color: red;">로그인 실패! 아이디와 비밀번호를 확인해주세요.</p>
               </c:if>
            </li> 
            <li style="float: left;"><a href="${path}/cart/list.do"><img src="../resources/img/main2.png" width="37px" height="35px"></a></li>
         </ul>
      </div> --%>
	   
      <div class="middle_menu">
         <ul class="middle_m">
            <li style="float: left;"><a href="/product/main">Home</a></li>
            <li style="float: left;"><a href="/HS_care/careInfo">돌봄</a></li>
            <li style="float: left;"><a href="/product/list">용품</a></li>
            <li class="dropdown" style="float: left;">
               <a href="#">클래스</a>
                  <div class="droptn-content" onmouseover="this.style.opacity='0.9'">
                     <a href="/main/class_list?fileType=1">클래스 바로가기</a>
                     <a href="/main/my_page">myPage</a>
                  </div>
            </li>
            <li style="float: left;"><a href="/JJ_comBoard/list">커뮤니티</a></li>
            <li style="float: left;"><a href="/HJ_family/HJ_list?pageNum=1&amount=20">가족찾기</a></li>
            <li class="dropdown" style="float: left;">
               <a href="#" class="droptn">고객센터</a>
                  <div class="droptn-content" onmouseover="this.style.opacity='0.9'">
                     <a href="/JJ_notice/list">공지사항</a>
                     <a href="/JJ_qnaBoard/list">문의사항</a>
                  </div>
            </li>
            <!-- <li style="width: 100px; float: left;">&nbsp;</li> -->
            <li style="float: left;"><a href="#"><img src="../resources/img/login.png" width="37px" height="35px"></a></li>
            <li style="float: left;"><a href="${path}/cart/list.do"><img src="../resources/img/main2.png" width="37px" height="35px"></a></li>
          </ul>   
     </div>
     
     
    
      </form>
   </div> <!-- 상단바 class="menu" end -->
   
   
   <hr/>
   
   
 <!-- ------------------------내용 시작---------------------------------- -->
    <a href="/product/list">
  	  <div class="banner1"></div>	<!-- class="banner1" 닫힘 -->
    </a>
   
	<div class="container">
	
	<br/><br/><br/>
	      
      <div class="productA">
      	<h2>주문정보</h2>
      	<h4 style="text-align: right;">01 장바구니 > <b style="color: #3498db">02 주문결제</b> > 03결제완료</h4>
      	<br/><hr/><br/><br/>
      	<form name="form1" class="form1" method="post" action="${path}/cart/update.do">
      		<div>
				<table cellpadding="0" cellspacing="0" border="0">
					<thead class="tbl-header">
						<tr>
							<th colspan="2" >상품정보</th>
							<th>판매가</th>
							<th>수량</th>
							<th>주문가</th>
						</tr>
					</thead>
					<tbody class="tbl-content">
					<c:forEach var="row" items="${map.list }" varStatus="i">
						<tr class="pro_img">
							<td>
					      		<img src="${path }/img/${row.product_url }" class="product-img2">
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
								${row.amount }
								<input type="hidden" name="product_id" value="${row.product_id }">
						    </td>
							<td>
								<fmt:formatNumber pattern="###,###,###원" value="${row.money }"/>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			
			</div> <!-- tbl-content 클래스 닫힘 -->
			
			<br/>
			
			<div style="text-align: center; padding: 10px;">
				주문상품 <b><fmt:formatNumber pattern="###,###,###원" value="${map.sumMoney }"/></b>
				<span style="color: #d7ecfa;">&nbsp;&nbsp;|&nbsp;&nbsp;</span> 
				배송비 ${map.fee } 
				<span style="color: #d7ecfa;">&nbsp;&nbsp;|&nbsp;&nbsp;</span> 
				최종 결제 금액 
				<span style="color: #ff6c2b;; font-size: 1.8rem; font-family: HGHaeDotum,sans-serif;">
				   	<fmt:formatNumber pattern="###,###,###원" value="${map.allSum }"/>
			    </span>
				<!-- <a href="/cart/orderView"><b style="color: #0270ba; font-size: 1.8rem; background-color: #d7ecfa;">구매하기</b></a> -->
				<!-- 
				<br/><br/><br/>
				<div style="padding-left: 44%">
					<div style="text-align: center; padding: 2%; width: 110px; background-color: #d7ecfa; border-radius: 4px;">
						<a href="#"><b style="color: #0270ba;">결제하기</b></a>
					</div>	
				</div>	 -->			
			</div>
			<br/><br/>
			
<!-- ---------------------------------------------주문 고객 정보 입력란 -->			
			
			<header id="header">
			    <div class="titleArea">
			        <h3>주문고객</h3><br/><hr/>
			    </div>
			</header>
			
			<section class="join-form join-form--necessary">
				<ul>
	                <li>
	                    <div class="form__tit form__tit--necessary">
	                        <label for="or_name">주문자</label>
	                    </div>
	                    <div class="form__content">
	                        <input type="text" id="or_name" name="or_name" value="" title="" placeholder="이름을 입력해주세요.">
	                    </div>
	                </li>
	                
	                <li>
	                    <div class="form__tit">
	                        <label for="or_tel">전화번호</label>
	                    </div>
	                    <div class="form__content">
	                        <input type="text" id="or_tel" name="or_tel" value="" title="" class="numeric" placeholder="'-' 제외한 숫자만 입력해주세요.">
	                    </div>
	                </li>
	
	                <li>
	                    <div class="form__tit form__tit--necessary">
	                        <label for="or_hp">휴대폰번호</label>
	                    </div>
	                    <div class="form__content form__content--sub_check">
	                        <input type="text" id="or_hp" name="or_hp" value="" title="" class="numeric" placeholder="'-' 제외한 숫자만 입력해주세요.">
	                    </div>
	                </li>
	
	                <li>
	                    <div class="form__tit form__tit--necessary">
	                        <label for="or_email">이메일</label>
	                    </div>
	                    <div class="form__content form__content--sub_check">
	                        <input type="text" id="or_email" name="or_email" value="" title="" placeholder="이메일을 입력해주세요.">
	                    </div>
	                </li>
	
	    			<input type="hidden" id="or_zip" value="">
	    			<input type="hidden" id="or_addr1" value="">
	    			<input type="hidden" id="or_addr2" value="">
	
	            </ul>
			</section>
			
			<input type="hidden" id="def_cust_nm" value="">
			<input type="hidden" id="def_home_zip" value="">
			<input type="hidden" id="def_home_addr1" value="">
			<input type="hidden" id="def_home_addr2" value="">
			<input type="hidden" id="def_tel" value="">
			<input type="hidden" id="def_hp" value="">
			<input type="hidden" id="def_delivery_msg" value="">
<!-- ---------------------------------------------배송 정보 입력란 -->			

			<header id="header">
			    <div class="titleArea">
			        <br/><br/><h3>배송정보</h3><br/><hr/>
			    </div>
			</header>
			
			<section class="join-form join-form--necessary">
                    <ul>
                        <li>
                            <div class="form__tit form__tit--necessary">
                                <label for="re_name">이름</label>
                            </div>
                            <div class="form__content">
                                <input type="text" id="re_name" name="re_name" value="" title="" placeholder="이름을 입력해주세요.">
                            </div>
                        </li>

                        <li class="align-top">
                            <div class="form__tit form__tit--necessary">
                                <label for="re_zip">주소</label>
                            </div>
                            <div class="form__content form__content--add">
                                <input type="text" id="re_zip" name="re_zip" value="" title="" class="numeric input_address" onclick="Address.Load('re')" readonly="readonly" placeholder="">
                                <button type="button" class="btn btn--point-border btn--add" onclick="Address.Load('re')">우편번호</button>
                                <input type="text" id="re_addr1" name="re_addr1" value="" title="" placeholder="기본주소" readonly="">
                                <input type="text" id="re_addr2" name="re_addr2" value="" title="" placeholder="나머지 주소(선택 입력 가능)">
                            </div>
                        </li>

                        <li>
                            <div class="form__tit">
                                <label for="re_tel">전화번호</label>
                            </div>
                            <div class="form__content">
                                <input type="text" id="re_tel" name="re_tel" value="" title="" class="numeric" placeholder="'-' 제외한 숫자만 입력해주세요.">
                            </div>
                        </li>

                        <li>
                            <div class="form__tit form__tit--necessary">
                                <label for="re_hp">휴대폰번호</label>
                            </div>
                            <div class="form__content form__content--sub_check">
                                <input type="text" id="re_hp" name="re_hp" value="" title="" class="numeric" placeholder="'-' 제외한 숫자만 입력해주세요.">
                            </div>
                        </li>
                    </ul>

 					
                    <ul>
                        <li>
                            <div class="form__tit">
                                <label for="trans_memo">배송메모</label>
                            </div>
                            <div class="form__content">
                                <textarea id="trans_memo" name="trans_memo"></textarea>
                            </div>
                        </li>
                    </ul>
                </section>


<!-- ---------------------------------------------결제 수단 입력란 -->			

			<header id="header">
			    <div class="titleArea">
			        <br/><br/><h3>결제수단</h3><br/><hr/>
			    </div>
			</header>

			<!-- <section class="join-form join-form--necessary">
				<ul>
					<li>
				<div class="inner">
	            	<span class="ec-base-label"><input id="addr_paymethod0" name="addr_paymethod" fw-filter="isFill" fw-label="결제방식" fw-msg="" value="card" type="radio" checked="checked" autocomplete="off"><label for="addr_paymethod0">카드 결제</label></span>
					<span class="ec-base-label"><input id="addr_paymethod1" name="addr_paymethod" fw-filter="isFill" fw-label="결제방식" fw-msg="" value="kakaopay" type="radio" autocomplete="off"><label for="addr_paymethod1">카카오페이(간편결제) <a href="https://www.kakaopay.com" target="_blank"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_info2.gif" alt="info"></a></label></span>
					<span class="ec-base-label"><input id="addr_paymethod2" name="addr_paymethod" fw-filter="isFill" fw-label="결제방식" fw-msg="" value="payco" type="radio" autocomplete="off"><label for="addr_paymethod2">페이코(간편결제) <a href="http://www.payco.com/payco/guide.nhn" target="_blank"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_info2.gif" alt="info"></a></label></span>
					<span class="ec-base-label"><input id="addr_paymethod3" name="addr_paymethod" fw-filter="isFill" fw-label="결제방식" fw-msg="" value="cell" type="radio" autocomplete="off"><label for="addr_paymethod3">휴대폰 결제</label></span>                    
				</div>
					</li>
				</ul>
            </section> -->
	
			<section class="box">
		        <div class="payment">
		            <ul class="payment__list"><!-- 혜택있을 시 benefit class 추가 -->
		                <li class="payment__item credit">
		                    <div class="design-input design-input--radio">
		                        <input type="radio" name="otype_cd" id="otype_cd_20" value="20" title="신용카드" style="float: left; margin-top: 6px;">
		                        <label for="otype_cd_20" style="font-size: 17px;">카드결제</label>
		                    </div>
		                </li>
		                <li class="payment__item kakaopay benefit">
		                    <div class="design-input design-input--radio">
		                        <input type="radio" name="otype_cd" id="otype_cd_70" value="70" title="카카오페이" style="float: left; margin-top: 6px;">
		                        <label for="otype_cd_70" style="font-size: 17px;">카카오페이(간편결제)</label>
		                    </div>
			            </li>
		                <li class="payment__item kakaopay benefit">
		                    <div class="design-input design-input--radio">
		                        <input type="radio" name="otype_cd" id="otype_cd_90" value="90" title="토스페이" style="float: left; margin-top: 6px;">
		                        <label for="otype_cd_90" style="font-size: 17px;">토스페이(간편결제)</label>
		                    </div>
			            </li>
					</ul>
		        </div>
		    </section>


<!-- ----------------------------------------------------------동의 체크박스 -->

			<header id="header">
			    <div class="titleArea">
			        <br/><br/><h3>청약의사 재확인</h3><br/><hr/>
			    </div>
			</header>

			<section class="box reconfirm">
		        <article class="reconfirm__agree">
		            <div class="design-input design-input--check line2">
		                <input type="checkbox" id="buy_use" value="Y" title="" checked="">
		                <label for="buy_use">
		                    <span class="point" style="color: #ff6c2b;">(필수)</span>구매하실 상품의 결제정보를 확인하였으며, 구매진행에 동의합니다. 결제완료 후 수령지, 결제수단, 주문내용 변경은 어렵습니다. 변경 희망시 취소 후 재구매 부탁드립니다.
		                </label>
		            </div>
		        </article>
		
		        <div class="button-content">
		            <button type="button" class="btn btn--point" onclick="order.orderSubmit(); onCheckout();"><b>결제하기</b></button>
		        </div>
		    </section>

			

<!-- ---------------------------------------------입력란 끝 -->			
      
      </div>	<!-- class = "productA" 닫힘 -->	
      <br/><br/><br/>
      
      
      
      
      
      
  	</div>	<!-- class="container" 닫힘 -->

	
	<a href="/product/list"><div class="banner3"></div></a>
	

<%@ include file="../include/ha_footer.jsp" %>