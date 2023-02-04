<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>smile paws</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
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
   
   li a:hover{
      font-weight: bold;
      color:  #3498db;
   }
   
   .droptn-content{
      position: fixed;
      display: none;
      background-color: #d1edff;
   }
   
   hr{
	  	background-color: #d7ecfa;
	  	height:3px;
	  	border: 0px;
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
   
   .btn {
      padding: 15px;
      border: 1px;
   }
   
   .btn:hover {
      padding: 15px;
      border: 1px;
      cursor: pointer;
      color: white;
   }
   
   .card-title{
   	  font-weight: bold;
      font-size: xx-large;
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
			location.href="aMember/logout";
		});
		
		// 회원가입 버튼
		$("#join").on("click", function(){
			location.href="aMember/register";
		});
		
		// 마이페이지 버튼
		$("#myPageBtn").on("click", function(){
			location.href="aMember/myPage";
		});
		
		// 회원정보 수정 버튼
		$("#UpdateBtn").on("click", function(){
			location.href="aMember/update";
			
		});
		
	});

</script>


<body>

<!-- ------------------------상단바 시작---------------------------------- -->
   <div class="menu"> 
   
      <div class="logo_menu">
           <img src="resources/img/smilepaws_logo2.png" width="140px" height="80px" >
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
		            <%-- <li><a href="${path}/cart/list.do"><img src="../resources/img/main2.png" width="37px" height="35px"></a></li> --%>
		         </ul>
		      </div>
		      	 
		    <br/><br/>
      </form> 
   </div> <!-- 상단바 end -->
  
 <!--   <hr/>  -->
 <!-- ------------------------내용 시작---------------------------------- -->
   <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel" >
  <div class="carousel-indicators" >
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
  </div>
  <div class="carousel-inner" style="width: 100%; height: 500px; ">
    <div class="carousel-item active">
      <img src="../resources/img/main.jpg" width="100%" height="500px" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h4><spam style="color: black; background-color: white;"><돌봄></spam></h4>
      </div>
    </div>
    <div class="carousel-item" style="width:100%; height: 500px;">
      <img src="../resources/img/mainproduct1.jpg" width="100%" height="500px" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h4><spam style="color: black; background-color: white;"><용품></spam></h4>
      </div>
    </div>
    <div class="carousel-item" style="width:100%; height: 500px;">
      <img src="../resources/img/petclass1.jpg" width="100%" height="500px" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h4><spam style="color: black; background-color: white;"><클래스></spam></h4>
      </div>
    </div>
    <div class="carousel-item" style="width:100%; height: 500px;">
      <img src="../resources/img/petfamily1.jpg" width="100%" height="500px" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h4><spam style="color: black; background-color: white;"><가족찾기></spam></h4>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev btn-lg" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next btn-lg" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

   <br/>
   <br/>
   <br/>
   <br/>
<div class="service" style="width: 1000px; margin-left: 450px;">    
   <h4 id="ser">주요서비스 </h4>
   <br/>
<div class="row row-cols-1 row-cols-md-2 g-4">
  <div class="col">
    <div class="card">
      <img src="../resources/img/main5.jpg" class="card-img-top" alt="resources/img/main5.jpg">
      <div class="card-body">
        <h5 class="card-title">돌봄</h5>
        <p class="card-text">나와 내 반려동물을 위한 집으로 찾아오는 돌봄서비스!</p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card">
      <img src="../resources/img/main3.jpg" class="card-img-top" alt="resources/img/main3.jpg">
      <div class="card-body">
        <h5 class="card-title">반려동물 용품</h5>
        <p class="card-text">합리적인 비용으로 내 반려동물의 사료,용품,간식의 모든 것!</p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card">
      <img src="../resources/img/main6.jpg" class="card-img-top" alt="resources/img/과자사진.png">
      <div class="card-body">
        <h5 class="card-title">클래스</h5>
        <p class="card-text">나의 반려동물을 위해 내 손으로 직접 만드는 클래스 과정</p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card">
      <img src="../resources/img/main4.jpg" class="card-img-top" alt="resources/img/main3.jpg">
      <div class="card-body">
        <h5 class="card-title">가족찾기</h5>
        <p class="card-text">사지마세요. 입양하세요.</p>
      </div>
    </div>
  </div>
</div>                          
</div>   
   <br/>
   <br/>
   
   <div class="dol">
      <p id="tt">어떤 분들이 활동하나요?</p>
      반려동물을 사랑하는 마음은 물론, 반려동물 관련 자격증 또는<br/>
      전문 지식을 갖춘 분들이 smile paws 전문 펫시터로 활동하고 있습니다.
      <br/>
      <br/>
      <br/>
      <br/>
   </div>
   
   <div class="dol">
      <p class="tr">사랑스러운 아이들의 가족찾기에 동참해주세요</p>
      <a href="#"><img src="../resources/img/main3.jpg" width="700px" height="250px"></a>
      <br/>
      <br/>
      <br/>
      <br/>
   </div>  
    
<!-- ------------------------하단바 시작---------------------------------- -->
 
  <hr/>
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