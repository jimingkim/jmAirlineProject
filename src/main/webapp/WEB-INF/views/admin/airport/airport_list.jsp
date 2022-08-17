<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취항지 목록</title>
<style>
 #container{text-align: center;margin-top:40px;  margin-left: 600px; margin-right:700px;}
 .myTitle{display:inline-block; font-size :30px; font-weight:bolder; color : #FF6600; padding-bottom : 15px;}

</style>
</head>
<body>
<%@include file="../../include/header.jsp"%>
	<div id="container">
	   <p class="myTitle">취항지 목록</p>
	 	  <table  border=1 style="border-collapse:collapse; ">
			<thead>
				   <tr>
					   <th width="100" align="center">공항코드</th>
					   <th width="400" align="center">도시명</th>
					   <th width="100" align="center"></th>
				   </tr>
			</thead>
			<tbody>
				<c:forEach items="${airportList}" var="airportList">
					<tr>
						<td width="100" align="center">${airportList.aptCode}</td>
						<td width="400" align="center">${airportList.ctyName}</td>
						<td width="100" align="center">
						    
						    <form method="post">
						      <button type="button" class="modify btn">수정</button>
						      <input type="hidden" name="aptCode" value="${airportList.aptCode}">
						      <button type="button" class="delete btn">삭제</button> 
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
	  var aptCode = $(this).parent().parent().siblings().eq(0).text();
	  var result = confirm(aptCode+"에 대한 정보를 수정하시겠습니까?");
	  
	  if(result){
		  location.href = "/admin/airport/airport_modify?aptCode="+aptCode;
	  } else{
		  return false;
	  }
  });

		    //매핑된 메소드로이동
		    //location.href = "/admin/airport/airport_modify?aptCode="+aptCode;

  
  
  $(".delete").click(function(){
	  var aptCode= $(this).prev().prev().parent().parent().siblings().eq(0).text();
		  //$(this).prev().prev().parent().parent().siblings().eq(0).text();
	  var result = confirm(aptCode+"를 삭제하시겠습니까?");
	  
	  if(result){
		  airport_delete(aptCode);
		 //alert(aptCode+"가 삭제되었습니다");
	  }else{
		  return false;
	  }
  });
});

function airport_delete(aptCode){
	
	
	$.ajax({
		
		type:"post",
	    url:"/admin/airport/airport_delete",
	    data:{aptCode:aptCode},
	    success:function(data){
	    	if(data==1){
	    		alert("삭제했습니다");
	    		location.replace("airport_list");
	    	  }
	    	  
	    	}
	    });
}
</script>
</html>