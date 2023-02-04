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


<!-- ------------------------하단바 시작---------------------------------- -->
    
  
   <div class="footer">
   <hr/>
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
     <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
      integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
      crossorigin="anonymous"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js"
      integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk"
      crossorigin="anonymous"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"></script>   
   
</body>
</html>