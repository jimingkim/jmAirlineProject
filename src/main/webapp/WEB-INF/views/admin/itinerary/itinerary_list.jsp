<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비행일정 관리</title>
<style>
 #container{text-align: center;margin-top:40px;  margin-left: 600px; margin-right:700px;}
 .myTitle{display:inline-block; font-size :30px; font-weight:bolder; color : #FF6600; padding-bottom : 15px;}
 .modify_Btn{padding:10px; background-color : #28A0FF; color : white ;font-weight:bolder; border : 1px solid #28A0FF; border-radius:10px; margin-top:20px;}
.delete_Btn{padding:10px; background-color : #FF6600; color : white ;font-weight:bolder; border : 1px solid #FF6600; border-radius:10px; margin-top:20px;}
.btns{width:300px; padding-left:100px; margin:0px;}
</style>
</head>
<body>
	<%@include file="../../include/header.jsp"%>
	<div id="container">
       <p class="myTitle">비행일정 목록</p>
        <div class ="table" style="padding-left : 10px; margin-right: 700px;">
		 <table border=1 style="width : 800px; border-collapse:collapse;">
			<thead>
				<tr>
					<th width="50"></th>
					<th width="100" align="center">일정번호</th>
					<th width="70" align="center">항공편명</th>
					<th width="50" align="center">출발지</th>
					<th width="50" align="center">도착지</th>
					<th width="100" align="center">출발시각</th>
					<th width="100" align="center">도착시각</th>
					<th width="100" align="center">기종번호</th>
					<th width="100" align="center">항공권가격</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${itineraryList}" var="itineraryList">
					<tr>
					    <td width = "50"><input type="radio" name="itnyName" id="itnyName" value="${itineraryList.itnyName}" /></td>
						<td width="100" align="center">${itineraryList.itnyName}</td>
						<td width="70" align="center">${itineraryList.flgtName}</td>
						<td width="50" align="center">${itineraryList.depCode}</td>
						<td width="50" align="center">${itineraryList.arrCode}</td>
						<td width="100" align="center">${itineraryList.depTime}</td>
						<td width="100" align="center">${itineraryList.arrTime}</td>
						<td width="100" align="center">${itineraryList.acftName}</td>
						<td width="100" align="center">${itineraryList.itnyPrice}</td>
						
						
					</tr>
					
				</c:forEach>
			</tbody>
		</table> 
		               <div class="btns" >
		                   <button type="button" id="modify_Btn" class="modify_Btn">수정</button>
						   <button type="submit" id ="delete_Btn" class="delete_Btn">삭제</button>
						    <!-- hidden으로안넘겼을때 나는 js에서 var id= $(this).이런식으로 값넘겨서 jquery사용 -->
	
						</div>
						
			
						   <!-- value값을 name속성을 이용해 클래스로넘겨줌 -->
					
					
						 <!-- 삭제 시 부모테이블이 나은 자식테이블에 정보가있으면 삭제불가여서 참조를 신청한 자식테이블에 on delete cascasde해줌 -->
						
					</div>
		</div>
	</div>
	<%@include file="../../include/aside.jsp"%>
	<%@include file="../../include/footer.jsp"%>
</body>

<script>
 $(document).ready(function(){
	
	 $("#modify_Btn").click(function(){
		 var itnyName = $("input[name=itnyName]:checked").val();
		 if(itnyName==null){
			 alert("수정하실 일정 하나를 선택해주세요");
			 return false;
		    }
		 
	       location.href = "/admin/itinerary/itinerary_modify?itnyName="+itnyName;
	      });
	 
	 $("#delete_Btn").click(function(){
		  
		 var itnyName = $("input[name=itnyName]:checked").val();
		 if(itnyName==null){
			 alert("삭제하실 일정 하나를 선택해주세요");
			 return false;
		    }
	     var result= confirm(itnyName+"일정을 정말 삭제하시겠습니까?");
		  if(result==true){
			 alert("삭제하였습니다");
			 location.href = "/admin/itinerary/itinerary_list?itnyName="+itnyName;
	       } else {
	          return false;
	       }
	 })
 });
</script>
</html>