<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<style type="text/css">
			
	.container1{
		margin-left: 15%;
		color: black;
	}
	
	.line {
		border: 4px solid #c0dff4;
		width: 80%;
		margin-right: 10%
		}
		
		
	.regBtn, .reset, .btn-success{
		color : white;
		background-color: #c0dff4;
		padding: 5px;
		border: none;
		text-align: left;
		}
	
	
	[type="text"]{
		width: 580px;
		height: 30px;
	}
	
	.inner{
		margin-left: 200px;
	}
			
</style>
<body>
	<div class="container1">
		<h1>커뮤니티 등록</h1>
		
		<div class="line"></div>
			<br/><br/><br/>
		<div class="inner">
					<form action="/JJ_comBoard/insert" method="post" role="form">
						<div class="postType">
						글 유형 선택<br/>
						<input type="radio" name="postType" value="qna">Q&A
						<input type="radio" name="postType" value="lounge">일상
						<br/><br/><br/>
						</div>
						<div class="animalType">
						글 분야 선택<br/>
						<input type="radio" name="animalType" value="강아지">강아지
						<input type="radio" name="animalType" value="고양이">고양이
						<input type="radio" name="animalType" value="소동물">소동물
						<input type="radio" name="animalType" value="기타">기타
						
						</div><br/><br/>
						
						<div class="qna">
						작성자<br/>
						<input type="text" name="writer" value="${member.user_ID}" readonly="readonly"><br/><br/>
						글 작성<br/>
					<input type="text" placeholder="제목을 입력해주세요." name="title"><br/><br/>
					
					 <!---------------- 첨부파일 ------------------------>
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">파일 첨부</div>
									<div class="panel-body">
										<input type="file" name="uploadFile" multiple="multiple">
									</div>
									
									<div class="uploadResult">
										<ul></ul>
									</div>
							</div>
						</div>
					</div>
					
					 <!---------------- 첨부파일 END ----------------->
					
					<textarea rows="30px" cols="80px" placeholder="5자 이상의 내용을 입력해주세요." name="content"></textarea><br/><br/>
					
					
					</div>
					<button class="regBtn" data-oper="register">전송</button>
					<button class="reset" data-oper="reset">취소</button>
					<button class="btn-success" data-oper="list">목록으로 이동 </button>
					<input type="hidden" name="pageNum" value="${cri.pageNum }">
					<input type="hidden" name="amount" value="${cri.amount }">
				
				</form>
			
		</div>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
		
		$(function(){
			
			var formObj = $("form");
			
			
			var amount = '${cri.amount}';
			var pageNum = '${cri.pageNum}'; 
			
			
			// 버튼 클릭 스크립트----------------------------------------------
			
			$("button").click(function(e){
				e.preventDefault();	// 기본 이벤트 삭제 (기능 정지)
				
				var oper = $(this).data("oper");
				
				
				var postType_value = $("input[name='postType']:radio:checked");
				var title_value = $("input[name='title']").val();
				var content_value = $("input[name='content']").val();
				var writer_value = $("input[name='writer']").val();
				var animalType_value = $("input[name='animalType']:radio:checked");
			
				
				if(oper == 'list'){
					location.href= '/JJ_comBoard/list?pageNum=' + pageNum + '&amount=' + amount;
					
				}else if(oper == 'reset'){
					formObj[0].reset();
				
				}else{
					
					
					var formObj = $("form");
					
					if(postType_value.length < 1){
						alert("글 유형을 선택해주세요.")
						return false;
					}
					
					if(animalType_value.length < 1 ){
						alert("글 분야를 선택해주세요.")
						return false;
					}
					
					
					if(title_value=='' || content_value==''|| writer_value==''){
						alert("제목,내용,작성자를 반드시 입력해주세요.")
						return false;
					}
					
					
				
					
					// 게시글 등록
					console.log("submit clicked");
					
					var str='';
					$(".uploadResult ul li").each(function(i,obj){
						
						var jobj = $(obj);
						str += '<input type="hidden" name="attachList['+i+'].fileName" value="'+jobj.data("filename")+'" >';
						str += '<input type="hidden" name="attachList['+i+'].uuid" value="'+jobj.data("uuid")+'" >';
						str += '<input type="hidden" name="attachList['+i+'].uploadPath" value="'+jobj.data("uploadPath")+'" >';
					
					})
					
					formObj.append(str);
					formObj.submit();
					
				}
				
			});	/* -----------버튼클릭 스크립트 END-------------- */
			
			
			
			// 파일 업로드 스크립트---------------------------------------------
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880;		// 5MB
			
			function checkExtension(fileName, fileSize){
				
				if(fileSize >= maxSize){
					alert("파일 사이즈 초과");
					return false;
				}
				
				if(regex.test(fileName)){
					alert("해당 종류의 파일은 업로드 할 수 없습니다.");
					return false
				}
				
				return true;
				
			}	// end checkExtension();
			
			
			// 파일첨부 변경된 곳(챕터 7 복붙 후 수정)
			$("input[type='file']").change(function(){
				
				var formData = new FormData();	// 스크립트에서 Form 태그 생성
				var inputFile = $("input[name='uploadFile']");
				var files = inputFile[0].files;
				console.log(files);
				
				for(var i=0; i<files.length; i++){
					
					if(!checkExtension(files[i].name, files[i].size)){
						return false;
					}
					
					formData.append("uploadFile", files[i]);
				}
				
				
				$.ajax({
					url : '/JJ_uploadAjaxAction',
					processData : false,	
					contentType : false,
					data : formData,
					type : 'post',
					dataType : 'json',
					success : function(result){
						console.log(result);
						showUploadFile(result);
						
					}
				});
			});
			
			// 파일 업로드 후 업로드 된 파일 결과 화면에 보여주기
			var uploadResult = $(".uploadResult ul");
			function showUploadFile(uploadResultArr){
				
				var str = '' ;
				
				for(var i=0; i<uploadResultArr.length; i++){
					var obj = uploadResultArr[i];
					
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/"+
							obj.uuid + "_"+ obj.fileName);
					
					str += '<li data-path="'+obj.uploadPath+ '" data-uuid="'+ obj.uuid+ '" data-filename="'+obj.fileName+'">';
					// 게시글 작성페이지에서는 파일 다운로드 안되게 수정
					//str += '<a href="/download?fileName='+fileCallPath+'">';
					//str += fileCallPath;
					str += '<img src="/resources/img/board/attach.png" style="width:15px">' + obj.fileName;
					//str += '</a>';
					str += '<span data-file="' + fileCallPath+ '"> [X] </span>';
					str += '</li>';
				}
				
				uploadResult.html(str);
				
			}	// end showUploadFile();
			
			uploadResult.on("click","span",function(){
				var targetFile = $(this).data("file");
				
				// 파일 삭제할 경우 list에서 지워주기
				var targetLi = $(this).closest("li");
				
				$.ajax({
					url : "/JJ_deleteFile",
					data : {fileName : targetFile},
					type : "post",
					dataType: "text",
					success : function(result){
						//alert(result);
						targetLi.remove();
					}
				});
			});
			
			
			
			
		});	/*---------------- 스크립트 END ---------------*/
		
		
	
		

</script>	
</body>
</html>
<%@ include file="../include/footer.jsp" %> 