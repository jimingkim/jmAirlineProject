<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석 예약현황</title>
<style>
 #container{text-align: center;margin-top:40px;  margin-left: 600px; margin-right:700px;}
 .myTitle{display:inline-block; font-size :30px; font-weight:bolder; color : #FF6600; padding-bottom : 15px;}
.choiceSeat_Btn{padding:10px; background-color : #FF6600; color : white ;font-weight:bolder; border : 1px solid #FF6600; border-radius:10px; margin-top:20px;}
</style>
</head>
<body>
	<%@include file="../../include/header.jsp"%>
	<div id="container">
	<!-- method에 post하면 주소에 input에서 넘어간값들이 다 나옴 -->
	
	<form method="get" action="/admin/seat/detail_seat_list" id="seatForm" >
		<p class="myTitle" >좌석현황 보기</p>
		<div class="table">
		<table border=1 style="border-collapse:collapse; width : 800px;">
			<thead>
				<tr>
				    <th></th>
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
					 <!-- 여기에 input을 둠으로써 form태그에 이 input값이 넘어가고 서버에는 name으로 넘어가기때문에 ?itnyName=3333 이렇게들어감 -->
					    <td width="50" align="center"><input type="radio" id="check" name="itnyName" value="${itineraryList.itnyName}"/></td>
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
		 </div>
		</form>
		<div class="btns">
		<button type="button" class="choiceSeat_Btn" id="choiceSeat_Btn">좌석현황</button>
		</div>
	</div>
	<%@include file="../../include/aside.jsp"%>
	<%@include file="../../include/footer.jsp"%>
</body>

<script>

	$(function(){
		//id가 choiceSeat인버튼을클릭했을때
	$('#choiceSeat_Btn').click(function(){
		var radioVal = $('input[name="itnyName"]:checked').val();
		
		if(radioVal==null){
			alert("선택해주세요");
		}else{
			$('#seatForm').submit();
		}
	  });
	});

</script>

</html>