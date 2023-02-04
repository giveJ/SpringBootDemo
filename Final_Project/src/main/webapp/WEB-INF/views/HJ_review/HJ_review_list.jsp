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
<style type="text/css">
	.child,.search{
		text-align: center;
	}
	
	 [type="button"] {
      padding: 15px;
      background-color: skyblue;
      border: 1px;
      border-radius: 5px;
   }
   
   [type="button"]:hover {
      padding: 15px;
      background-color: skyblue;
      border: 1px;
      cursor: pointer;
      color: white;
      border-radius: 5px;
   }
   .search{
		margin: 10px;
		padding: 10px;
	}
	#search1{
		padding: 10px;
	}
	select{
		padding: 10px;
		border-radius: 3px;
		color: black;
		background-color: white;
	}
	.child-list{
		margin: auto;
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
            width: 30%;                         
        	border-radius: 25px;
        }
		
		#review,#regBtn{
			text-align: right;
		}
		 .pagination{
	 	list-style-type: none;
	 	margin: auto;
	 	text-align: center;
	 	width: 300px;	
	 }
	 .bta_a{
	 	padding: 0px;
	 	width: 50px;
	 }
	 
	#pag{
		text-align: center;
	}
	a{
		text-decoration: none;
		color: black;
	}
	a:hover{
      font-weight: bold;
      color:  #c0dff4;
   	  
   }
</style>
  <script src="https://code.jquery.com/jquery-latest.js"></script>
  <script type="text/javascript">
	  $(function(){
		  
		  var actionForm = $("#actionForm");
		  
		  // 글쓰기 페이지로 이동
		  $("#regBtn").click(function(){
				actionForm.attr("action","/HJ_review/HJ_review_register");
				actionForm.submit();
			});
		  
		//-------------상세 보기 페이지 이동 버튼 클릭 이벤트--------------
			$(".move").click(function(e){
				//<a> 클릭시 페이지 이동이 이루어지지 않게 하기 위해
				e.preventDefault();	// 기본 href 경로 이동 방지
				actionForm.attr("action", "/HJ_review/HJ_review_get");
				
				var str = '';
				str += '<input type="hidden" name="pageNum" value="'+${pageMaker.cri.pageNum }+'">';
				str += '<input type="hidden" name="amount" value="'+${pageMaker.cri.amount }+'">'; 
				str += '<input type="hidden" name="rno" value="'+$(this).attr("href")+'">';
					
				
				actionForm.html(str);
				actionForm.submit();
			});
		
			// ------페이징------
			$(".paginate_button a").click(function(e){
				e.preventDefault();
				actionForm.attr("action", "/HJ_review/HJ_review_list");
				actionForm.find("input[name='pageNum']").val($(this).attr('href'));
				actionForm.submit();
			});
			
		
	  });
	  
		 var result = '<c:out value="${result}"/>';

		 if(result != ''){
			checkResult(result);
		}

		 history.replaceState({}, null,null);
		function checkResult(result){
			if(result === '' || history.state){	// 뒤로가기 방지
				alert("처리가 완료");
				return;
			}
			if(result === 'success'){	// 수정 및 삭제
				alert("처리 완료");
				return;
			}
			if(result === 'ok'){	// 삽입
				alert("게시글 등록");
			}
		
		}	
  </script>
	
</head>
<body>


	<div class="child">
		<h1>입양사진 및 후기</h1> <br/>
		<img src="../resources/images/main7.jpg" width="80%" height="550px"><br/>
			<br/>
			<br/>
			<br/>
		<hr/>
		
			<br/>
			<br/>
			<br/>
	</div>
	
	<div>
		<table class="child-list">
			<thead>
				<tr>
					<td id="take" style="font-weight: bold;">입양사진 및 후기</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</thead>
			<tbody>
					<tr>
						<c:forEach var="review" items="${list}" varStatus="status">
						<c:if test="${status.index%4==0}">
						<tr>
						</tr>
						</c:if>
						<td><a class="move" href="${review.rno}"><img src="${review.r_Img }" width="250px" height="250px" name="r_Img" id="img"></a><br/><a class="move" href="${review.rno}"><c:out value="${review.r_title}"></c:out></a><br/></td>
						</c:forEach>
					</tr>
			</tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td id="regBtn"><input type="button" value="글쓰기"></td>
				</tr>
		</table>
	</div>
	
	<ul class="pagination">
		<c:if test="${pageMaker.prev}">
			<li class="paginate_button previous">
				<a href="${pageMaker.startPage-1 }" class="bta_a">&lt;</a>
			</li>
		</c:if>
		<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" step="1">
			<li class="paginate_button ${pageMaker.cri.pageNum==num ? 'active':'' }">
				<a href="${num}" class="bta_a">${num}</a>
			</li>
		</c:forEach>
		<c:if test="${pageMaker.next}">
			<li class="paginate_button">
				<a href="${pageMaker.endPage+1 }" class="bta_a">&gt;</a>
			</li>
		</c:if>
	</ul>
	
	
	
		<form action="/HJ_review/HJ_review_list" method="get" id="actionForm">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		</form>
	
	<%@ include file="../include/footer.jsp" %>

</body>
</html>