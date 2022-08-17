<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/include/header.jsp" />

	<style>
	*{
		font-family: 'Noto Sans KR', sans-serif;
		
		list-style: none;
		text-decoration: none;
		border-collapse: cokkapse;
		margin: 0px;
		padding: 0px;
		color: #000;
	}
	div.text ul li a{
		text-decoration-line:none;
		color:#000;
	}
	div.text ul li a:hover{
		font-weight:bold;
		cursor:pointer;
	}
	.f_logo img{
		width: 30%;
		height: 30%;
	}
	.footer_inner{
		border:1px solid rgba(0,0,0,0.0); 
		position:relative; 
		width:70%;
		height:300px;
		left:250px;
		right:150px;
	}
	#f_left{
		position:absolute; left:30px; bottom:20px; width:230px; 
	}
	#f_center{
		position:absolute; left:570px; bottom:20px; width:200px;
	}
	#f_right{
		position:absolute; left:1000px; bottom:20px; width:370px;
	}
	
	
	</style>
	
	
</head>

			

<div id="footer">
	<div class="footer_inner">
		<div id="f_left" class="left">
			<div class="foot_logo">
				<a class="f_logo" href="/"><img src="/resources/images/ezenline_logo.png"  alt="ezen_logo" title="HOME" /></a>
			</div>
			
			<div class="text">
				<ul>
					<li><p class="copyright" style="margin:15px 0 0; font-size:0.9em;">Copyrignt 2021 BY EZENLINE CO., LTD.ALL Rights reserved.</p></li>
				</ul>
			</div>
		</div>
		
		<div id= "f_center" class="text">
			<ul>
				<li>고객센터 1234-5678</li>
				<li>(오전09시~오후18시, 주중)</li>
				<li>단체문의(10명 이상)<br/>1234-5679</li>
			</ul>
		</div>
		
		<div id= "f_right" class="text">
			<ul>
				<li>
					(주) 이젠에어 대표이사 김이젠<br/>
					사업자등록번호 111-22-33333<br/>
					통신판매업신고 2021-2022<br/>
					서울시 강서구 하늘길 75-17, 이젠에어 타워 B동 507호
				</li>
			</ul>
		</div>
		
		
	</div> <!-- //"footer_inner" -->
</div>