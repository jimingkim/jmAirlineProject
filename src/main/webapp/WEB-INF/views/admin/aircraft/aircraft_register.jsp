<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>항공기 등록</title>
	
<style>
#container{text-align: center;margin-top:29px;  margin-left: 590px; margin-right:700px;}
.myTitle{display:inline-block; font-size :30px; font-weight:bolder; color : #FF6600 ; margin-bottom:30px; }
.inputArea{padding-left: 70px;}
.register_Btn{padding:10px; background-color : #FF6600; color : white ;font-weight:bolder; border : 1px solid #FF6600; border-radius:10px; margin-top:20px;}
</style>
</head>
<body>
	<%@ include file="../../include/header.jsp" %>
	
	<section id="container">

				<form role="form" method="post" autocomplete="off">
                    <p class="myTitle">항공기 등록</p>
					<div class="inputArea">
						<label class="acftName">항공기 등록번호</label>
						 <input type="text" id="acftName" name="acftName" value="HL" maxlength=6/>
					</div><br/>
					
					<div class="inputArea">
						<label class="acftModel">기종</label>
						 <input type="radio" id="acftModel" name="acftModel" value="B737-800"/>B737-800
						 <input type="radio" id="acftModel" name="acftModel" value="B767-300" />B767-300
					</div><br/>
					
					<div class="inputArea">
						<label class="acftModel">최대 탑승인원</label>
						<input type="radio" id="acftCarrd" name="acftCarrd" value="10"/>10명
						<input type="radio" id="acftCarrd" name="acftCarrd" value="20"/>20명
					</div><br/>
					
					<div class="inputArea">
						<button type="submit" id="register_Btn" class="register_Btn">항공기 등록</button>
					</div>
					
				</form>

	</section>
		<%@ include file="../../include/aside.jsp" %>
	    <%@ include file="../../include/footer.jsp" %>
</body>

<script>
$(document).ready(function(){
	 
	 
	 $("#register_Btn").click(function(){
		 
		 if($("#acftName").val()==""){
			 alert("항공기 등록번호를 입력해주세요");
			 $("#acftName").focus();
			 return false;
		 }
		 
		 //jquery를 사용하여 radio버튼의 값을 가져온당
		//text타입일 경우 val()로찾고 radio인경우엔 text()로 찾는다
		var radioValLength = $('input:radio[name=acftModel]:checked').length;
		//alert(radioValLength); //이값이 1이라는건 radio에서 하나체크되었다는것
		if(radioValLength==0){
			alert("기종을 선택해주세요");
			return false;
		} 
		alert("기종이 등록되었습니다");
		
		/*else{
			var radioVal = $('input:radio[name=acftModel]:checked').val();
			alert(radioVal);
			 if(radioVal=="B737-800"){
				 $('input:radio[name=acftCarrd]:input[value='+radioVal+']').attr("checked",true);
			 } else{
				 $('input:radio[name=acftCarrd]:input[value='+radioVal+']').attr("checked",true);
			 }
		}
		
     */
	
		  
		 /* if($("#acftModel").val()==""){
			  alert("기종을 선택하세요");
			  $("#acftModel").focus();
			  return false;
		  } else if ($("#acftModel").val()=="B737-800"){
		     var acftCarrd = $(this).prev().sibling().eq(0).val();
		     alert(acftCarrd);
	       } else if($("#acftModel".val()=="B767-300"){
	    	   var acftCarrd = $(this).prev().sibling().eq(1).val();
	    	   alert(acftCarrd);
	       })
	    	   */
	       
	  })
	  
	 
  });
</script>
</html>