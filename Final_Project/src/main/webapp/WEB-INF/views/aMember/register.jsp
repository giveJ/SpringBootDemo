<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>회원가입</title>
</head>
<style>
	#container{
		width: 1000px;
		margin: 80px;
	}

	
	.container1 {
	margin-left: 15%;
	color: black;
	}


	.line {
		border: 4px solid #c0dff4;
		width: 80%;
		margin-right: 10%
	}
	
	
	.id_success{
		color: green;
		display: none;
	}
	
	.id_fail{
		color: red;
		display: none;
	}
	
	#postCode{
		border-radius: 25px;
		background-color: white;
		border: 1px solid #c63733;
		color: red;
		height: 40px;
		text-align: center;
		padding: 5px;
		margin-left: 20px;
	}
	
	#postCode:hover{
		cursor: pointer;
		background-color: #c63733;
		color: white;
	}
	
</style>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
	var idCk_result = false;
	
	$(document).ready(function(){
		
		
			// 취소
			$(".cencle").on("click", function(){
				location.href = "/main";
			})
			
			
			// 가입
			$("#submit").on("click", function(){
				
				
				if($("#user_ID").val()=="" ){
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}	
					
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				
				if($("#userEmail").val()==""){
					alert("이메일을 입력해주세요.");
					$("#userEmail").focus();
					return false;
				}
				
				if($("#userTel").val()==""){
					alert("전화번호를 입력해주세요.");
					$("#userTel").focus();
					return false;
				}
				
				if($("#sample6_address").val() == ""){
					alert("주소를 입력해주세요.");
					$("#sample6_address").focus();
					return false;
				}
				
				if($("#userAge").val()==""){
					alert("나이를 입력해주세요.");
					$("#userAge").focus();
					return false;
				}
				
				if(!idCk_result){
					alert("아이디를 확인해주세요");
					return false;
				}
				
				
				
				
				if($("#user_ID").val().length > 100){
					alert("아이디는 100자 미만입니다.");
					return false;
				}
				
				if($("#userPass").val().length > 50){
					alert("비밀번호는 50자 미만입니다.");
					return false;
				}
				
				if($("#userName").val().length > 20){
					alert("이름은 20자 미만입니다.");
					return false;
				}
				
				if($("#userEmail").val().length > 30){
					alert("이메일은 30자 미만입니다.");
					return false;
				}
				
				if($("#userTel").val().length > 50){
					alert("전화번호는 50자 미만입니다.");
					return false;
				}
				
				
				
				
				
				
				alert("회원가입이 완료되었습니다. 다시 로그인 해주세요.");
				
			}); // submit end--------------------------
		
			
			// 아이디 중복체크
		 	
			
			 $("#user_ID").on("propertychange change keyup paste input",function(){
				
				var user_ID =  $("#user_ID").val();
				var data = {user_ID : user_ID}
				
				
				$.ajax({
					url : "/aMember/idChk",
					type : "post", 
					data : data,
					success : function(result){
						//console.log("성공 여부 " + result);
						
						if(result == 'success'){
							$(".id_success").css("display","inline-block");
							$(".id_fail").css("display","none");
							idCk_result = true;
						}else{
							$(".id_fail").css("display","inline-block");
							$(".id_success").css("display","none");
							idCk_result = false;
						} 
					}
			 	}); //ajax End
			 });  // function End
	});	
	
	
	 function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	
	
	
	
		
</script>

<body>
	<div class="container1">
		<h1>회원가입</h1>
		<div class="line"></div>
		<br />
		<h5>입력하신 회원정보를 토대로 예약 신청을 받고 있으니 정확한 정보를 기재해 주세요.</h5>
	<section id="container">
			<form action="/aMember/register" method="post" id="regForm">
				<div>
					<label class="control-label" for="userId">아이디</label>
					<input class="form-control" type="text" id="user_ID" name="user_ID" />
					<span class="id_success">사용 가능한 아이디 입니다.</span>
					<span class="id_fail">이미 존재하는 아이디 입니다.</span>
				</div>	
				<div class="form-group has-feedback">
					<label class="control-label" for="userPass">비밀번호</label>
					<input class="form-control" type="password" id="userPass" name="user_PW" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userName">성명</label>
					<input class="form-control" type="text" id="userName" name="user_NAME" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userEmail">이메일</label>
					<input class="form-control" type="text" id="userEmail" name="user_EMAIL" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userName">전화번호</label>
					<input class="form-control" type="text" id="userTel" name="user_TEL" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userName">주소</label> <br/>
					<input type="text" id="sample6_postcode" placeholder="우편번호" class="form-control" readonly="readonly" style="width: 150px; float: left;" >
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="postCode" style="float: left;">
					<input type="text" id="sample6_address" placeholder="주소" class="form-control" readonly="readonly" name="user_ADDR"><br>
					
					<input type="hidden" id="sample6_detailAddress" placeholder="상세주소" class="form-control">
					<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="useAge">나이</label>
					<input class="form-control" type="text" id="userAge" name="user_age" />
				</div>
				<div class="form-group has-feedback">
					<input type="checkbox">이용약관, 개인정보 수집 및 보관에 대해 동의합니다.
				</div>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원가입</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
					<input type="hidden" name="bk_no" value="0">
					<input type="hidden" name="pet_num" value="0">
			</form>
		</section> 	
	</div>

</body>
</html>

<%@ include file="../include/footer.jsp"%>