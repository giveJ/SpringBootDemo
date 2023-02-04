<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>project</title>
<style type="text/css">
.class-data li {
	list-style-type: none;
	margin: 40px;
	width: 100px;
	height: 200px;
}

.search_div {
	width: 100%;
	height: 50px;
}

.search_content {
	text-align: center;
}

.middle_content {
	margin: auto;
	height: 500px;
}
</style>
</head>
<body>
	<br />
	<hr />
	<br />
	<%-- 검색창 영역------------------------------------------------------------------------------------------- --%>

	<div class="search_div">
		<div class="search_content">
			<div class="w100" style="padding-right: 10px">
				<select class="form-control form-control-sm" name="searchType"
					id="searchType">
					<option value="title">제목</option>
					<option value="Content">본문</option>
					<option value="reg_id">작성자</option>
				</select> <input type="text" class="form-control form-control-sm"
					name="keyword" id="keyword">&nbsp;&nbsp;
				<button class="btn btn-sm btn-primary" name="btnSearch"
					id="btnSearch">검색</button>
			</div>
		</div>
		<br />
		<hr />
		<br />
	</div>

	<%--검색창 영역 end ---------------------------------------------------------------------------------------------------- --%>
	<%-- 강의 데이터 나열 ---------------------------------------------------------------------------------------------------- --%>
	<div class="middle_content">
		<div class="middle_content_inner">
			<div class="uimg">
				
			</div>
		
			<c:forEach var="vo" items="${vo}">
				<div>
					<ul class="class-data">
						<li data-cno="${vo.cno}">
							<div>
								<c:out value="${vo.user_ID }"></c:out>
								<br /> <br />
								<c:out value="${vo.class_name }"></c:out>
								<br /> <br />
								<c:out value="${vo.class_type }"></c:out>
								<br /> <br />
								<c:out value="${vo.class_price }"></c:out>
								<br /> <br />
							</div>
						</li>
					</ul>
				</div>
			</c:forEach>
		</div>
	</div>


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
		$(function() {
			
		//강의 클릭 이벤트----------------------------------------------------------------------------------
			var cno;
			$(".class-data").on("click", "li", function() {
				
				cno = $(this).data("cno"); 
				alert(cno);
				location.href="/main/class_get?cno=" + cno;				
				
				
				
				});
			
		//클래스 클릭 이벤트 end------------------------------------------------------------------------------	
			
		//클래스 검색---------------------------------------------------------------------------------------
		/*  $(document).on('click', '#btnSearch', function(e){

			e.preventDefault();

			var url = "${class_list}";

			url = url + "?searchType=" + $('#searchType').val();

			url = url + "&keyword=" + $('#keyword').val();

			location.href = url;

			console.log(url);

		});		  */
		//클래스 검색 end----------------------------------------------------------------------------------------			
		
		function showUploadedImage(arr) {
			console.log(arr);
			
			var divArea = $(".uimg");
			
			for(var i =0; i < arr.length; i++){
				divArea.append('<img src="/display?fileName="'+arr[i].imageURL+'">')
			}
		}
		
		
		
		
		
		
		
		
		
		
		
		});
</script>
</body>
</html>
<%@ include file="../include/footer.jsp"%>