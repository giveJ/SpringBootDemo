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
	.child,.search,#noSearch{
		text-align: center;
	}
	.btn btn-default{
	  padding: 10px;
      background-color: skyblue;
      border: 1px;
      border-radius: 5px;
	}
	 button,[type="button"] {
      padding: 15px;
      background-color: skyblue;
      border: 1px;
      border-radius: 5px;
      margin: 5px;
   }
   
  	button, [type="button"]:hover {
      padding: 10px;
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
		
		.paginate_button previous {
			float: left;
			margin-left : 5px;
		}
		.pull-right{
			text-align: center;
			float: none;
			width: 0px;
			top: 0px;
			padding: 0px;
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
   #noSearch{
   		height: 100px;
   		
   }
</style>
 <script src="https://code.jquery.com/jquery-latest.js"></script>
 <script type="text/javascript">
	  $(function(){
		  
		  var actionForm = $("#actionForm");
		  var searchForm = $('#searchForm');
		  
		  // 글쓰기 페이지로 이동
		  $("#regBtn").click(function(){
				actionForm.attr("action","/HJ_family/HJ_register");
				actionForm.submit();
			});
		  
		  // 입양신청 페이지로 이동
		  $("#adopt").click(function(){
			  	actionForm.attr("action","/HJ_adopt/HJ_adopt_register");
				actionForm.submit();
		  });
		  
		  // 모달창 
		  $("#mod").click(function(){
			  $('#myModal').show();
			  
		  });
		  
		  $(".pop_bt").click(function(){
			  $('#myModal').hide();
		  });
		//-------------상세 보기 페이지 이동 버튼 클릭 이벤트--------------
			$(".move").click(function(e){
				//<a> 클릭시 페이지 이동이 이루어지지 않게 하기 위해
				e.preventDefault();	// 기본 href 경로 이동 방지
				actionForm.attr("action", "/HJ_family/HJ_get");
				
				var str = '';
			 	str += '<input type="hidden" name="pageNum" value="'+${pageMaker.cri.pageNum }+'">';
				str += '<input type="hidden" name="amount" value="'+${pageMaker.cri.amount }+'">'; 
				str += '<input type="hidden" name="fno" value="'+$(this).attr("href")+'">';
					
				
				actionForm.html(str);
				actionForm.submit();
			});
		  
			// ------페이징------
			$(".paginate_button a").click(function(e){
				e.preventDefault();
				actionForm.attr("action", "/HJ_family/HJ_list");
				actionForm.find("input[name='pageNum']").val($(this).attr('href'));
				actionForm.submit();
			});
			
			// ------후기 페이지로 이동------
			$("#review").click(function(){
				actionForm.attr("action","/HJ_review/HJ_review_list");
				actionForm.find("input[name='pageNum']").val('1');
				actionForm.submit();
			});
			
			//-------검색-------
			$('#searchForm button').click(function(e) {
				if (!searchForm.find('input[name="keyword"]').val()) {
					alert('검색어를 입력하세요');
					return false;
				}
				e.preventDefault();
				searchForm.find("input[name='pageNum']").val('1');
				searchForm.submit();
				
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

<form id="searchForm" action="/HJ_family/HJ_list" method="get">
	<div class="child">
		<h1>보호중 아이들</h1> <br/>
		<img src="../resources/images/main3.jpg" width="80%" height="550px"><br/>
		<h1>보호중 아이들</h1>
		<hr/>
		아이들에게 따뜻한 손길을 내어주세요.<br/>

		항시 수십마리의 아이들이 보호되고 있으며<br/>  게시된 글은 그 중 일부입니다.<br/>
		방문하여 아이들과 직접 교감하며 입양 하<br/>시길 권장 드리며, 입양시 무료 또는 약간의<br/> 책임비가 있을 수 있습니다.<br/>
		<br/>
		<input type="button" value="입양 전 반드시 읽어주세요" id="mod">
		<hr/>
		
		<div class="search">
			<select name="type">
				<option value="A" <c:out value='${pageMaker.cri.type eq "A"?"selected": "" }'/>>전체</option>
				<option value="V" <c:out value='${pageMaker.cri.type eq "V"?"selected": "" }'/>>종류</option>
				<option value="T" <c:out value='${pageMaker.cri.type eq "T"?"selected": "" }'/>>제목</option>
			</select>
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" /> 
        	<input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
			<input type="text" placeholder="검색어" size="50px" id="search1" name="keyword"><button class="btn btn-default">검색</button>	
			<br/>
		</div>
	</div>
	
	<div>
		<table class="child-list">
		<c:if test="${listCheck != 'empty' }">
			<thead>
				<tr>
					<td id="take" style="font-weight: bold;">보호중 아이들</td>
					<td></td>
					<td></td>
					<td id="review"><input type="button" value="입양후기"></td>
				</tr>
			</thead>
			<tbody>
					<tr>
						<c:forEach var="family" items="${list}" varStatus="status">
						<c:if test="${status.index%4==0}">
						<tr>
						</tr>
						</c:if>
						<td style="text-align: center;"><a class="move" href="${family.fno}"><img src="${family.f_Img }" width="250px" height="250px" name="f_Img" id="img"></a><br/>[<c:out value="${family.variety}"></c:out>]<a class="move" href="${family.fno}"><c:out value="${family.f_title}"></c:out></a><br/></td>
						</c:forEach>
					</tr>
			</tbody>
				<tr>
					<td><input type="button" value="입양신청" id="adopt"></td>
					<td></td>
					<td></td>
					<td id="regBtn"><input type="button" value="글쓰기"></td>
				</tr>
			</c:if>
		</table>
	</div>
</form>
				
	<c:if test="${listCheck == 'empty'}">
		<div id="noSearch">
			<h1>'${pageMaker.cri.keyword}'에 대한 검색결과가 없습니다.</h1>
		</div>
	</c:if>	
		
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

	

		<%-- <!-- page -->
				<div class="pull-right">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous">
								<a href="${pageMaker.startPage-1 }">&lt;</a>
							</li>
						</c:if>
						<c:forEach var="num" begin="1" end="${pageMaker.endPage }" step="1">
							<li class="paginate_button ${pageMaker.cri.pageNum==num ? 'active':'' }">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<li class="paginate_button">
								<a href="${pageMaker.endPage+1 }">&gt;</a>
							</li>
						</c:if>
					</ul>
				</div> 
	 --%>
	 	
	 	
	
		<form action="/HJ_family/HJ_list" method="get" id="actionForm">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="type" value="<c:out value='${pageMaker.cri.type}'/>"> 
    		<input type="hidden" name="keyword" value="<c:out value='${pageMaker.cri.keyword}'/>">
		</form>
	
	
	
	
	<!-- modal -->
	
	 <div id="myModal" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">입양안내</span></b></span></p>
                <hr/>
                <p style="text-align: center;"><span style="font-size: 10pt;"><b><span style="font-size: 15pt;">입양자격</span></b></span></p>
                <p style="text-align: left; line-height: 1.5;"><br />1. 책임입양이 가능한 18세이상 신원확인 가능한 성인<br/>2. 경제적 능력이 있고 반려동물을 사랑하는 가정<br/>3. 입양 후 1년간 6회이내 아이 생활사진을 보내주실 수 있는 분<br/></p>
                <hr/>
                <p style="text-align: center;"><span style="font-size: 10pt;"><b><span style="font-size: 15pt;">입양절차</span></b></span></p>
                <p style="text-align: left; line-height: 1.5;"><br />1. 입양신청서 작성 후 전화상담<br/>2. 보호소 방문<br/>3. 상담 및 분양계약서 작성 후 입양<br/></p>
              	<hr/>
                <p style="text-align: center;"><span style="font-size: 10pt;"><b><span style="font-size: 15pt;">책임비 안내</span></b></span></p>
                <p style="text-align: left; line-height: 1.5;"><br />1. 책임비는 수익목적재분양, 재유기파양, 재정능력 없는 가정을 <br/>필터링 하기 위한 최소한의 장치입니다.<br/>2. 책임비는 유기동물보호 캠페인에 쓰여집니다.<br/>3. 아이에 따라 무료분양이 가능합니다.<br/>4. 충분한 신뢰를 입증한 재입양 회원은 책임비가 면제됩니다.</p>
                <p><br /></p>
            <div style="cursor:pointer;background-color:skyblue;text-align: center;padding-bottom: 10px;padding-top: 10px; border-radius: 10px;">
                <span class="pop_bt" style="font-size: 13pt;" >
                     확인
                </span>
            </div>
      </div>
    </div>
	
	
	
<%@ include file="../include/footer.jsp" %>
</body>
</html>