<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공편명 목록</title>
<style>
#container{text-align: center;margin-top:40px;  margin-left: 600px; margin-right:700px;}
 .myTitle{display:inline-block; font-size :30px; font-weight:bolder; color : #FF6600; padding-bottom : 15px;}

</style>
</head>
<body>
	<%@include file="../../include/header.jsp"%>
	<div id="container">
	  <p class="myTitle">항공편명 목록</p>
		<table border=1 style="border-collapse:collapse; ">

			<thead>
				<tr>
					<th width="100" align="center">항공편명</th>
					<th width="200" align="center">출발지</th>
					<th width="200" align="center">도착지</th>
					<th width="100" align="center"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${flightList}" var="flightList">
					<tr>
						<td width="100" align="center">${flightList.flgtName}</td>
						<td width="200" align="center">${flightList.depCode}</td>
						<td width="200" align="center">${flightList.arrCode}</td>
						<td width="100" align="center">
						  
						  <form role="form" method="post" >
						   <button type="button" id= "modify" class="modify btn">수정</button>
						   <input type="hidden" name="flgtName" id="flgtName" value="${flightList.flgtName}" />
						   <button type="submit" id ="delete" class="delete_${flightList.flgtName}_btn">삭제</button>
						  </form>
					     
					    </td>
					</tr>
					
				</c:forEach>
			</tbody>
		</table>
	</div>
	<%@include file="../../include/aside.jsp"%>
	<%@include file="../../include/footer.jsp"%>
</body>

<script>
 $(document).ready(function(){
	 
	 $(".modify").click(function(){
		 var flgtName=$(this).parent().parent().siblings().eq(0).text();
		 result = confirm(flgtName+"편을 수정하시겠습니까?");
		 if(result==true){
		      location.href ="/admin/flight/flight_modify?flgtName="+flgtName;  //get방식
		  } else {
		   return false;
		 }
	   });
	   
	  $("#delete").click(function(){
		   
		  var flgtName= $(this).prev().prev().parent().parent().siblings().eq(0).text();
		  
		   result = confirm(flgtName+"편을 삭제하시겠습니까?");
	  
		   if(result){
              alert("삭제되었습니다");
		    } else {
		      return false;
		    }
		  });
	});
</script>
</html>