<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<head>
   <style>
   *{font-family: 'Poppins', sans-serif;}
   .nav{ width:100%;height:80px; background:rgba(0,0,0,0.0);display:flex;padding: 1rem; position: fixed;z-index:5; top: 0; left: 0; right: 0;justify-content: center; align-items: center;}
   .N:hover{ background: #E3E3E3;}
   .nav > li{ padding: 30px;}
   .nav > li a{text-align: center; }
   .nav > li a:hover{ background:rgba(0,0,0,0.0);color: #000;}
   li a {color: #000;}
   ul, ol, li { list-style:none; margin:0; padding:0; }
   ul.nav > li { display:inline-block; width:130px; padding:30px 10px;  text-align:-webkit-match-parent; position:relative; right:10px; }
   ul.nav > li:hover ul.submenu { display:block; }
   ul.nav > li ul.submenu {  display:none; position:absolute; top:30px; text-align:center; }
   ul.nav > li ul.submenu > li {  display:inline-block; width:160px;  padding:15px 20px; background:#E3E3E3;  text-align:left;  border-bottom:1px solid #000;  right:5px;  cursor:pointer; transition: background .3s ease-in-out; }
   ul.nav > li ul.submenu > li#bottom { border-bottom:1px solid rgba(0,0,0,0.0); }
   ul.nav > li ul.submenu > li:hover { transition: background .3s ease-in-out; background:#FFF; }
   ul.nav > li ul.submenu > li a { text-decoration-line:none; }
   ul.nav > li.menu { padding:10px; cursor:pointer; }
   ul.nav > li.menu a.title { font-weight:bold; }

   
   </style>
</head>
<body>
<div id="container">
   <ul class="nav N">
    
      <c:if test="${user.verify == null || user.verify == 0}">
      <li class="menu">
         <a class="title" href="#">예매</a>
         <ul class="sub submenu">
            <li><a href="/airline/reservation/search">항공권 예매</a></li>
            <li><a href="/airline/reservation/checkReservation">예약 조회</a></li>
            <li><a href="/airline/reservation/webCheck-in">웹 체크인</a></li>
         </ul>
      </li>
      
      <li class="menu">
         <a class="title href="#">마이페이지</a>
         <ul class="sub submenu">
            <li><a href="/board/myPage/inqueryBoard">문의하기</a></li>
            <li><a href="/user/updateUser">회원정보 수정</a></li>
         </ul>
      </li>
      
      <li class="menu">
        <c:if test ="${user==null }">
           <a class="title href="#">로그인/회원가입</a>
            <ul class="sub submenu">
            <li><a href="/user/signin">로그인</a></li>
            <li><a href="/user/signup">회원가입</a></li>
            </ul>
         </c:if>
         <c:if test="${user != null}">
		   <c:if test="${user.verify == 0}">
		    <li style="padding-right:50px;"><a href ="/user/signout">${user.userName}님 환영합니다.</a></li>
		   </c:if>
		 </c:if>
	   </li>
</c:if>

      
      <c:if test="${user.verify == 1}">
      
      <li class="menu">
         <a class="title href="#">취항지 관리</a>
         <ul class="sub submenu">
            <li><a href="/admin/airport/airport_register">취항지 등록</a></li>
            <li><a href="/admin/airport/airport_list">취항지 목록</a></li>
         </ul>
      </li>
      
      <li class="menu">
         <a class="title" href="#">항공기 관리</a>
         <ul class="sub submenu">
          <li><a href="/admin/aircraft/aircraft_register">항공기 등록</a></li>
          <li><a href="/admin/aircraft/aircraft_list">항공기 목록</a></li>
         </ul>
      </li>
      
      <li class="menu">
         <a class="title" href="#">항공편명 관리</a>
         <ul class="sub submenu">
				<li><a href="/admin/flight/flight_register">항공편명 등록</a></li>
				 <li><a href="/admin/flight/flight_list">항공편명 목록</a></li>
         </ul>
      </li>
      
      <li class="menu">
         <a class="title" href="#">비행일정 관리</a>
         <ul class="sub submenu">
           <li><a href="/admin/itinerary/itinerary_register">비행일정 등록</a></li>  
           <li><a href="/admin/itinerary/itinerary_list">비행일정 목록</a></li>
		 </ul>
      </li>
      
      <li class="menu">
         <a class="title" href="/">항공편 좌석관리</a>
         <ul class="sub submenu">  
           
           <li><a href="/admin/seat/seat_list">좌석현황</a></li>
		 </ul>
      </li>
      
      
      
      <li class="menu">
         <a class="title" href="#">문의게시판</a>
         <ul class="sub submenu">
            <li><a href="/admin/m_board/inqueryList">답변하기</a></li>
         </ul>
      </li>
      
      <li class="menu">
        <c:if test ="${user==null}">
           <a class="title" href="#">로그인/회원가입</a>
            <ul class="sub submenu">
            <li><a href="/user/signin">로그인</a></li>
            <li><a href="/user/signup">회원가입</a></li>
            </ul>
         </c:if>
         <c:if test="${user != null}">
		   
		   <li style="padding-right:50px;"><a href ="/user/signout">관리자 ${user.userName}님 환영합니다.</a></li>
		   
		 </c:if>
	   </li>
      </c:if>
   </ul>
</div>
</body>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>