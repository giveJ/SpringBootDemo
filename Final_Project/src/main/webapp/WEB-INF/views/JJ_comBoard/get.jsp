<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container1 {
	margin-left: 15%;
	color: black;
}

.line {
	border: 4px solid #c0dff4;
	width: 80%;
	margin-right: 10%
}

.notice_header {
	font-weight: lighter;
}

.notice_container {
	width: 60%;
	margin-left: 200px;
}

#listBtn {
	color: white;
	background-color: #c0dff4;
	padding: 5px;
	border: none;
	text-align: left;
	margin-left: 44%;
}

#listBtn2, #replyBtn{
	color: white;
	background-color: #c0dff4;
	padding: 5px;
	border: none;
	text-align: left;
	margin-left: 10px;
}

#category {
	color: black;
	padding: 10px;
	border: 1px solid skyblue;
	text-align: left;
	border-radius: 30px;
	background-color: white;
	
}

hr {
	color: gray;
}

h5, h6 {
	color: gray;
	font-weight: lighter;
	padding: 5px;
}

h5 {
	margin-bottom: 0;
}

h6 {
	margin-top: 0;
}

/* -----------------댓글----------- */
#replyList {
	list-style-type: none;
	float: none;
}

#replyBox{
	width: 900px;
	height: 80px;
}


		.modal {
            display: none;
            position: fixed; 
            z-index: 1; 
            left: 0;
            top: 0;
            width: 100%; 
            height: 100%; 
            overflow: auto; 
            background-color: rgb(0,0,0); 
            background-color: rgba(0,0,0,0.4); 
       		border-radius: 25px;
        }
    
       .modal-content {
            background-color: #fefefe;
            margin: 15% auto; 
            padding: 20px;
            border: 1px solid #888;
            width: 500px;
            height: 270px;                             
        	border-radius: 25px;
        }
        
        
        
   [type="button"]{
	color: white;
	background-color: #c0dff4;
	padding: 5px;
	border: none;
	text-align: left;
	margin-left: 10px;
}
		
</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/util.js"></script>
<script type="text/javascript">
	$(function(){
		
		// 댓글 등록하기
		var operForm = $("#operForm");
		var bnoValue = '${comBoard.bno}';
		var reply = $("input[name='reply']");
		var replyer = $("input[name='replyer']");
		
		showList();
		
		
		function add(reply, callback){
			console.log("reply......"); 
			console.log(reply.reply); 
			console.log(reply.bno); 
			console.log(reply.replyer); 
			
			$.ajax({
				type:'post',
				url : '/com_replies/new',
				data : JSON.stringify(reply),
				contentType : "application/json; charset=utf-8",
				success:function(result, status, xhr){
					alert("답변이 등록되었습니다.");
					showList();
					
				},
				error : function(xhr, status, er){
					alert("답변이 등록되지 않았습니다.");
				}
			});
		}
		
		
		
		
		// 댓글 조회하기
		
		var replyUL = $(".chat");
		
		function getList(param, callback, error){
			var bno = param.bno;
			
			$.ajax({
				type:'get',
				url : '/com_replies/pages/' + bno + '/1.json',
				success:function(result, status, xhr){
					if(callback){
						callback(result);
					}
				},
				
				error : function(xhr, status, er){
					if(error){
						error(er);
					}
				}
			});
		}
		
		
		// 댓글 조회
		
		function get(rno, callback, error){
			
			console.log("get reply..." + rno);
			
			
			$.ajax({
	   
			   	type : 'get',
			   	url : '/com_replies/' + rno + '.json',
			  
			   	success:function(result, status, xhr){
			   		if(callback){
			   			callback(result);
			   		}
			   	},
			   	
			   	error : function(xhr, status, er){
			   		if(error){
			   			error(er);
			   		}
			   	}
			   	
	  		 });	
		
		
		 }
		
		
		
		// 댓글 리스트 화면에 출력 (비동기방식)
		function showList(){
			getList({bno:bnoValue, page:1},
				function(result){
					var str = '';
				
					if(result == null || result.length==0){
						// 댓글이 없으면
						replyUL.html("");
						return;
					}else{
						// 댓글이 있으면
						for(var i=0; i<result.length; i++){
							str += '<li style="width: 300px;" id="replyList" data-rno="' + result[i].rno + '">';
							str += '<div>';
							str += '<p><b>'+result[i].replyer + '</b>&nbsp;&nbsp;&nbsp;'+displayTime(result[i].replydate)+ '</p>';
							str += '<p>'+  '<a id="modalBtn" style="width: 850px; text-align: left;">'+ result[i].reply+ '</a>'+'</p>'
							str += '</div>';									
							str += '</li>';									
						}
						replyUL.html(str);
					}
				}
			);
			
		}
		
		
		
		// 댓글 수정
		
		function update(reply, callback, error){
				
				console.log("update reply........" + reply.rno);
				
				
					$.ajax({
		   
				   	type : 'put',
				   	url : '/com_replies/'+ reply.rno,
				   	data : JSON.stringify(reply),
				   	contentType : "application/json; charset=utf-8",
				   	success:function(result, status,xhr){
				   		if(callback){
				   			callback(result);
				   		}
				   	},
				   	
				   	error : function(xhr, status, er){
				   		if(error){
				   			error(er);
				   		}
				   	}
				   	
		  		 });	
		
		};
		
		// 댓글 삭제
		
		function remove(rno, callback, error){
		
		$.ajax({
   
		   	type : 'delete',
		   	url : '/com_replies/' + rno,
		  
		   	success:function(result, status, xhr){
		   		if(callback){
		   			callback(result);
		   		}
		   	},
		   	
		   	error : function(xhr, status, er){
		   		if(error){
		   			error(er);
		   		}
		   	}
		   	
  		 });	
		
		
		}
		
		
		// 버튼 클릭 스크립트----------------------------------------------
		
		// 수정 버튼
		$("#listBtn2").click(function(){
			
			operForm.append('<input type="hidden" name="bno" value="'+${comBoard.bno }+'">');
			operForm.submit();
			
			});
		
		
		$("#listBtn").click(function(){
			operForm.attr("action", "/JJ_comBoard/list");
			operForm.submit();
		});
		
		
		
		
		 $("#replyBtn").on("click", function(e){
			 

			if(${empty member}){
				alert("댓글쓰기는 회원만 가능합니다.");
				e.preventDefault();	// 기본 href 경로 이동 방지
				location.href="../aMember/login";
				
			}else{
				
				if($("#replyBox").val() == ''){
					alert("내용을 입력해주세요");
					return false;
				}
				
				
				add(
					{reply: reply.val(), bno: bnoValue, replyer : replyer.val()}	
				);
			}
			 
			
		}); 
		
	 	
		
		
		
		// ----------------- 모달창 ------------------------------
		
		
		
		$(".chat").on("click", "li", function(e){
			e.preventDefault();
		 	// 1. rno 가져오기
			rno = $(this).attr('data-rno');
			
			
			get(rno, function(result){
				console.log(result);
				
				$('#modal').find("input[name='reply']").val(result.reply);
				$('#modal').find("input[name='replyer']").val(result.replyer);
				$('#modal').show(); 
					
			}); 
		});
		
		
		// 모달 창 닫기
		$("#close").on("click", function(){
			 $('#modal').hide();
		}); 
		
		
		// 모달 창 댓글내용 수정
		
		$("#update").on("click", function(){
			console.log("수정");
			update(
					{rno : rno,
					reply: $('#modal').find("input[name='reply']").val(),
					replyer: $('#modal').find("input[name='replyer']").val(),
					},
					
					function(result){
						
						if(result ==='success'){
							alert("업데이트 완료");
							
							// 수정 후 모달 창 숨겨주기
							 $('#modal').hide();
							// 수정된 리스트 보여주기
							showList();
						}
					
			
					});
			
		}); 
		
		
		
		
		// 모달창 댓글 삭제
		$("#delete").on("click", function(){
			
			remove(rno, function(result){
							
				if(result ==='success'){
					alert("삭제되었습니다.");
				}
				
				// 삭제 안됐을 경우에도 모달 창 숨겨주기
				 $('#modal').hide();
				// 수정된 리스트 보여주기
				showList();
				
			});
			
			
		});
		
		
		
		// 첨부 파일 스크립트 -------------------------------start
		
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
					str += '<a href="/JJ_download?fileName='+fileCallPath+'">';
					str += '<img src="/resources/img/board/attach.png" style="width:15px">' + obj.fileName;
					str += '</a>';
					//str += '<span data-file="' + fileCallPath+ '"> [X] </span>';
					str += '</li>';
				}
				
				$(".uploadResult ul").html(str);
				
			}
		});
		
		

		
		
			
	});	
	
	
</script>
<body>

	<div class="container1">
		<h1>커뮤니티</h1>
		<div class="line"></div>
		<br />
		<br />
		<br />
		<br />
		<br />

		<div class="notice_container">
			<button id="category" data-oper="list">
				<c:choose>
						<c:when test="${comBoard.animalType eq '강아지'}">
							<img src="../resources/img/board/dog.png" width="30px" height="30px">
						</c:when>
						<c:when test="${comBoard.animalType eq '고양이'}">
							<img src="../resources/img/board/cat.png" width="30px" height="30px">
						</c:when>
						<c:when test="${comBoard.animalType eq '소동물'}">
							<img src="../resources/img/board/small.png" width="30px" height="30px">
						</c:when>
						<c:otherwise>
							<img src="../resources/img/board/other.png" width="30px" height="30px">
						</c:otherwise>
					</c:choose>
				<c:out value="${comBoard.animalType}"></c:out>
			
			</button>
			<br /><br /><br />
			<div class="comBoard_title" style="font-size: 25px; font-weight: bold;" >${comBoard.title}</div>
			<hr />
			<br />
			<br />
			
			<!-- ----------------파일첨부------------------------------------------ -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">파일 첨부</div>
						<div class="uploadResult">
							<ul></ul>
						</div>
					</div>
				</div>
			</div>
			<!-- ---------------------------------------------------------------- -->	
		
			
			
			
			<div class="notice_content">${comBoard.content}</div>
			<br />
			<br />
			<br />
			<br />

			<div class="notice_header">
				<h5>${comBoard.writer}</h5>
				<h6>${comBoard.regdate}</h6>
			</div> 
			<hr />

			<div>
				<button id="listBtn" data-oper="list">목록보기</button>
				<button id="listBtn2" data-oper="update">수정</button>
			</div>

			<form action="/JJ_comBoard/modify" method="get" id="operForm">
			</form>

			<!--------------------------------댓글	------------------------------>
	
	
			<br />
			<br />
			<input type="hidden" name="replyer" placeholder="댓글 작성자" value="${member.user_ID}" readonly="readonly"><br/>
			<input type="text" name="reply" placeholder="댓글을 입력해주세요." id="replyBox"><br/><br/>
			<button id="replyBtn" data-oper="reply">입력</button>
			<br/>
			<br/>
			<br/> <b>댓글</b>
			<hr/>

			<form action="/com_replies/pages/{bno}/{page}" method="get">

				<ul class="chat">
				
				 
				
				<!-- 비동기 방식으로 사용하기 때문에 여기서는 작성 따로 안해도 됨
				위에 str 로 되어있음 -->
				
					<%--<li id="replyList" data-rno=${reply.rno }>
						<div>
							<input type="hidden" value="${reply.rno }">
							<input type="hidden" value="${reply.bno }">
						</div>
					</li>
				</c:forEach>
				
				 --%>
				</ul>
			</form>
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			
		</div>
	</div>
	
	
		<!-- modal창 -->
	 	<div id="modal" class="modal">
			<div class="modal-content">
						<div>
							<br/><br/>
							<input class = "form-control" name = 'reply' value = 'New Reply!!!!'
							style="width: 450px; height: 120px;">
						</div>
						<br/>
						<div class="btn">
					<button id="update" style="cursor:pointer; border-radius: 10px; border: none; width: 50px;">수정</button>
					<button id="delete" style="cursor:pointer; border-radius: 10px; border: none;  width: 50px;">삭제</button>
	                <button id="close" style="cursor:pointer; border-radius: 10px; border: none;  width: 50px; ">닫기</button>
			 </div>
			 </div>
		</div>
	
</body>

</html>


<%@ include file="../include/footer.jsp"%>
