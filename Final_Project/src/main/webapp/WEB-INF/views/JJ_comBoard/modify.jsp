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
		<h1>커뮤니티 수정</h1>
		
		<div class="line"></div>
			<br/><br/><br/>
		<div class="inner">
					<form action="/JJ_comBoard/modify" method="post" id="operForm">
						<input type="hidden" name="bno" value="${comBoard.bno}">
						<input type="hidden" name="regdate" value="${comBoard.regdate}">
						<input type="hidden" name="postType" value="${comBoard.postType}">
						
						<%-- <c:if test="${reply.rno eq null }">
							<input type="hidden" name="rno" value=0>
						</c:if>
						
						<input type="hidden" name="rno" value="${reply.rno }">
						 --%>
						
						
						<div class="postType">
							글 유형	<br/>
						<c:choose>
							<c:when test="${comBoard.postType eq 'qna'}">
								Q&A
							</c:when>
							<c:otherwise>
								라운지
							</c:otherwise>
						</c:choose>
							<br/><br/><br/>
						</div>
						<div class="secret">
						글 분야 선택<br/>
						<input type="radio" name="animalType" value="강아지">강아지
						<input type="radio" name="animalType" value="고양이">고양이
						<input type="radio" name="animalType" value="소동물">소동물
						<input type="radio" name="animalType" value="기타">기타
						</div><br/><br/>
						
						<div class="qna">
						작성자<br/>
						<input type="text" name="writer" value="${comBoard.writer}"><br/><br/>
						질문작성<br/>
					<input type="text" name="title" value="${comBoard.title }"><br/><br/>
					
					<!-- 첨부파일 -->
						<div>
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
						</div>
										
					
					<textarea rows="30px" cols="80px" name="content">${comBoard.content }</textarea><br/><br/>
					</div>
					<button class="regBtn" data-oper="modify">글 수정</button>
					<button class="reset" data-oper="remove">글 삭제</button>
					<button class="btn-success" data-oper="list">목록</button>
					
					<input type="hidden" name="pageNum" value="${cri.pageNum }">
					<input type="hidden" name="amount" value="${cri.amount }">
				<%-- <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
				 --%>
				</form>
			
		</div>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
		
		$(function(){
			
			
			// 첨부파일-------------------------
			

			var bnoValue = '${comBoard.bno}'
			var uploadResult = $(".uploadResult ul");
			
			$.ajax({
				url : '/JJ_getAttachList',
				type : 'get',
				data : {bno:bnoValue},
				contentType : 'application/json; charset=utf-8',
				success : function(arr){
					console.log(arr);
					
					var str = '' ;
					
					for(var i=0; i<arr.length; i++){
						var obj = arr[i];
						
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/"+
								obj.uuid + "_"+ obj.fileName);
						
						str += '<li data-path="'+obj.uploadPath+ '" data-uuid="'+ obj.uuid+ '" data-filename="'+obj.fileName+'">';
						str += '<a href="/download?fileName='+fileCallPath+'">';
						str += '<img src="/resources/img/board/attach.png" style="width:15px">' + obj.fileName;
						str += '</a>';
						str += '<span data-file="' + fileCallPath+ '"> [X] </span>';
						str += '</li>';
					}
					
					$(".uploadResult ul").html(str);
					
				}
			});	// 첨부파일 END----------------------------------------
			
			// 첨부파일 삭제 -------------------(리스트에서는 삭제됨. DB에서는 X : 예외가 너무 많아서 제외함)
			uploadResult.on("click","span",function(){
				var targetFile = $(this).data("file");
				
				// 파일 삭제할 경우 list에서 지워주기
				
				if(confirm("파일을 삭제하시겠습니까?")){
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
					
				}
				
				
			});
			
			

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
					str += '<img src="/resources/img/board/attach.png" style="width:15px">' + obj.fileName;
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
			
			
			
			
			// 버튼 클릭 이벤트-------------------------------------------------
			var operForm = $("#operForm");
			
			
			$("button").click(function(e){
				e.preventDefault();	// 기본 이벤트 삭제 (기능 정지)
				
				var oper = $(this).data("oper");
				
				if(oper == 'remove'){
					operForm.attr("action","/JJ_comBoard/remove");
					
					
				}else if(oper == 'list'){
					
					operForm.attr("action", "/JJ_comBoard/list");
					operForm.attr("method","get");
					
					/* 
					var pageNumTag = $("input[name=pageNum]").clone();	//객체 복사 : empty 로 내용 날려도 남아있음
					var amountTag = $("input[name=amount]").clone();
					
									
					operForm.empty();	//내부 비워주기 : url에 다 뜨기 때문에 form태그 안에 있는 내용 싹 다 날리는것
					
					// 수정 페이지에서 목록으로 이동하기 위함
					operForm.append(pageNumTag);
					operForm.append(amountTag); 
					
					*/
					
					
				}else if(oper == 'modify'){
					
					
					var formObj = $("form");
					
					var postType_value = $("input[name='postType']:radio:checked");
					var title_value = $("input[name='title']").val();
					var content_value = $("input[name='content']").val();
					var writer_value = $("input[name='writer']").val();
					var animalType_value = $("input[name='animalType']:radio:checked");
					
					
					
					
					if(animalType_value.length < 1 ){
						alert("글 분야를 선택해주세요.")
						return false;
					}
					
					
					if(title_value=='' || content_value==''|| writer_value==''){
						alert("제목,내용,작성자를 반드시 입력해주세요.")
						return false;
					}
					
					
					
					var str = "";
					$(".uploadResult ul li").each(function(i, obj){
						var jobj = $(obj)
						str += "<input type='hidden' name='attachList["+i+"].fileName' value='" + jobj.data("filename")+"'>";
						str += "<input type='hidden' name='attachList["+i+"].uuid' value='" + jobj.data("uuid")+"'>";
						str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='" + jobj.data("path")+"'>";
						str += "<input type='hidden' name='attachList["+i+"].fileType' value='" + jobj.data("type")+"'>";
						
					});
					
					operForm.append(str).submit();
					
					
				}
					
					
				 	operForm.submit();
			
		
			});
			
			
			
			
			
			
		});
		
	

</script>	
</body>
</html>
<%@ include file="../include/footer.jsp" %> 