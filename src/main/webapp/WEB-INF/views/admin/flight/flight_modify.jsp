<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<meta charset="UTF-8">
	<title>항공편 수정</title>
	
	<style>
.inputArea{
	   padding-left: 500px;
	}
	</style>
</head>
<body>
	<%@ include file="../../include/header.jsp" %>
	
	<section id="container">
             <!-- 왜 action을 줘야하는지...이론대로라면 action안줘도 post로처리하는 flight_modify로가야하는거아닌가 -->
				<form role="form" method="post" autocomplete="off" action="/admin/flight/flight_modify">

					<div class="inputArea">
					<h2>항공편 수정</h2>
						<label for="flgtName">항공편명</label>
						<input type="text" id="flgtName" name="flgtName" value="${flightVO.flgtName}" readonly="readonly"/>
					</div>
					
					<div class="inputArea">
                  <label for="depCode">출발지</label> 
                  <select class="depCode" id="depCode" name="depCode">
                      <option value="${flightVO.depCode}" selected>${flightVO.depCode}</option>
                      <c:forEach items="${airportList}" var="airportList">
                      <option value="${airportList.aptCode}" >${airportList.aptCode}</option>
                       <!-- value에 ${flightVO.depCode}넣었더니 모든값이 같아짐-->
                      </c:forEach>
                   </select>
         </div>

         <div class="inputArea">
            <label for="arrCode">도착지</label> 
              <select class="arrCode" id="arrCode" name="arrCode">
               <option value="${flightVO.arrCode}" selected="selected">${flightVO.arrCode}</option>
               <c:forEach items="${airportList}" var="airportList">
                 <option value="${airportList.aptCode}">${airportList.aptCode}</option>
                  
                 </c:forEach>
            </select>
         </div>

           <div class="inputArea">
             <button type="submit" id="submit">항공편 수정</button>
           </div>
		</form>

	</section>
	<%@ include file="../../include/aside.jsp"%>
	<%@ include file="../../include/footer.jsp"%>
</body>

<script>

$(function(){
	 $("#submit").click(function(){

        //jquery로 selected된 값 가져오기
		 var j_depCode =$("#depCode option:selected").val();
         var j_arrCode =$("#arrCode option:selected").val();

        //기본지정값,즉 원래 값
		 var initialDepcode = $("#depCode option:eq(0)").val();
		 var initialArrcode = $("#arrCode option:eq(0)").val();
		 //alert(selected);
		 if(initialDepcode==j_depCode&&initialArrcode==j_arrCode){
			 data = confirm("수정한 사항이 없습니다.그대로 진행하시겠습니까?");
			 if(data==true){
				 location.href="/admin/flight/flight_list" //매핑된메소드로감
				 return; //그대로끝냄
			   }else{
				 return false;//되돌아감
			   }
			 } else if(j_depCode==j_arrCode){
				 alert("출발지와 도착지가 같습니다.다시 선택해주세요");
				 return false;
			 }
		 alert("수정되었습니다");
			 
		 })
		 //js로 selected된 값 가져오기
		 //var jsdepCode =document.getElementById("depCode")
		// alert(jsdepCode.options[jsdepCode.selectedIndex].value);
		// var jsarrCode =document.getElementById("arrCode")
		// alert(jsarrCode.options[jsarrCode.selectedIndex].value);
		
	});

</script>
</html>