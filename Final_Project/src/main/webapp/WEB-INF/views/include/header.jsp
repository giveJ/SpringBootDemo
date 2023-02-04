<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
            

        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>smile paws</title>

<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
   crossorigin="anonymous"> 
<link rel="icon" href="resources/img/favicon1.png">
<style type="text/css">

 /* ---------상단바 css------------------------------------- */
 
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
   
   hr{
	  	background-color: #d7ecfa;
	  	height:3px;
	  	border: 0px;
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
   
    .login-box-btn:hover{
   		color : white;
		background-color: #c0dff4;
		padding: 5px;
		border: none;
		text-align: left;
		cursor: pointer;
   }
   
   
    #join, #logoutBtn, #myPageBtn, #UpdateBtn{
   		color : white;
		background-color: #c0dff4;
		padding: 5px;
		border: none;
		text-align: left;
   }
   
   #join:hover, #logoutBtn:hover, #myPageBtn:hover,#UpdateBtn:hover  {
   		color : white;
		background-color: #c0dff4;
		padding: 5px;
		border: none;
		text-align: left;
		cursor: pointer;
   }
   
   
   
   
   
/* ---------내용 css------------------------------------- */
   
   .container{
        opacity: 0.6;
   }
      
   .menu1{
         position: absolute;
         top: 25%;
         left:30%;
         color: white;
         font-weight: bold;
         font-size: xx-large;
   }
   .menu2{
         position: absolute;
         top: 32%;
         left:30%;
         color: black;
         font-size: large;
   }
   
   .dol,.tr, .di{
         text-align: center;
   }
   
   .title{
         text-align: center;
         font-weight: bold;
         font-size: large;
   }
   
   .btn1{
         position: absolute;
         top: 47%;
         left:30%;
   }
   
   .btn2{
         position: absolute;
         top: 47%;
         left:40%;
   }
   
   #tt, #pt, .tr,#ser{
         font-weight: bold;
         font-size: xx-large;
   }
   
   .service{
         text-align: center;
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
			location.href="../aMember/logout";
		});
		
		// 회원가입 버튼
		$("#join").on("click", function(){
			location.href="../aMember/register";
		});
		
		// 마이페이지 버튼
		$("#myPageBtn").on("click", function(){
			location.href="../aMember/myPage";
		});
		
		// 회원정보 수정 버튼
		$("#UpdateBtn").on("click", function(){
			location.href="../aMember/update";
			
		});
		
	});

</script>


<body>

<!-- ------------------------상단바 시작---------------------------------- -->
   <div class="menu"> 
   
      <div class="logo_menu">
           <img src="../resources/img/smilepaws_logo2.png" width="140px" height="80px" >
      </div>
    <form name='homeForm' method="post" action="/aMember/login">
      <div class="middle_menu">
         <ul class="middle_m">
            <li><a href="/main">Home</a></li>
            <li class="dropdown">
               <a href="/HS_care/outputPst">돌봄</a>
               <div class="droptn-content" onmouseover="this.style.opacity='0.9'">
                  <a href="/HS_care/careBooking" >돌봄 예약</a>
		          <a href="/HS_care/careReply?pageNum=1&amount=10" >돌봄 후기</a>
		          <a href="/HS_care/careBookingView" >예약 현황</a>
                  </div>
            </li>
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
                     <a href="/JJ_notice/list?pageNum=1&amount=10">공지사항</a>
                     <a href="/JJ_qnaBoard/list?pageNum=1&amount=10">문의사항</a>
                  </div>
            </li>
             <li style="width: 100px;">&nbsp;</li>
		            <li>
		         		   <c:if test="${member == null}">
		         		   		<div class="login-box">
										<label for="userId"></label>
										<input type="text" id="userId" name="user_ID" placeholder="아이디">
										<label for="userPw"></label>
										<input type="password" id="userPw" name="user_PW" placeholder="비밀번호">
										<button type="submit" id="login" class="login-box-btn">로그인</button>
										<button type="button" id="join" class="login-box-btn">회원가입</button>
								</div>	
							</c:if>
							<c:if test="${member!= null }">
								<div class="login-box">
									${member.user_ID}님 환영 합니다.
									
									<button id="logoutBtn" type="button" class="login-box-btn">로그아웃</button>
									<button id="myPageBtn" type="button" class="login-box-btn">마이페이지</button>
									<button id="UpdateBtn" type="button" class="login-box-btn">회원정보 수정</button>
								</div>
							</c:if>
							<c:if test="${msg == false}">
								<p style="color: red;">로그인 실패! 아이디와 비밀번호를 확인해주세요.</p>
							</c:if>
		            </li> 
		          <%--  장바구니 <li><a href="${path}/cart/list.do"><img src="../resources/img/main2.png" width="37px" height="35px"></a></li> --%>
       			  </ul>
  			    </div>
  			    <br/><br/>
	   	</form>
   </div>
   
   <hr/> 
   