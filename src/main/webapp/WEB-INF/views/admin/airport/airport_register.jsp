<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>취항지등록</title>
	
<style>
#content{text-align: center;margin-top:50px; margin-bottom:500px; margin-left: 600px; margin-right:700px;}
.myTitle{display:inline-block; font-size :30px; font-weight:bolder; color : #FF6600 ; margin-bottom:30px; }
.register_Btn{padding:10px; background-color : #FF6600; color : white ;font-weight:bolder; border : 1px solid #FF6600; border-radius:10px; margin-top:20px;}
</style>
</head>
<body>
	<%@ include file="../../include/header.jsp" %>
	
	<section id="content">
         <p class="myTitle">취항지 등록</p>
		 <form role="form" method="post" autocomplete="off">
			<table style="margin-left:140px; margin-right:10px; width : 400px; ">
			  <tr>
			  <td>공항코드</td>
			  <td>  <input type="text" id="aptCode" name="aptCode" maxlength="3"/></td>
			  </tr>
			  
			  <tr>
			  <td>도시명</td>
			  <td><input type="text" id="ctyName" name="ctyName" /></td>
			  </tr>
					   
		    </table>	
		     <button type="submit" id="register_Btn" class="register_Btn">취항지 등록</button>
	     </form>
				
				   
				<c:forEach items ="${airportList}" var="airportList">
				<input type="hidden" id="airportList" name="airportList" value="${airportList.aptCode}"/>
				</c:forEach>
				

		</section>
	
	<%@ include file="../../include/aside.jsp" %>
	<%@ include file="../../include/footer.jsp" %>
</body>

<script>
 $(document).ready(function(){
	 
	 
	 $("#register_Btn").click(function(){

		 if($("#aptCode").val()==""){
			 alert("공항코드를 입력하세요.");
			 $("#aptCode").focus();
			 return false;
		 }
		 if($("#ctyName").val()==""){
			 alert("도시명을 입력하세요.");
			 $("#ctyName").focus();
			 return false;
		 }
		 
		 var airportLists=$("input[name=airportList]").length;
		 alert(airportLists); //=>input의 name이 airportList인 값들의 갯수가나옴
		 
		 var airportList = new Array(airportLists);
		 alert(airportList);
		 
		 for(var i=0; i<airportLists;i++){
			 airportList[i]=$("input[name=airportList]").eq(i).val()

			 if(airportList[i]==$("#aptCode").val()){
				 alert("이미 등록된 공항코드입니다");
				 return false; //되돌아감
			 }else{
				 alert("공항코드가 등록되었습니다");
				 return;  //그대로 끝냄
			 } 
		  } 
		
	 })
 });
</script>
</html>