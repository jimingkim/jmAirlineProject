<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>비행일정 수정</title>
	
<style>
#content{text-align: center;margin: 200px 200px;}
.inputArea{ padding-left: 500px;}
</style>
</head>
<body>
	<%@ include file="../../include/header.jsp" %>
	
	<section id="container">

				<form role="form" method="post" autocomplete="off" action="/admin/itinerary/itinerary_modify">

					<div class="inputArea">
					  <h2>비행일정 수정</h2>
						<label for="itnyName">일정번호</label>
						<input type="text" id="itnyName" name="itnyName" value="${itineraryVO.itnyName}" readonly="readonly"/>
					    **일정번호는 해당 항공편 운항날짜-임의숫자 입니다.**
					</div>
					
					<div class="inputArea">
						<label for="flgtName">항공편명</label>
						<select class="flgtName" name="flgtName">
							 <option value="${itineraryVO.flgtName}" selected>${itineraryVO.flgtName}</option>
							<c:forEach items="${flightList}" var="flightList">
							  <option value="${flightList.flgtName}">${flightList.flgtName}</option>
							</c:forEach>
						</select>
					</div>
					
					<div class="inputArea">
						<label for="depTime">출발시각</label>
						<input type="datetime-local" id="depTime" name="depTime" value="0000-00-00T00:00">
					</div>
					
					<div class="inputArea">
						<label for="arrTime">도착시각</label>
						<input type="datetime-local" id="arrTime" name="arrTime" >
					<P>**모든 시간들은 출발지 혹은 도착지 현지시간입니다.**</P>
					</div>
					
					
					
					
					<div class="inputArea">
						<label for="acftName">기종번호</label>
						<select class="acftName" name="acftName">
							 <option value="${itineraryVO.acftName}" selected >${itineraryVO.acftName}</option>
							<c:forEach items="${aircraftList}" var="aircraftList">
							 <option value="${aircraftList.acftName}">${aircraftList.acftName}</option>
							</c:forEach>
						</select>
					</div>
					
					<div class="inputArea">
						<label for="itnyPrice">항공권가격</label>
						<input type="number" pattern="###,###,###" id="itnyPrice" name="itnyPrice" value="${itineraryVO.itnyPrice}"/>
					</div>
	
	
					<div class="inputArea">
						<button type="submit" id="register_Btn">비행일정 수정</button>
						<input type="reset" value="리셋"/>
					</div>
					
				</form>

		</section>
		
	<%@ include file="../../include/aside.jsp" %>
	<%@ include file="../../include/footer.jsp" %>
	</body>
	<script>
	$(document).ready(function() {
		$("#register_Btn").click(function() {
			if ($("#itnyName").val() == "") {
				alert("일정번호를 입력하세요.");
				$("#itnyName").focus();
				return false;
			}
			
			var flgtName = $("#flgtName option:selected").val();
			if (flgtName==""){
				alert("항공편명을 선택하세요.");
				
				return false;
			}
			if ($("#depTime").val() == "") {
				alert("출발시각을 입력하세요.");
				$("#depTime").focus();
				return false;
			}
			if ($("#arrTime").val() == "") {
				alert("도착시각을 입력하세요.");
				$("#arrTime").focus();
				return false;
			}
			
			var acftName= $("#acftName option:selected").val();
			if (acftName=="") {
				alert("기종번호를 선택하세요.");
				
				return false;
			}
			if ($("#itnyPrice").val() == "") {
				alert("항공권가격을 입력하세요.");
				$("#itnyPrice").focus();
				return false;
			}
			alert("비행일정이 수정되었습니다");
		})
	});
</script>
</html>