<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>비행일정 등록</title>
	
	<style>
#content{text-align: center;margin-top:50px; margin-bottom:500px; margin-left: 600px; margin-right:700px;}
.myTitle{display:inline-block; font-size :30px; font-weight:bolder; color : #FF6600 ; margin-bottom:30px; }
.register_Btn{padding:10px; background-color : #FF6600; color : white ;font-weight:bolder; border : 1px solid #FF6600; border-radius:10px; margin-top:20px;}
.inputArea{  padding-left: 30px;}
	</style>
</head>
<body>
	<%@ include file="../../include/header.jsp" %>
	
	<section id="content">

					   <p class="myTitle">비행일정 등록</p>
				<form role="form" method="post" autocomplete="off">

					<div class="inputArea">
						<label for="itnyName">일정번호</label>
						<input type="text" id="itnyName" name="itnyName" placeholder="20210601-123" maxlength=12/><br/>
					    (*일정번호는 해당 항공편 운항날짜-임의숫자 입니다.*)
					</div><br/>
					
					<div class="inputArea">
						<label for="flgtName">항공편명</label>
						<select class="flgtName" id="flgtName" name="flgtName">
							<option value="" selected disabled>--선택--</option>
							<c:forEach items="${flightList}" var="flightList">
							  <option value="${flightList.flgtName}">${flightList.flgtName}</option>
							</c:forEach>
						</select>
					</div><br/>
					
					<div class="inputArea">
						<label for="depTime">출발시각</label>
						<input type="datetime-local" id="depTime" name="depTime">
					</div><br/>
					
					<div class="inputArea">
						<label for="arrTime">도착시각</label>
						<input type="datetime-local" id="arrTime" name="arrTime" value="0000-00-00T00:00"><br/>
					 (*모든 시간들은 출발지 혹은 도착지 현지시간입니다.*)
					</div><br/>
					
					
					
					
					<div class="inputArea">
						<label for="acftName">기종번호</label>
						<select class="acftName" id="acftName" name="acftName">
							<option value="" selected disabled>--선택--</option>
							<c:forEach items="${aircraftList}" var="aircraftList">
							<option value="${aircraftList.acftName}">${aircraftList.acftName}</option>
							</c:forEach>
						</select>
					</div><br/>
					
					<div class="inputArea">
						<label for="itnyPrice">항공권가격</label>
						<input type="number" pattern="###,###,###" id="itnyPrice" name="itnyPrice" required="required"/>
					</div><br/>
					
					
					<div class="inputArea">
						<label for="itnyPrice">할인율</label>
						<input type="number" id="discount_rate" name="discount_rate" value="0"/> %
					</div><br/>
					
					
					
					<div class="inputArea">
						<button type="submit" id="register_Btn" class="register_Btn">비행일정 등록</button>
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
			alert("비행일정이 등록되었습니다");
		})
	});
</script>
</html>