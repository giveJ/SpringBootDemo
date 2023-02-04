<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>smile paws</title>
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
   
   [type="button"] {
      padding: 15px;
      background-color: lightgray;
      border: 1px;
   }
   
   [type="button"]:hover {
      padding: 15px;
      background-color: gray;
      border: 1px;
      cursor: pointer;
      color: white;
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

<body>

<!-- ------------------------상단바 시작---------------------------------- -->
   <div class="menu"> 
   
      <div class="logo_menu">
           <img src="../resources/img/smilepaws_logo2.png" width="140px" height="80px" >
      </div>
      
      <div class="middle_menu">
         <ul class="middle_m">
            <li><a href="#">Home</a></li>
            <li><a href="#">돌봄</a></li>
            <li><a href="/project_smilepaws/board/list.jsp">용품</a></li>
            <li class="dropdown">
            	<a href="#">클래스</a>
            		<div class="droptn-content" onmouseover="this.style.opacity='0.9'">
            			<a href="/main/class_list?fileType=1">클래스 바로가기</a>
            			<a href= "/main/my_page">my_page</a>
            		</div>
            </li>
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
               <li><a href="#"><img src="../resources/img/main2.png" width="37px" height="35px"></a></li>
           </ul>  
       </div>
   
   </div>
   
   <!-- <hr/> --><!-- 라인 확인 용, 작업 끝나고 주석처리하기 -->
   
 <!-- ------------------------내용 시작---------------------------------- -->
   
   <div class="container">
      <img src="../resources/img/main.jpg" width="100%" height="900px">
   </div>
   
   <div class="menu1">
      반려동물 전문돌봄 서비스
   </div>
   
   <div class="menu2">
      국내 최대 강아지 고양이 전문돌봄 회사!<br/>
   smile paws는 반려동물을 전문적으로 돌보는<br/> 경력자들로 구성되어 있습니다.<br/>
   안심하고 맡기세요.
   </div>  
   
   <div class="btn1">
      <input type="button" value="돌봄 서비스 안내">
   </div>
    <div class="btn2">
      <input type="button" value="서비스 에약">
   </div>
   
   <br/>
   <br/>
   <br/>
   <br/>
   
      <div class="service">
   <h4 id="ser">주요서비스 </h4>
            <img src="../resources/img/main3.jpg" width="650px" height="450px" >
            <img src="../resources/img/main4.jpg" width="650px" height="450px" > <br/>
  <pre>돌봄서비스                                        반려동물 용품</pre> <br/>
            <img src="../resources/img/main3.jpg" width="650px" height="450px" >
            <img src="../resources/img/main4.jpg" width="650px" height="450px" > <br/>
   <pre>쿠킹클래스                                        가족찾기</pre>
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