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

	ul li{
		float: left;
		list-style-type: none;
	}
	li a{
		display: block;
          /*a태그는 인라인 태그로 글자만큼의 영역만 가지고 있기 때문에 서로 띄워서 가로 나열 하기 위해 블록라인레벨로 바꿔줌*/ 
		text-align: center;
		width: 100px;
		padding: 20px;
		text-decoration: none;
		color:black;
	}
	.dropbtn-content{
		display: none;
		background-color: skyblue;
		position: fixed;
	}
	.dropdown1:hover .dropbtn-content{
		display: block;
	}
	
	.drop{
		width: 200px;
		height: 800px;
		margin: 0px;
		float: left;
	}
	
	.container{
		border: 1px solid grey;
		width: 200px;
		height: 200px;
		border-radius: 20px;
		position: absolute;
		top: 200px;
		left: 300px;
		
	}

	.container:hover {
	
	color: skyblue;	
	border: 1px solid skyblue;
}

	.img:hover{
		filter: invert(87%) sepia(9%) saturate(7148%) hue-rotate(183deg) brightness(89%) contrast(120%);
	}
	.middle{
		position: relative;
		float: left;
		border-left: 1px solid black;
	}
	
	a:link{
		color: black;
	}


	a:visited{
		color: black;
	}

	.jss329 {
    margin-left: 24px;
    grid-template-columns: 1fr;
    display: inline-grid;
    row-gap: 25px;
    flex-wrap: wrap;
    column-gap: 25px;
    margin-left: 65px;
    grid-auto-rows: 160px;
    grid-template-columns: 1fr 1fr;
	}
	
	.jss358 {
    width: 336px;
    border: 1px solid #CED4DA;
    cursor: pointer;
    height: 126px;
    display: flex;
    padding: 16px;
    border-radius: 12px;
    flex-direction: column;
    justify-content: space-between;
    text-decoration: none;
	}
	
	.jss359 {
    width: 100%;
    display: flex;
    align-items: center;
    flex-direction: row;
    justify-content: flex-start;
	}
	
	.jss360 {
    color: #515B60;
    font-size: 36px;
    font-weight: 700;
	}
	
	.css-vubbuv {
    user-select: none;
    width: 1em;
    height: 1em;
    display: inline-block;
    fill: currentcolor;
    flex-shrink: 0;
    transition: fill 200ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
    font-size: 1.5rem;
	}
	
	
	svg:not(:root) {
    overflow-clip-margin: content-box;
    overflow: hidden;
	}
	
	.jss73 {
    color: #38414E;
    width: 100%;
    display: flex;
    align-items: center;
    margin-bottom: 40px;
    flex-direction: row;
    justify-content: flex-start;
	}
	
	.css-vubbuv {
    user-select: none;
    width: 1em;
    height: 1em;
    display: inline-block;
    fill: currentcolor;
    flex-shrink: 0;
    transition: fill 200ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
    font-size: 1.5rem;
	}
	
	svg:not(:root) {
    overflow-clip-margin: content-box;
    overflow: hidden;
	}

	.jss74 {
    color: #38414E;
    font-size: 20px;
    font-weight: 700;
    margin-left: 80px;
	}
	
	
	.jss324 {
    width: 336px;
    border: 1px solid #CED4DA;
    cursor: pointer;
    height: 126px;
    display: flex;
    padding: 16px;
    border-radius: 12px;
    flex-direction: column;
    justify-content: space-between;
    text-decoration: none;
    margin-left: 75px;
	}

	
	.jss325 {
    width: 100%;
    display: flex;
    align-items: center;
    flex-direction: row;
    justify-content: flex-start;
	}
	
	.jss326 {
    color: #515B60;
    font-size: 36px;
    font-weight: 700;
	}
	
	.css-vubbuv {
    user-select: none;
    width: 1em;
    height: 1em;
    display: inline-block;
    fill: currentcolor;
    flex-shrink: 0;
    transition: fill 200ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
    font-size: 1.5rem;
	}
	
	
	.jss327 {
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
	}
	
	.jss328 {
    color: #515B60;
    font-size: 18px;
    font-weight: 700;
    line-height: 26px;
    margin-bottom: 8px;
	}
	
	.jss329 {
    color: #515B60;
    font-size: 16px;
    line-height: 24px;
	}	
	
	
	
	
	
</style>
</head>
<body>
	<div>
		<%--클래스 계정 관리 사이드 메뉴 --%>
		<div class="drop">
			<ul >
				<li class="droptdown1"><a href="#">게스트 계정</a></li>
				<li class="dropdown2">
					<a href="#" class="dropbtn">호스트 계정</a>
				</li>
			</ul>
		</div>
	<%-- 내용 --%>
		<div class="middle" style="width: 800px; height: 1000px;">
			<div class="jss74">
			<svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-vubbuv" focusable="false" aria-hidden="true" viewBox="0 0 24 24" data-testid="EmojiEmotionsOutlinedIcon">
			<circle cx="15.5" cy="9.5" r="1.5"></circle>
			<circle cx="8.5" cy="9.5" r="1.5"></circle>
			<path d="M12 18c2.28 0 4.22-1.66 5-4H7c.78 2.34 2.72 4 5 4z"></path>
			<path d="M11.99 2C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zM12 20c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8z"></path>
			</svg>
			<div class="jss75">프로필</div>
			</div>
			
			<div class="jss329">
			<a class="jss358" href="#">
			<div class="jss359">
			<svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium jss360 css-vubbuv" focusable="false" aria-hidden="true" viewBox="0 0 24 24"data-testid="FavoriteBorderOutlinedIcon">
			<path d="M16.5 3c-1.74 0-3.41.81-4.5 2.09C10.91 3.81 9.24 3 7.5 3 4.42 3 2 5.42 2 8.5c0 3.78 3.4 6.86 8.55 11.54L12 21.35l1.45-1.32C18.6 15.36 22 12.28 22 8.5 22 5.42 19.58 3 16.5 3zm-4.4 15.55-.1.1-.1-.1C7.14 14.24 4 11.39 4 8.5 4 6.5 5.5 5 7.5 5c1.54 0 3.04.99 3.57 2.36h1.87C13.46 5.99 14.96 5 16.5 5c2 0 3.5 1.5 3.5 3.5 0 2.89-3.14 5.74-7.9 10.05z"></path>
			</svg>
			</div>
			<div class="jss361">
			<div class="jss362">위시리스트</div>
			<div class="jss363">0개</div>
			</div>
			</a>
			<a class="jss358" href="#">
			<div class="jss359">
			<svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium jss360 css-vubbuv" focusable="false" aria-hidden="true" viewBox="0 0 24 24" data-testid="ShoppingCartOutlinedIcon">
			<path d="M15.55 13c.75 0 1.41-.41 1.75-1.03l3.58-6.49c.37-.66-.11-1.48-.87-1.48H5.21l-.94-2H1v2h2l3.6 7.59-1.35 2.44C4.52 15.37 5.48 17 7 17h12v-2H7l1.1-2h7.45zM6.16 6h12.15l-2.76 5H8.53L6.16 6zM7 18c-1.1 0-1.99.9-1.99 2S5.9 22 7 22s2-.9 2-2-.9-2-2-2zm10 0c-1.1 0-1.99.9-1.99 2s.89 2 1.99 2 2-.9 2-2-.9-2-2-2z"></path>
			</svg>
			</div>
			<div class="jss361">
			<div class="jss362">내가 신청한 클래스</div>
			<div class="jss363">클래스 후기를 작성하고 크레딧을 받아보세요</div>
			</div>
			</a>
			</div>
		</div>	
		
		<%--<div class="container">
				<div class="insert_btn">
					<div class="inner">
					 <a href="insert_class">
						<img src="../resources/img/plus.svg" width="100px" height="100px" align="middle" class="img"/>
					</a>
					<p>클래스 생성하기</p> 
				</div>
			</div>--%>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
	
	$(function() {
		//게스트 계정 클릭시 화면 start---------------------------------------------------------------------------------------------------------------------------------------------------------------
		$(".droptdown1").click(function() {
			str=''
			str+='<div class="jss74">'
			str+='<svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-vubbuv" focusable="false" aria-hidden="true" viewBox="0 0 24 24" data-testid="EmojiEmotionsOutlinedIcon">'
			str+='<circle cx="15.5" cy="9.5" r="1.5"></circle>'
			str+='<circle cx="8.5" cy="9.5" r="1.5"></circle>'
			str+='<path d="M12 18c2.28 0 4.22-1.66 5-4H7c.78 2.34 2.72 4 5 4z"></path>'
			str+='<path d="M11.99 2C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zM12 20c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8z"></path>'
			str+='</svg>'
			str+='<div class="jss75">프로필</div>'
			str+='</div>'
			
			str+='<div class="jss329">'
			str+='<a class="jss358" href="#">'
			str+='<div class="jss359">'
			str+='<svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium jss360 css-vubbuv" focusable="false" aria-hidden="true" viewBox="0 0 24 24"data-testid="FavoriteBorderOutlinedIcon">'
			str+='<path d="M16.5 3c-1.74 0-3.41.81-4.5 2.09C10.91 3.81 9.24 3 7.5 3 4.42 3 2 5.42 2 8.5c0 3.78 3.4 6.86 8.55 11.54L12 21.35l1.45-1.32C18.6 15.36 22 12.28 22 8.5 22 5.42 19.58 3 16.5 3zm-4.4 15.55-.1.1-.1-.1C7.14 14.24 4 11.39 4 8.5 4 6.5 5.5 5 7.5 5c1.54 0 3.04.99 3.57 2.36h1.87C13.46 5.99 14.96 5 16.5 5c2 0 3.5 1.5 3.5 3.5 0 2.89-3.14 5.74-7.9 10.05z"></path>'
			str+='</svg>'
			str+='</div>'
			str+='<div class="jss361">'
			str+='<div class="jss362">위시리스트</div>'
			str+='<div class="jss363">0개</div>'
			str+='</div>'
			str+='</a>'
			str+='<a class="jss358" href="#">'
			str+='<div class="jss359">'
			str+='<svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium jss360 css-vubbuv" focusable="false" aria-hidden="true" viewBox="0 0 24 24" data-testid="ShoppingCartOutlinedIcon">'
			str+='<path d="M15.55 13c.75 0 1.41-.41 1.75-1.03l3.58-6.49c.37-.66-.11-1.48-.87-1.48H5.21l-.94-2H1v2h2l3.6 7.59-1.35 2.44C4.52 15.37 5.48 17 7 17h12v-2H7l1.1-2h7.45zM6.16 6h12.15l-2.76 5H8.53L6.16 6zM7 18c-1.1 0-1.99.9-1.99 2S5.9 22 7 22s2-.9 2-2-.9-2-2-2zm10 0c-1.1 0-1.99.9-1.99 2s.89 2 1.99 2 2-.9 2-2-.9-2-2-2z"></path>'
			str+='</svg>'
			str+='</div>'
			str+='<div class="jss361">'
			str+='<div class="jss362">내가 신청한 클래스</div>'
			str+='<div class="jss363">클래스 후기를 작성하고 크레딧을 받아보세요</div>'
			str+='</div>'
			str+='</a>'
			str+='</div>'
			
			$(".middle").html(str)
		});
		//게스트 계정 클릭시 화면 end---------------------------------------------------------------------------------------------------------------------------------------------------------------
		//호스트 계정 클릭시 화면 start---------------------------------------------------------------------------------------------------------------------------------------------------------------
		$(".dropbtn").click(function() {
			str1 =''
			str1+='<div class="jss295">'
			str1+='<a class="jss324" href="/main/modify_page">'
			str1+='<div class="jss325">'
			str1+='<svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium jss326 css-vubbuv" focusable="false" aria-hidden="true" viewBox="0 0 24 24" data-testid="StorefrontOutlinedIcon">'
			str1+='<path d="m21.9 8.89-1.05-4.37c-.22-.9-1-1.52-1.91-1.52H5.05c-.9 0-1.69.63-1.9 1.52L2.1 8.89c-.24 1.02-.02 2.06.62 2.88.08.11.19.19.28.29V19c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2v-6.94c.09-.09.2-.18.28-.28.64-.82.87-1.87.62-2.89zm-2.99-3.9 1.05 4.37c.1.42.01.84-.25 1.17-.14.18-.44.47-.94.47-.61 0-1.14-.49-1.21-1.14L16.98 5l1.93-.01zM13 5h1.96l.54 4.52c.05.39-.07.78-.33 1.07-.22.26-.54.41-.95.41-.67 0-1.22-.59-1.22-1.31V5zM8.49 9.52 9.04 5H11v4.69c0 .72-.55 1.31-1.29 1.31-.34 0-.65-.15-.89-.41-.25-.29-.37-.68-.33-1.07zm-4.45-.16L5.05 5h1.97l-.58 4.86c-.08.65-.6 1.14-1.21 1.14-.49 0-.8-.29-.93-.47-.27-.32-.36-.75-.26-1.17zM5 19v-6.03c.08.01.15.03.23.03.87 0 1.66-.36 2.24-.95.6.6 1.4.95 2.31.95.87 0 1.65-.36 2.23-.93.59.57 1.39.93 2.29.93.84 0 1.64-.35 2.24-.95.58.59 1.37.95 2.24.95.08 0 .15-.02.23-.03V19H5z"></path>'
			str1+='</svg>'
			str1+='</div>'
			str1+='<div class="jss327">'
			str1+='<div class="jss328">클래스 관리</div>'
			str1+='<div class="jss329">클래스를 편하게 운영 및 관리해 보세요</div>'
			str1+='</div>'
			str1+='</a>'
			str1+='</div>'
			
			
			$(".middle").html(str1);
			
		});
		//호스트 계정 클릭시 화면 둥---------------------------------------------------------------------------------------------------------------------------------------------------------------
	});
	
	</script>
	
</body>
</html>
