<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공기 목록</title>
<style>
 #container{text-align: center;margin-top:40px;  margin-left: 600px; margin-right:700px;}
 .myTitle{display:inline-block; font-size :30px; font-weight:bolder; color : #FF6600;  padding-bottom : 15px; }
.delete_btn{padding:10px; background-color : #FF6600; color : white ;font-weight:bolder; border : 1px solid #FF6600; border-radius:10px; margin-top:20px;}
</style>
</head>
<body>
	<%@include file="../../include/header.jsp"%>
	<div id="container">
		 <p class="myTitle">항공기 목록</p>
		  <table border=1 style="border-collapse:collapse;">
			<thead>
				<tr>
				    <th width="50" align="center"></th>
					<th width="100" align="center">기종번호</th>
					<th width="300" align="center">항공기종</th>
					<th width="100" align="center">최대승객수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${aircraftVO}" var="aircraftList">
					<tr>
					   <td width="50" align="center"><input type="radio" name="acftName" value="${aircraft.acftName}" id="acftName"></td>
						<td width="100" align="center">${aircraftList.acftName}</td>
						<td width="300" align="center">${aircraftList.acftModel}</td>
						<td width="100" align="center">${aircraftList.acftCarrd}</td>
					</tr>
				 </c:forEach>
			</tbody>
		</table>
						<form id="deleteform" method="post">
							<button type="submit" id = "delete_btn" class="delete_btn">삭제</button>
						</form>
	</div>
	<%@include file="../../include/aside.jsp"%>
	<%@include file="../../include/footer.jsp"%>
</body>

<script>

 $(document).ready(function(){
	 $("#delete_btn").click(function(){
		 
		 var acftName = $("input[name=acftName]:checked").val();
		// var acftName = $(this).prev().parent().parent().siblings().eq(0).text();
		 result = confirm("기종번호"+acftName+"항공기를 삭제하시겠습니까?");
		 
		 if(result){ 
			 alert("삭제되었습니다");
			 $("#deleteform").submit();
		 } else{
			 return false;
		 }
	 });
	 
 });
 </script>
</html>