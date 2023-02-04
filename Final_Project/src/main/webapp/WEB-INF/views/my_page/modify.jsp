<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	body {
    margin: 0;
    height: 100%;
    background: #fafafa;
    font-family: "Noto Sans KR",-apple-system,BlinkMacSystemFont,"Segoe UI","Roboto","Oxygen","Ubuntu","Cantarell","Fira Sans","Droid Sans","Helvetica Neue",sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
	}
	
	
	.jss615 {
    width: 100%;
    display: flex;
    margin-top: 16px;
    min-height: calc(100vh - 64px);
    align-items: flex-start;
    flex-direction: row;
    justify-content: flex-start;
    background-color: #FAFAFA;
	}

	.css-1tu59u4 {
    flex: 0 0 auto;
	}

	.jss636 {
    top: 64px;
    width: 240px;
	}

	.jss627 {
    width: 100%;
    display: flex;
    padding: 0 4px;
    z-index: 100;
    max-width: 232px;
    background: #FAFAFA;
    flex-shrink: 0;
    flex-direction: column;
	}

	.css-1l8j5k8 {
    background-color: rgb(255, 255, 255);
    color: rgba(0, 0, 0, 0.87);
    transition: box-shadow 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
    box-shadow: none;
    overflow-y: auto;
    display: flex;
    flex-direction: column;
    height: 100%;
    flex: 1 0 auto;
    z-index: 1200;
    position: fixed;
    top: 0px;
    outline: 0px;
    left: 0px;
    border-right: 1px solid rgba(0, 0, 0, 0.12);
	}

	.jss628 {
    color: #1F283D;
    margin: 24px 0 24px 24px;
    font-size: 18px;
    font-weight: 700;
	}

	.css-1gflypb {
    margin: 0px;
    font-family: "Noto Sans KR", serif;
    font-weight: 400;
    font-size: 1rem;
    line-height: 1.5;
	}
	
	p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
	}

	.jss634 {
    border-radius: 8px;
	}

	.jss632 {
    padding: 8px 24px;
	}

	.jss629 {
    background: #FEF3E8;
	}
	
	.css-17s5gdh {
    display: inline-flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    position: relative;
    box-sizing: border-box;
    -webkit-tap-highlight-color: transparent;
    background-color: transparent;
    outline: 0px;
    border: 0px;
    margin: 0px;
    cursor: pointer;
    user-select: none;
    vertical-align: middle;
    appearance: none;
    text-decoration: none;
    font-family: "Noto Sans KR", serif;
    font-weight: 500;
    font-size: 0.875rem;
    line-height: 1.75;
    text-transform: uppercase;
    min-width: 64px;
    padding: 6px 8px;
    border-radius: 4px;
    transition: background-color 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms, box-shadow 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms, border-color 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms, color 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
    color: rgb(242, 131, 22);
	}
	
	button {
    appearance: auto;
    writing-mode: horizontal-tb !important;
    font-style: ;
    font-variant-ligatures: ;
    font-variant-caps: ;
    font-variant-numeric: ;
    font-variant-east-asian: ;
    font-weight: ;
    font-stretch: ;
    font-size: ;
    font-family: ;
    text-rendering: auto;
    color: buttontext;
    letter-spacing: normal;
    word-spacing: normal;
    line-height: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: center;
    align-items: flex-start;
    cursor: default;
    box-sizing: border-box;
    background-color: buttonface;
    margin: 0em;
    padding: 1px 6px;
    border-width: 2px;
    border-style: outset;
    border-color: buttonborder;
    border-image: initial;
	}
	
	.jss616 {
    width: 100%;
    height: 100%;
    display: flex;
    max-width: 1100px;
    margin-top: 40px;
    margin-left: 170px;
    flex-direction: column;
	}
	
	.jss624 {
    height: 100%;
    display: flex;
    min-height: 40px;
    flex-direction: row;
    justify-content: space-between;
	}
	
	.jss637 {
    color: #1F283D;
    font-size: 18px;
    font-weight: 700;
	}
	
	.jss618 {
    margin-top: 10px;
	}
	.css-1tz8m30 {
    box-sizing: border-box;
    display: flex;
    flex-flow: row wrap;
    margin-top: -32px;
    width: calc(100% + 32px);
    margin-left: -32px;
	}

	.css-1tz8m30 > .MuiGrid-item {
    	padding-left: 32px;
	}
	.css-1tz8m30 > .MuiGrid-item {
    	padding-top: 32px;
	}

	.jss640 {
    	width: 100%;
    	height: 100%;
	}

	.css-19egsyp {
    box-sizing: border-box;
    margin: 0px;
    flex-direction: row;
    flex-basis: 100%;
    -webkit-box-flex: 0;
    flex-grow: 0;
    max-width: 100%;
	}

	.jss641 {
    width: 100%;
    cursor: pointer;
    height: 100%;
    display: flex;
    min-height: 220px;
    align-items: center;
    border-color: #CED4DA;
    justify-content: center;
	}
	
		
	.css-1cy6rd {
    background-color: rgb(255, 255, 255);
    color: rgba(0, 0, 0, 0.87);
    transition: box-shadow 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
    border-radius: 4px;
    border: 1px solid rgba(0, 0, 0, 0.12);
	}

	.jss642 {
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    flex-direction: column;
    justify-content: center;
	}

	.jss643 {
    color: #8F939E;
    width: 100%;
    height: 100%;
    max-width: 50px;
    max-height: 50px;
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
	
		
	path[Attributes Style] {
    d: path("M 19 13 h -6 v 6 h -2 v -6 H 5 v -2 h 6 V 5 h 2 v 6 h 6 v 2 Z");
	}
	
	:not(svg) {
    transform-origin: 0px 0px;
	}
	
	.jss644 {
    color: #8F939E;
    margin-top: 40px;
	}
	.css-1gflypb {
    margin: 0px;
    font-family: "Noto Sans KR", serif;
    font-weight: 400;
    font-size: 1rem;
    line-height: 1.5;
	}
	p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
	}
	
	
	table {
		margin: auto;
		text-align: center;
		width: 900px;
		height: 300px;
		margin-top: 25px;
	}
	
	.view{
		border: 1px solid black;
		width: 1000px;
		height: 400px;
		margin: auto;
		border-radius: 30px;
	}
	
	
	.btn{
		text-align: center;
		margin: 20px;
	}
</style>
</head>
<body>
	<div>
		<div style="width: 240px;">
			<div class="MuiDrawer-root MuiDrawer-docked css-1tu59u4">
				<div class="MuiPaper-root MuiPaper-elevation MuiPaper-elevation0 MuiDrawer-paper jss627 MuiDrawer-paperAnchorLeft jss636 MuiDrawer-paperAnchorDockedLeft css-1l8j5k8">
					<p class="MuiTypography-root MuiTypography-body1 jss628 css-1gflypb">클래스 워크스페이스</p>
					<button class="MuiButtonBase-root MuiButton-root jss634 MuiButton-text jss632 MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium MuiButton-root jss634 MuiButton-text jss632 MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium jss629 css-17s5gdh" tabindex="0" type="button">
						<div class="jss630">
							<svg class="MuiSvgIcon-root MuiSvgIcon-colorPrimary MuiSvgIcon-fontSizeMedium css-7wsri6" focusable="false" aria-hidden="true" viewBox="0 0 24 24" data-testid="PostAddRoundedIcon">
								<path d="M18 12c-.55 0-1 .45-1 1v5.22c0 .55-.45 1-1 1H6c-.55 0-1-.45-1-1V8c0-.55.45-1 1-1h5c.55 0 1-.45 1-1s-.45-1-1-1H5c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2v-6c0-.55-.45-1-1-1zm3.02-7H19V2.98c0-.54-.44-.98-.98-.98h-.03c-.55 0-.99.44-.99.98V5h-2.01c-.54 0-.98.44-.99.98v.03c0 .55.44.99.99.99H17v2.01c0 .54.44.99.99.98h.03c.54 0 .98-.44.98-.98V7h2.02c.54 0 .98-.44.98-.98v-.04c0-.54-.44-.98-.98-.98z"></path>
								<path d="M14 9H8c-.55 0-1 .45-1 1s.45 1 1 1h6c.55 0 1-.45 1-1s-.45-1-1-1zm0 3H8c-.55 0-1 .45-1 1s.45 1 1 1h6c.55 0 1-.45 1-1s-.45-1-1-1zm0 3H8c-.55 0-1 .45-1 1s.45 1 1 1h6c.55 0 1-.45 1-1s-.45-1-1-1z"></path>
							</svg>
							<p class="MuiTypography-root MuiTypography-body1 jss633 css-1gflypb">클래스 생성</p>
						</div>
						<span class="MuiTouchRipple-root css-w0pj6f"></span>
					</button>
					<button class="MuiButtonBase-root MuiButton-root jss634 MuiButton-text jss632 MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium MuiButton-root jss634 MuiButton-text jss632 MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium css-17s5gdh" tabindex="0" type="button">
						<div class="jss630">
							<img src="../resources/svg/check.svg" alt="check">
							<p class="MuiTypography-root MuiTypography-body1 jss633 css-1gflypb">등록 완료 클래스</p>
						</div>
						<span class="MuiTouchRipple-root css-w0pj6f"></span>
					</button>
				</div>
			</div>
		</div>
		<div>	
			<div class="view">
				<table border="1">
					<tr style="width: 200px">
						<td rowspan="3">대표 이미지</td>
					</tr>
					<tr>
						<td>클래스 이름${vo.class_name }</td>
					</tr>
					<tr>
						<td>클래스 가격 ${vo.class_price }</td>
					</tr>
				</table>
				
				<div class="btn">
					<button class="modify_btn"> 클래스 관리</button>
					<button class="delete_btn"> 클래스 삭제</button>
				</div>
			</div>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
	$(function() {
		
		$(".delete_btn").click(function() {
			var result = confirm("정말 선택한 클래스를 삭제 하시겠습니까?");

	        if(!result){return false;}
		});
		
		
		$(".modify_btn").click(function() {
			location.href="/main/modify_detail";
		});
	});
	</script>
</body>
</html>