<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취항지 목록 수정</title>
<style>
.container{padding-left:500px;}

</style>
</head>
<body>
<%@include file="../../include/header.jsp"%>
	
	<div class="container">
		 
		 
		<form method="post" action="/admin/airport/airport_modify">
			  <h3><strong>${aptCode}</strong>공항 정보 수정</h3>
			  
			   <div>
			     <label class="control-label col-sm-3">공항코드</label>
			      <div class="col-sm-3">
			        <input type="text" id="aptCode" name="aptCode" value="${aptCode}" readonly="readonly">
			      </div>
			   </div>
			   
			   <div>
			     <label class="control-label col-sm-3">도시명</label>
			      <div class="col-sm-3">
			        <input type="text" id="ctyName" name="ctyName">
			      </div>
			   </div>
	
		  <button type="submit" id="modify">수정</button>
		  <button type="button" id="cancel">취소</button>	
		 
		 </form>
		
	</div>
	<%@include file="../../include/aside.jsp"%>
	<%@include file="../../include/footer.jsp"%>
</body>

<script>
$(document).ready(function() {
	   $('#cancel').click(function(){
		   history.back();
		   //location.href="/admin/airport/airport_list";//jsp적어준다
	   });
	   
      $("#modify").click(function(){
		   
		   if($("#ctyName").val()==""){
			   alert("수정할 도시명을 입력하세요");
			   $("#ctyName").focus();
			   return false;
		   } else {
			   alert("수정하였습니다");
			//airport_modify();
		   }
	   });
});

function airport_modify(){
	var aptCode=$("#aptCode").val();
	var ctyName=$("#ctyName").val();
	alert(aptCode);
	alert(ctyName);
	
	$.ajax({
		type:"post",
		url : "/admin/airport/airport_modify",
		data :{aptCode:aptCode,ctyName:ctyName},
	    success:function(data){
	    	 if(data==1){
	    		 alert("수정했습니다");
	    		 location.replace("airport_list");
	    	 } else {
	    	 alert("해당 공항은 수정할 수 없습니다");
	     }
	    }
	});
}


  


</script>
</html>