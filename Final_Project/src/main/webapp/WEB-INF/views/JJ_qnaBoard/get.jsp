<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
	color: white;
	background-color: #fcd11e;
	padding: 5px;
	border: none;
	text-align: left;
	border-radius: 30px;
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/util.js"></script>
<script type="text/javascript">
	$(function(){
		
		// 댓글 등록하기
		var operForm = $("#operForm");
		var bnoValue = '${qnaBoard.bno}';
		var reply = $("input[name='reply']");
		
		
		showList();

		function add(reply, callback){
			console.log("reply......"); 
			console.log(reply.reply); 
			console.log(reply.bno); 
			
			$.ajax({
				type:'post',
				url : '/replies/new',
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
				url : '/replies/pages/' + bno + '/1.json',
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
			   	url : '/replies/' + rno + '.json',
			  
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
							str += '<p><b>'+ 'smile paws' + '</b>'+" &nbsp;&nbsp;&nbsp;"+ displayTime(result[i].replydate) + '</p>';
							str += '<p>'+ '<a id="modalBtn" style="width: 850px; text-align: left;">'+ result[i].reply+ '</a>'+'</p>'
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
				   	url : '/replies/'+ reply.rno,
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
		   	url : '/replies/' + rno,
		  
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
		
		$("#listBtn2").click(function(){
			
			operForm.append('<input type="hidden" name="bno" value="'+${qnaBoard.bno }+'">');
			operForm.submit();
			
			});
		
		
		$("#listBtn").click(function(){
			
			operForm.attr("action", "/JJ_qnaBoard/list");
			operForm.submit();
		});
		
		
		$("#replyBtn").on("click", function(){
			
			
			if($("#replyBox").val() == ''){
				alert("내용을 입력해주세요");
				return false;
			}
			
			
			add(
				{reply: reply.val(), bno: bnoValue}	
			);
			
		});
		
	 	
		
		
		
		// ----------------- 모달창 (관리자 답변)------------------------------
		
		if(${member.user_grade == 1}){
			
			$(".chat").on("click", "li", function(){
				
				// 1. rno 가져오기
				rno = $(this).attr('data-rno');
				
				// 2. rno 통해서 댓글 정보 db에서 가져오기
				get(rno, function(result){
					console.log(result);
					$('#modal').find("input[name='reply']").val(result.reply);
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
						reply: $('#modal').find("input[name='reply']").val()},
						
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
			
		}	
			
	});	
	
	
</script>
<body>

	<div class="container1">
		<h1>문의사항</h1>
		<div class="line"></div>
		<br />
		<br />
		<br />
		<br />
		<br />

		<div class="notice_container">
			<button id="category" data-oper="list">${qnaBoard.category}</button>
			<br />

			<c:choose>
				<c:when test="${qnaBoard.secret eq 1}">
					<b>${qnaBoard.title}</b>
					<img src="../resources/img/board/lock.png" width="30px"
						height="30px">
				</c:when>
				<c:otherwise>
					<b>${qnaBoard.title}</b>
					<img src="../resources/img/board/open.png" width="30px"
						height="30px">
				</c:otherwise>
			</c:choose>

			<hr />
			<br />
			<br />
			<div class="notice_content">${qnaBoard.content}</div>
			<br />
			<br />
			<br />
			<br />


			<div class="notice_header">
				<h5>${qnaBoard.writer}</h5>
				<h6>${qnaBoard.regdate}</h6>
			</div>
			<hr />

			<div>
				<button id="listBtn" data-oper="list">목록보기</button>
				<button id="listBtn2" data-oper="update">글 내용 수정</button>
			</div>

			<form action="/JJ_qnaBoard/modify" method="get" id="operForm">
				<input type="hidden" name="pageNum" value="${cri.pageNum }">
				<input type="hidden" name="amount" value="${cri.amount }">
			</form>

			<!--------------------------------댓글	------------------------------>
			<br />
			<br />
			<c:if test="${member.user_grade eq 1}">
				<input type="text" name="reply" placeholder="답변은 관리자만 가능합니다." id="replyBox"><br/><br/>
				<button id="replyBtn" data-oper="reply">입력</button>
			</c:if>
			<br />
			<br />
			<br /> <b>답변</b>
			<hr />
			
			<form action="/replies/pages/{bno}/{page}" method="get">

				<ul class="chat">
				
				<%-- <c:forEach items="${reply}" var="reply">
					<li id="replyList" data-rno=${reply.rno }>
						<div>
							<h5>${reply.replydate}</h5>
							<p>${reply.reply }</p>
							<input type="hidden" value="${reply.rno }">
							<input type="hidden" value="${reply.bno }">
						</div>
					</li>
				</c:forEach> --%>
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
						<input class = "form-control" name = 'reply' value = 'New Reply!!!!' 
						style="width: 450px; height: 200px;">
						</div>
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
