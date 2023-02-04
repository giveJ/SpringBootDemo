<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		top: 200px;
		left: 45px;
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
		margin-left: 18%;
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
/* 		width: 240px;
		height: 220px; */
		/* width: 100%;
  		height: 50%; */
		width: 300px;
		height: 300px;
		padding-bottom: 10px;
		padding-right: 10px;	/* 보류 */
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
</head>

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

</script>

<body link="black" vlink="black" alink="#3498db">

<!-- ------------------------상단바 시작---------------------------------- -->
   <div class="menu"> 
   
      <div class="logo_menu">
           <img src="../resources/img/smilepaws_logo2.png" width="140px" height="80px" >
      </div>
      
      <form name='homeForm' method="post" action="/member/login">
      <div class="middle_menu">
         <ul class="middle_m">
            <li><a href="/product/main">Home</a></li>
            <li><a href="/HS_care/careInfo">돌봄</a></li>
            <li><a href="/product/list">용품</a></li>
            <li class="dropdown">
               <a href="#">클래스</a>
                  <div class="droptn-content" onmouseover="this.style.opacity='0.9'">
                     <a href="/main/class_list?fileType=1">클래스 바로가기</a>
                     <a href="/main/my_page">myPage</a>
                  </div>
            </li>
            <li><a href="/JJ_comBoard/list">커뮤니티</a></li>
            <li><a href="/HJ_family/HJ_list?pageNum=1&amount=20">가족찾기</a></li>
            <li class="dropdown">
               <a href="#" class="droptn">고객센터</a>
                  <div class="droptn-content" onmouseover="this.style.opacity='0.9'">
                     <a href="/JJ_notice/list">공지사항</a>
                     <a href="/JJ_qnaBoard/list">문의사항</a>
                  </div>
            </li>
            <li style="width: 100px;">&nbsp;</li>
            <li>
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
            <li><a href="${path}/cart/list.do"><img src="../resources/img/main2.png" width="37px" height="35px"></a></li>
         </ul>
      </div>
      </form>
   </div> <!-- 상단바 end -->
  
   <!-- <hr/> --><!-- 라인 확인 용, 작업 끝나고 주석처리하기 -->
   

