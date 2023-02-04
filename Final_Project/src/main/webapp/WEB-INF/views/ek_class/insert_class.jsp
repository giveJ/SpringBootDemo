<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>project</title>
<style type="text/css">
   *{
      margin: 0;
      padding: 0;
   }
   form{
      padding-left: 300px;
      padding-bottom: 100px;
      padding-top: 100px;
   }
   
   .title{
      
      font-weight: bold;
      font-size: 300px;
      font-size: 20pt;
      display: block;
      
   }
   
   .subtitle{
   color: #1F283D;
    padding: 10px 20px;
    font-size: 18px;
    font-weight: 400;
   }
   
   /* .subtitle_p{
      display: block;
          margin-block-start: 1em;
         margin-block-end: 1em;
       margin-inline-start: 0px;
       margin-inline-end: 0px;
   } */
   
   .jss501{
   left: 0;
    width: 100%;
    bottom: 10px;
    height: 8px;
    opacity: 0.5;
    z-index: -1;
    position: relative;
    background-color: skyblue;
   }
   
   body{
      margin: 0;
          height: 100%;
       background: #fafafa;
       -webkit-font-smoothing: antialiased;
       -moz-osx-font-smoothing: grayscale;
   }
   
   .subtitle2{
      display: block;
          margin-block-start: 1em;
       margin-block-end: 1em;
       margin-inline-start: 0px;
       margin-inline-end: 0px;
   }
   
.flex-container {
  display: flex;
}

.wrapper {
  text-align: center;
  flex-grow: 1;
  
  .image-box {
    width: 200px;
    height: 200px;
    object-fit: cover;
    display: block;
    margin: 20px auto;
  }

  .upload-btn {
    border: 1px solid #ddd;
    padding: 6px 12px;
    display: inline-block;
    cursor: pointer;

    input[type=file] {
       display: none;
      }
   }
   
   .image-box{
      width: 50px;
      height: 80px;
   }
      
}
</style>
</head>
<body>
   <form action="/main/insert_class" method="post">
      <div>
         <div class="jss502">
               <h5 class="title">
                  제목 및 카테고리<div class="jss501"></div>
               </h5>
               &nbsp; &nbsp;&nbsp;
            </div>
         <div class="subtitle">
             <p class="subtitle_p">
                클래스/모임 제목과 카테고리를 등록해주세요
             </p>   
          </div>
         <div>
            <p class="subtitle2">
               연락처 인증 &nbsp;
               <input type="text" id="class_tel" name="class_tel">&nbsp; <!-- <button> 인증</button> -->
            </p>
         </div>
         <div>
            클래스명(필수) 최대 50자 <br/><br/><input type="text" name="class_name">
         </div>
         <br/><br/>
      </div>
      <br/><br/>
      <div>
         <div class="title">
            <div class="jss502">
               <h5 class="title">
                  이미지<div class="jss501"></div>
               </h5>
               &nbsp; &nbsp;&nbsp;
            </div>
         </div>
         <div class="subtitle">
            <p class="subtitle_p">
               클래스를 대표하는 이미지(썸네일)에 사용될 이미지를 등록해주세요
            </p>
         </div>
         <div>
            <div class="flex-container">
              <div class="wrapper">
                    <input type="file" accept="image/*" name="uploadFile" class="file1">
            </div>
            <div class="uploadResult1">
               <ul>
               </ul>
            </div>
         </div>
      </div>
         <br/><br/>
         <div class="subtitle">
            <p class="subtitle_p">
               클래스 이미지 (선택/최대 8개 등록 가능)<br/>
               *클래스 이미지가 많을수록 클래스 신청확률이 올라가요
               <br/>
            </p>
            <div class="flex-container">
              <div class="wrapper">
                    <input  type="file" accept="image/*" name="uploadFile" multiple="multiple" class="file2"/>
            </div>
            <div class="uploadResult2">
               <ul>
               </ul>
            </div>
         </div>
         </div>
      </div>
   
   <br />
   <hr />
   <br />
   
   <div>
      <div class="jss502">
               <h5 class="title">
                  상세 내용<div class="jss501"></div>
               </h5>
               &nbsp; &nbsp;&nbsp;
            </div>
      <div class="subtitle">
         <p class="subtitle_p">상세 내용을 작성해주세요</p>
      </div>
      <div>클래스 상세 내용(필수)</div>
      <div>
         <textarea rows="10" cols="50" name="class_intro">
            </textarea>
      </div>
   </div>
   
   <br />
   <hr />
   <br />
   
   
   <div>
      <div class="jss502">
               <h5 class="title">
                  커리큘럼(필수)<div class="jss501"></div>
               </h5>
               &nbsp; &nbsp;&nbsp;
            </div>
      <div class="subtitle">커리큘럼을 자유롭게 작성해주세요</div>
      <br/>
      <div>
         소요 시간 <input type="text" placeholder="소요시간을 입력해주세요" name="class_runtime">
      </div>
      <div>커리큘럼</div>
      <div>
         <textarea rows="10" cols="50" name="class_detail"></textarea>
      </div>
   </div>

   <br />
   <hr />
   <br />
   <div class="jss502">
               <h5 class="title">
                  강사 소개<div class="jss501"></div>
               </h5>
               &nbsp; &nbsp;&nbsp;
            </div>
   <div class="subtitle">
      호스트님을 소개해주세요
   </div>
   <div>
      강사님 사진 (필수) <input type="file" placeholder="사진 등록" class="file3" name="uploadFile">
   </div>
   <div class="uploadResult3">
               <ul>
               </ul>
            </div>
   <div>
   
   <br/>
      상호명 또는 닉네임(필수) 최대 15자 <input type="text" placeholder="닉네임을 입력해주세요" name="tutor_nickname">
   </div>
   <div>강사님 소개(필수) 최소 40자</div>
   <div>
      <textarea rows="10" cols="50" name="tutor_intro">
         소개글을 작성해주세요
         
      </textarea>
   </div>

   <br />
   <hr />
   <br />

   <div>
      <div class="jss502">
               <h5 class="title">
                  공간 정보<div class="jss501"></div>
               </h5>
               &nbsp; &nbsp;&nbsp;
            </div>
      <div class="subtitle">클래스 위치를 소개해주세요</div>
      <div>
         클래스 주소(필수) 
      </div>
      <div>
         <input id="member_post"  type="text" placeholder="도로명 검색" readonly="readonly">
           <input id="member_addr" type="text" placeholder="Address" readonly="readonly" name="class_loc"> <br>
           <input type="text" placeholder="Detailed Address" name="class_loc_detail"> 
      </div>
      <div>
            수업 타입 
            <select name="class_type" class="class_type">
               <option value="주말">주말반</option>
               <option value="평일">평일반</option>
            </select>
            <br/><br/>
         </div>
         
         
      <div class="day">
      </div>
      <!-- <div>
         운영시간 참고사항(선택) <br /> <input type="text" placeholder="수강생이 공간 운영시간과 관련해서 참고할 사항을 적어주세요" name="runtime_ps">
      </div> -->
   </div>
   <div>
      <div>
         태그 - 클래스 검색 키워드 <input type="text" name="keyword">
         <!-- <button>추가</button> -->
      </div>
   </div>

   <br />
   <hr />
   <br />

   <div>
   <div class="jss502">
               <h5 class="title">
                  클래스 금액(필수)<div class="jss501"></div>
               </h5>
               &nbsp; &nbsp;&nbsp;
            </div>
      <div class="subtitle">원데이 클래스 수강료를 등록해주세요</div>
      <div>
         1인 수강 금액 <br /> <input type="text" class="priceCount" name="class_price">원
      </div>
      <br/>
      <div>
         <table>
            <tr>
               <td>원천징수 세금(3.3%)</td>
               <td class="tax"></td>
            </tr>
            <tr>
               <td>카드사 수수료(2.53%)</td>
               <td  class="comition"></td>
            </tr>
            <tr>
               <td>
                  <input type="checkbox" name="check" value="check" id="check" checked="checked">플랫폼 수수료(7.5%)
               </td>
               <td class="platform">
               </td>
            </tr>
            <tr>
               <th class="countbtn"> 최종 정산 금액</th>
               <th class="total"></th>
            </tr>
         </table>
      </div>
      <br/>
      <!-- <div>
         클래스 결제 방식(필수)<br /> 
         <input type="radio" name="paymentWay" value="after">일정 선택 후 구매
         <input type="radio" name="paymentWay" value="before">구매 후 일정 조율
      </div> -->
      <br/>
      <div>
            <p>∙등록된 일정만 구매/신청 가능해요</p>
            <p>∙현재 클래스 일정을 등록하지 않더라도 수강생과 직접 일정 조율 후 추후 등록 가능해요</p>
      </div>
      <br/><br/>
      <!-- <div>
         <div>
            <select name="class_min">
               <option>최소 인원</option>
               <option value="1">1명</option>
               <option value="2">2명</option>
               <option value="3">3명</option>
               <option value="4">4명</option>
               <option value="5">5명</option>
               <option value="6">6명</option>
               <option value="7">7명</option>
               <option value="8">8명</option>
               <option value="9">9명</option>
               <option value="10">10명</option>
            </select>
            &nbsp; ~ &nbsp;
            <select name="class_max">
               <option>최대 인원</option>
               <option value="1">1명</option>
               <option value="2">2명</option>
               <option value="3">3명</option>
               <option value="4">4명</option>
               <option value="5">5명</option>
               <option value="6">6명</option>
               <option value="7">7명</option>
               <option value="8">8명</option>
               <option value="9">9명</option>
               <option value="10">10명</option>
               <option value="11">11명</option>
               <option value="12">12명</option>
               <option value="13">13명</option>
               <option value="14">14명</option>
               <option value="15">15명</option>
               <option value="16">16명</option>
               <option value="17">17명</option>
               <option value="18">18명</option>
               <option value="19">19명</option>
               <option value="20">20명</option>
            </select>
         </div>
      </div> -->
      <br/><br/><br/>
      
      <button class="insert_btn" data-oper="insert">insert</button>
      <button class="reset_btn" data-oper="reset">cancel</button>
   </div>
</form>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
   $(function() {
      var form = $("form");
      
      $("#member_post").on("click", function() {
         findAddr();
      });
      
      
      //주말/평일 선택시 시간 설정 이벤트----------------------------------------------------------------------------------------
      $(".class_type").change(function() {
         var type = $(".class_type").val();
         if(type == '주말'){
            $(".day").html('주말 : '+'<input type="time" class="class_open" name="class_start">'+'~' + '<input type="time" class="class_end" name="class_end">');
         }
         
         if(type=='평일'){
            $(".day").html('평일 : '+'<input type="time" class="class_open" name="class_start">'+'~' + '<input type="time" class="class_end" name="class_end">');
         }
      });
      
      
   //---------------------------------------------------------------------------------------------
      
      
      
      //button 이벤트---------------------------------------------------------------------------------------------
      var form = $("form");
   
      $("button").click(function(e) {
         e.preventDefault();
         
         var oper = $(this).data("oper");
         if(oper == 'reset'){
            form[0].reset();
         }else{
            console.log("SUBMIT!!-----------+");
            
            if(!$('input[name="class_tel"]').val()){
               alert("전화번호를 입력하세요");
               return false;
            }
            
            if(!$('input[name="class_name"]').val()){
               alert("클래스명을 입력하세요");
               return false;
            }
            
            
            console.log($('textarea[name="class_intro"]').val());
            if(!$('textarea[name="class_intro"]').val()){
               
               alert("클래스 설명을 입력하세요");
               return false;
            }
            
            if(!$("textarea[name='class_detail']").val()){
               alert("클래스 커리큘럼을 입력하세요");
               return false;
            }
            
            if(!$("input[name='class_runtime']").val()){
               alert("클래스명을 입력하세요");
               return false;
            }
            
            if(!$("input[name='tutor_nickname']").val()){
               alert("이용할 강사명을 입력하세요");
               return false;
            }
            
            if(!$("textarea[name='tutor_intro']").val()){
               alert("강사 설명을 입력하세요");
               return false;
            }
            
            if(!$("input[name='class_loc']").val()){
               alert("주소를 입력하세요");
               return false;
            }
             if(!$("input[name='class_loc_detail']").val()){
               alert("상세 주소를 입력하세요");
               return false;
            }
            if(!$("select[name='class_type']").val()){
               alert("주말 / 평일 시간을 입력하세요");
               return false;
            }
            
            if(!$("input[name='keyword']").val()){
               alert("검색 키워드를 입력하세요");
               return false;
            }
            
            if(!$("input[name='class_price']").val()){
               alert("가격을 입력하세요");
               return false;
            }
            if(!$('input[name="uploadFile"]').val()){
               alert("파일을 입력하세요")
               return false;
            }
            var str = "";
            var liCnt = 0;
            $(".uploadResult1 ul li").each(function(i, obj) {
               var jobj = $(obj);
               str += '<input type="hidden" name="classImageList['+liCnt+'].fileName" value="'+jobj.data("filename")+'">';
               str += '<input type="hidden" name="classImageList['+liCnt+'].uploadPath" value="'+jobj.data("path")+'">';
               str += '<input type="hidden" name="classImageList['+liCnt+'].uuid" value="'+jobj.data("uuid")+'">';
               str += '<input type="hidden" name="classImageList['+liCnt+'].fileType" value="1">';
               liCnt++;
            });
            
            $(".uploadResult2 ul li").each(function(j, obj) {
               var jobj = $(obj);
               str += '<input type="hidden" name="classImageList['+liCnt+'].fileName" value="'+jobj.data("filename")+'">';
               str += '<input type="hidden" name="classImageList['+liCnt+'].uploadPath" value="'+jobj.data("path")+'">';
               str += '<input type="hidden" name="classImageList['+liCnt+'].uuid" value="'+jobj.data("uuid")+'">';
               str += '<input type="hidden" name="classImageList['+liCnt+'].fileType" value="2">';
               liCnt++;
            });
            $(".uploadResult3 ul li").each(function(k, obj) {
               var jobj = $(obj);
               str += '<input type="hidden" name="classImageList['+liCnt+'].fileName" value="'+jobj.data("filename")+'">';
               str += '<input type="hidden" name="classImageList['+liCnt+'].uploadPath" value="'+jobj.data("path")+'">';
               str += '<input type="hidden" name="classImageList['+liCnt+'].uuid" value="'+jobj.data("uuid")+'">';
               str += '<input type="hidden" name="classImageList['+liCnt+'].fileType" value="3">';
               liCnt++;
            });
            form.append(str);
            form[0].submit();
         }
      });
      //-------------------------------------------------------------------------------------------------------
      

      
      //파일 업로드 script---------------------------------------------------------------------------------------
            var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); //표현식
            var maxSize = 5242880; //5MB

            //전송 전 확장자, 사이즈 체크
            function checkExtension(fileName, fileSize) {
               if (fileSize >= maxSize) {
                  alert("파일 사이즈 초과");
                  return false;
               }
               if (regex.test(fileName)) {
                  alert("해당 종류의 파일은 업로드하실수 없습니다");
                  return false;
               }
               return true;
            }//end checkExtension();

            $("input[type='file'][class='file1']").on("change", function() {

               var formData = new FormData(); //스크립트에서 Form태그 생성
               var inputFile1 = $("input[name='uploadFile'][class='file1']");

               var files1 = inputFile1[0].files;
               console.log(files1);

               for (var i = 0; i < files1.length; i++) {

                  if (!checkExtension(files1[i].name, files1[i].size)) {
                     return false;
                  }

                  formData.append("uploadFile", files1[i]);
               }

               $.ajax({
                  url : '/Ek_uploadAjaxAction',
                  processData : false,
                  contentType : false,
                  data : formData,
                  type : 'post',
                  success : function(result) {
                     console.log(result); //json사용하기 때문에 alert보다는 log로 찍는게 낫다
                      showUploadFile1(result)
                  },error : function(err){
                     alert(1)
                  }
               });
            });
            
            //파일 업로드 후 업로드 된 파일 결과 화면에 보여주기
            var uploadResult1 = $(".uploadResult1 ul");
            function showUploadFile1(uploadResultArr) {
               var str = '';
               
               for (var i = 0; i < uploadResultArr.length; i++) {
                  var obj = uploadResultArr[i];
                  
                  var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
                  
                  str += '<li data-path="'+obj.uploadPath+'" data-uuid="'+ obj.uuid +'" data-filename="'+obj.fileName+'">';
                  str += '<img src="/resources/img/attach.png" style="width:15px">'+ obj.fileName;
                  str += '<span data-file="'+ fileCallPath +'"> X </span>';
                  str += '</li>';
               }
               uploadResult1.append(str);
            }//end showUploadFile();
            
            
            //파일 삭제
            uploadResult1.on("click", "span", function() {
               var targetFile = $(this).data("file");
               var targetLi = $(this).closest("li");
               
               $.ajax({
                  url : "/Ek_deleteFile",
                  data : {fileName : targetFile},
                  type: "post",
                  dataType : "text",
                  success : function(result) {
                     //alert(result);
                     //파일 삭제시 화면에서도 삭제되게 하기
                     targetLi.remove();
                  }
                  
               });
               
               
            }); 
            
            
            $("input[type='file'][class='file2']").on("change", function() {

               var formData = new FormData(); //스크립트에서 Form태그 생성
               var inputFile2 = $("input[name='uploadFile'][class='file2']");

               var files2 = inputFile2[0].files;
               console.log(files2);

               for (var i = 0; i < files2.length; i++) {

                  if (!checkExtension(files2[i].name, files2[i].size)) {
                     return false;
                  }

                  formData.append("uploadFile", files2[i]);
               }

               $.ajax({
                  url : '/Ek_uploadAjaxAction',
                  processData : false,
                  contentType : false,
                  data : formData,
                  type : 'post',
                  success : function(result) {
                     console.log(result); //json사용하기 때문에 alert보다는 log로 찍는게 낫다
                      showUploadFile2(result)
                  },error : function(err){
                     alert(1)
                  }
               });
            });
            
            //파일 업로드 후 업로드 된 파일 결과 화면에 보여주기
            var uploadResult2 = $(".uploadResult2 ul");
            function showUploadFile2(uploadResultArr) {
               var str = '';
               
               for (var i = 0; i < uploadResultArr.length; i++) {
                  var obj = uploadResultArr[i];
                  
                  var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
                  
                  str += '<li data-path="'+obj.uploadPath+'" data-uuid="'+ obj.uuid +'" data-filename="'+obj.fileName+'">';
                  str += '<img src="/resources/img/attach.png" style="width:15px">'+ obj.fileName;
                  str += '<span data-file="'+ fileCallPath +'"> X </span>';
                  str += '</li>';
               }
               uploadResult2.append(str);
            }//end showUploadFile();
            
            
            //파일 삭제
            uploadResult2.on("click", "span", function() {
               var targetFile = $(this).data("file");
               var targetLi = $(this).closest("li");
               
               $.ajax({
                  url : "/Ek_deleteFile",
                  data : {fileName : targetFile},
                  type: "post",
                  dataType : "text",
                  success : function(result) {
                     //alert(result);
                     //파일 삭제시 화면에서도 삭제되게 하기
                     targetLi.remove();
                  }
                  
               });
               
               
            }); 
            
            
            
            
            $("input[type='file'][class='file3']").on("change", function() {

               var formData = new FormData(); //스크립트에서 Form태그 생성
               var inputFile3 = $("input[name='uploadFile'][class='file3']");

               var files3 = inputFile3[0].files;
               console.log(files3);

               for (var i = 0; i < files3.length; i++) {

                  if (!checkExtension(files3[i].name, files3[i].size)) {
                     return false;
                  }

                  formData.append("uploadFile", files3[i]);
               }

               $.ajax({
                  url : '/Ek_uploadAjaxAction',
                  processData : false,
                  contentType : false,
                  data : formData,
                  type : 'post',
                  success : function(result) {
                     console.log(result); //json사용하기 때문에 alert보다는 log로 찍는게 낫다
                     showUploadFile3(result);       
                  },error : function(err){
                     alert(1)
                  }
               });
            });
            
            //파일 업로드 후 업로드 된 파일 결과 화면에 보여주기
            var uploadResult3 = $(".uploadResult3 ul");
            function showUploadFile3(uploadResultArr) {
               var str = '';
               
               for (var i = 0; i < uploadResultArr.length; i++) {
                  var obj = uploadResultArr[i];
                  
                  var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
                  
                  str += '<li data-path="'+obj.uploadPath+'" data-uuid="'+ obj.uuid +'" data-filename="'+obj.fileName+'">';
                  str += '<img src="/resources/img/attach.png" style="width:15px">'+ obj.fileName;
                  str += '<span data-file="'+ fileCallPath +'"> X </span>';
                  str += '</li>';
               }
               uploadResult3.append(str);
            }//end showUploadFile();
            
            
            //파일 삭제
            uploadResult3.on("click", "span", function() {
               var targetFile = $(this).data("file");
               var targetLi = $(this).closest("li");
               
               $.ajax({
                  url : "/Ek_deleteFile",
                  data : {fileName : targetFile},
                  type: "post",
                  dataType : "text",
                  success : function(result) {
                     //alert(result);
                     //파일 삭제시 화면에서도 삭제되게 하기
                     targetLi.remove();
                  }
                  
               });
               
               
            }); 
            
            
      //--------------------------------------------------------------------------------
      //주소 검색--------------------------------------------------------------------------------------
      function findAddr(){
      new daum.Postcode({   
        oncomplete: function(data) {
           
           console.log(data);
           
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('member_post').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("member_addr").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("member_addr").value = jibunAddr;
            }
        }
    }).open();
      };
      
      //---------------------------------------------------------------------------------------------------
      
      //가격 계산 이벤트-----------------------------------------------------------------
      $(".priceCount").change(function() {
         var price = $(".priceCount").val();
         
         console.log(price);
         
         $(".tax").html(price * 0.033);
         $(".comition").html(price *0.0253 )
         
         var tax = $(".tax").html();
         var comition = $(".comition").html();
         var platform = $(".platform").html();
         
         if($('input[type=checkbox][name=check]').is("checked")){
               $(".platform").html(price * 0.075);
               $(".total").html(price - tax - comition - platform);
         }else{
               $(".platform").html(price*0);
               $(".total").html(price - tax - platform);
         }
         
         });
         
         
         
   //---------------------------------------------------------------------------------------
   });
            
   
      

      
</script>
</body>
</html>
<%@ include file="../include/footer.jsp"%>