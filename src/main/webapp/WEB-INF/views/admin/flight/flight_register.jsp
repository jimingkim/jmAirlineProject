<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<meta charset="UTF-8">
	<title>항공편명 등록</title>
	
<style>
#container{text-align: center;margin-top:29px;  margin-left: 590px; margin-right:700px;}
.myTitle{display:inline-block; font-size :30px; font-weight:bolder; color : #FF6600 ; margin-bottom:30px; }
.inputArea{padding-left: 40px;}
.register_Btn{padding:10px; background-color : #FF6600; color : white ;font-weight:bolder; border : 1px solid #FF6600; border-radius:10px; margin-top:20px;}
</style>
</head>
<body>
	<%@ include file="../../include/header.jsp" %>
	
	<section id="container">

				<form role="form" method="post" autocomplete="off">

					<p class="myTitle">항공편명 등록</p>
					<div class="inputArea">
						<label for="flgtName">항공편명</label>
						<!-- input박스의 값은 name으로 서버에전달됨 -->
						<!-- select박스의 값도 name으로 서버에전달됨 -->
						<!-- input타입이 hidden일땐 value속성에 있는 값을 name으로전달 -->
						<input type="text" id="flgtName" name="flgtName" value="EZ" maxlength = 6  required="required"/>
					</div><br/>
					
					<div class="inputArea">
						<label for="depCode">출발지</label> 
						<select class="depCode" id="depCode" name="depCode">
					       <c:forEach items="${airportList}" var="airportList">
						      <option value="${airportList.aptCode}">${airportList.aptCode}</option>
					       </c:forEach>
				         </select>
			         </div><br/>

			<div class="inputArea">
				<label for="arrCode">도착지</label> <select class="arrCode"
					id="arrCode" name="arrCode">
					<c:forEach items="${airportList}" var="airportList">
						<option value="${airportList.aptCode}">${airportList.aptCode}</option>
					</c:forEach>
				</select>
			</div><br/>

			<div class="inputArea">
				<button type="submit" id="register_Btn" class="register_Btn">항공편
					등록</button>
			</div>

<c:forEach items="${flightList}" var="flightList">
 <input type="hidden" name="flightList" value="${flightList.flgtName}">
 
</c:forEach>


		</form>
		
		

	</section>
	<%@ include file="../../include/aside.jsp"%>
	<%@ include file="../../include/footer.jsp"%>
</body>
<script>
	$(document).ready(function() {
		
		//아래코드는 화면에서 보여주는 값을 지정할수있다
		//id가arrCode인 곳에 arrCode의 option값중 2번째값을 넣겠다
		//$("#arrCode").val($("#arrCode option:eq(2)").val());
		$("#register_Btn").click(function() {
			if ($("#flgtName").val() == "") {
				alert("항공편명을 입력하세요.");
				$("#flgtName").focus();
				return false;
			}
			if ($("#depCode").val() == "") {
				alert("출발공항코드를 입력하세요.");
				$("#depCode").focus();
				return false;
			}
			if ($("#arrCode").val() == "") {
				alert("도착공항코드를 입력하세요.");
				$("#arrCode").focus();
				return false;
			}
			
			//변수명은 jquery로가져오는 depCode라는뜻이고
			//아래 코드는 출발지랑 도착지가같을 때 등록불가하게
			var j_depCode=$("#depCode option:selected").val();
			var j_arrCode=$("#arrCode option:selected").val();
			if(j_depCode==j_arrCode){
				alert("출발지와 도착지가 같습니다.다시 선택해주세요");
				return false;
			} 
			
			//항공편명이 존재할 때 알림
			var flightLists=$("input[name=flightList]").length;
			 //input태그의 name속성이 flgtName인것의 길이!!즉 갯수
			 //alert(flightLists);
			 
			 var flightList = new Array(flightLists);
			 
			for(var i=0; i<flightLists; i++){
				flightList[i]=$("input[name=flightList]").eq(i).val()
				
				if(flightList[i]==$("#flgtName").val()){
					alert("이미 등록된 항공편명입니다");
					return false;
				     }
			       }
					alert("항공편명이 등록되었습니다");
				  })
		     });
</script>

</html>