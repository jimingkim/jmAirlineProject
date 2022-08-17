<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공권 예매</title>
<%@include file="include/header.jsp" %>

<style>
<!--position에 absolute주니까 완전먹통이였음;;;;;;-->
 <!--search-section 전체의 위치-->
.search-section { }
<!--search-section의 자식요소 title태그-->
.search-section > .title{padding-bottom:20px; background-color: #EEE8AA; } 
.title h2{font-size:25pt; font-weight:bold;}
<!--search-section의 자식요소 all태그-->
.search-section div.all{border:3px dotted orange; padding-bottom:30px;}
<!--search-section의 자식요소 final태그-->
.search-section div.final{padding-top:30px;}
.layer01{position:relative; width:100%; height:100%; background:white; display:none;}
.search-section div.all div.pop-layer {border:1px solid grey; width:400px; margin-bottom:30px;}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>

</head>

<body style="font-family:'Noto Sans KR',sans-serif;">
<br>
<br>



  <div class="search-section" align="center" style="width:700px; padding-bottom:20px;margin-left:500px; border:2px solid #FF69B4;" >
    <div class="title" style="margin-bottom:12px;background-color:#FF69B4;">
      <h2>항공권 예매</h2>
    </div>
    <form name="submitForm" id="testForm" action="/airline/reservation/avail_list" method="post">
    <div class="all">
       <div class="option-shedule">
         <input type="radio" name="way" value="왕복" checked/>왕복&nbsp; &nbsp;&nbsp;
         <input type="radio" name="way" value="편도"/>편도
       </div>
     <br/>
     
       <div class="option-shedule">
        <select name= "depCode" id="depCode" style="width:200px; padding:2px;font-size:15px;">
          <option  value="" selected disabled>출발지 선택</option>
          <c:forEach items="${airportList}" var="airportList">
          <option value="${airportList.aptCode}">${airportList.ctyName}(${airportList.aptCode})
           </option>
         </c:forEach>
        </select>
      
        <select name= "arrCode" id="arrCode" style="width:200px; padding:2px;font-size:15px;">
           <option  value="" selected disabled>도착지 선택</option>
          <c:forEach items="${airportList}" var="airportList">
          <option value="${airportList.aptCode}">${airportList.ctyName}(${airportList.aptCode})
           </option>
         </c:forEach>
         </select>
       </div>
     <br/>
     
     <div class="option-schedule" >
     <div class="goDate" style="float:left; margin-left:140px;">
      <input type="text" value="가는날 선택" name="depTime" id="depTime0" style="width:200px; padding:2px;font-size:15px;"/>
     </div>
       <div class="comeDate" style="float:left; margin-left:5px; padding-right: 0px;">
      <input type="text" value="오는날 선택" name="depTime" id="depTime2" style="width:200px; padding:2px;font-size:15px;"/>
     </div>
     </div>
   <br/><br/><br/>
   
    <div class="pop-layer" >
     <div class="option-schedule">
      <div class="pop">
       성인<span class="pax_count adult" data-class="adult">1</span>명,소아
                  <span class="pax_count child" data-class="child">0</span>명,유아
                  <span class="pax_count infant" data-class="infant">0</span>명
      
      </div>
     </div>
     
     <div class="option-schedule">
      <ul class="layer01" style="padding-top:4px;">
        <li>성인(만 13세 이상) <button type="button" class="btn btn-sm minus">─</button>&nbsp;<span>1</span>명&nbsp;<button type="button" class="btn btn-sm plus">┼</button></li>
         <li>소아(만 13세 미만) <button type="button" class="btn btn-sm minus">─</button>&nbsp;<span>0</span>명&nbsp;<button type="button" class="btn btn-sm plus">┼</button></li>
        <li> 유아(만 2세  미만)&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-sm minus">─</button>&nbsp;<span>0</span>명&nbsp;<button type="button" class="btn btn-sm plus">┼</button></li>
        <li>  <button type="button" id = "close" class="close">닫기</button></li>
      </ul>
     </div>
     </div>
     
   
    </div>
    
     <div class= "final" >
        <input type="submit" id="submit" value="항공권 조회" style="border-radius: 10px;  color: white; font-size: 20px; font-weight:bolder; border: 1px solid #FF69B4; background-color: #FF69B4; padding: 7px;"/>
     </div>
     <!-- hidden에는 초기 value값을 주지않아도대 -->
    <input type="hidden" name="carrierd" id="carrierd"/>
     </form>
   
         
     
     
     <br/> <br/>
    
  </div>

  
    <%@include file="include/aside.jsp"%>
    <%@include file="include/footer.jsp"%>

<!-- form태그에있는 모든값들을넘기고싶을때 
    var queryString = $("form[name=testForm]").serialize();-->
</body>
<script>
$(document).ready(function(){
	  $("#depTime0").datepicker();
	  $("#depTime2").datepicker();

	   $.datepicker.setDefaults({
		   dateFormat:'yy-mm-dd',
		   minDate:0,              //과거날짜는 선택못하도록
		   maxDate : "+3m" //세달후까지
	   });

  //왕복or편도 체크 후 편도이면 오는 날 달력을 비활성화

  $('input[name="way"]').click(function(){
    var way= $('input[name="way"]:checked').val();
	if(way=="편도"){
		$('.comeDate').css('display','none');
		$('.goDate').css('margin-left','240px');
	
	}else{
		$('.comeDate').css("display",'block');
		$('.goDate').css('margin-left','140px');
	}
  });
});
//selectbox의 아이디가 depCode이고 arrCode인 각각 값들
 var target= document.getElementById("depCode");
 var target2= document.getElementById("arrCode");
 //var target2= document.getElementById("arrCode");

$("#arrCode").change(function(){
	var depCode = target.options[target.selectedIndex].value;
    var arrCode = target2.options[target2.selectedIndex].value;
	if(depCode==arrCode){
		alert("출발지와 도착지가 같습니다. 다시 선택해주세요");
	  	//id가 arrCode인 selectbox에 option의 0번째값에 selected속성이 true를준다
		$('#arrCode option:eq(0)').prop("selected",true);
	}
	
	if(depCode==""){
		alert("출발지(도시/공항)을 먼저 선택해주세요");
		$('#arrCode option:eq(0)').prop("selected",true);
	}
   });
   
   //출발-도착 순서로 다 정해놨는데 출발지를 바꿀때를 대비해서..
$("#depCode").change(function(){
	var depCode = target.options[target.selectedIndex].value;
    var arrCode = target2.options[target2.selectedIndex].value;
	  if(depCode==arrCode){
		  alert("출발지와 도착지가 같습니다. 도착지를 변경해주세요");
		  $('#arrCode option:eq(0)').prop("selected",true);
		  }
   });


$("#depTime0").click(function(){
	 if($("#depCode option:selected").val()==""){

		 alert("출발지(도시/공항)을 먼저 선택해주세요");
		 document.getElementById("depCode").focus();
	   }else if($("#arrCode option:selected").val()==""){
		  alert("도착지(도시/공항)을 먼저 선택해주세요");
		  document.getElementById("arrCode").focus();
	 }
	});
	
$("#depTime2").click(function(){
	 if($("#depCode option:selected").val()==""){

		 alert("출발지(도시/공항)을 먼저 선택해주세요");
		 document.getElementById("depCode").focus();
	   }else if($("#arrCode option:selected").val()==""){
		  alert("도착지(도시/공항)을 먼저 선택해주세요");
		  document.getElementById("arrCode").focus();
	 }
	});

$(".pop").on("click",function(){
    $('.pop').css('display','none');
    $('.final').css('display','none');
    $('.layer01').css('display','block');
 });
 
//layer01클래스에 자식클래스 li중에서도 0번째의 plus클래스눌렀을때
//자식으로칠때 앞에 .붙이고 동등한 위치의 클래스면 안붙인다
//******************성인의 수량 증가******************
var i = 1;
$('.layer01 li:eq(0) .plus').on("click",function(){
	 //i++; 코드를 앞에 둬야 누르자마자 증가함
	  i++;
	 $('.layer01 li:eq(0) span').text(i); 
});

$('.layer01 li:eq(0) .minus').click(function(){
	 $('.layer01 li:eq(0) span').text(i);
	   if(i<=1){
		   alert("최소 1명은 선택해야합니다");
			return false;
		 } 
	    i--;
});

//******************소아의 수량 증가******************
var j = 0;
$('.layer01 li:eq(1) .plus').on("click",function(){
	 //j++; 코드를 앞에 둬야 누르자마자 증가함
	 j++;
	 $('.layer01 li:eq(1) span').text(j); 
	 if(j==12){
		 j--;
		 alert("한번에 최대 예약가능한 인원 수는 12명입니다");
		 return false;
	 }
});

$('.layer01 li:eq(1) .minus').click(function(){
	 j--;
	 $('.layer01 li:eq(1) span').text(j);
	 
	 if(j<=0||j==0){
		 j++;
		 return false;
	 }
	   
});

//******************유아의 수량 증가******************
var k=0;
$('.layer01 li:eq(2) .plus').on("click",function(){
	 //i++; 코드를 앞에 둬야 누르자마자 증가함
	  k++;
	 $('.layer01 li:eq(2) span').text(k); 
});
$('.layer01 li:eq(2) .minus').click(function(){
	 k--;
	 $('.layer01 li:eq(2) span').text(k);
	   if(k==0||k<0){
			k++;
			return false;
		 } 	    
});

 
 //닫기버튼을 누를 때 생기는 일
 $("#close").on("click",function(){
	 $('.pop').css('display','block');
	 $('.final').css('display','block');
	 $('.layer01').css('display','none');
	 
	 $('.pop span:eq(0)').text(i);
	 $('.pop span:eq(1)').text(j);
	 $('.pop span:eq(2)').text(k);
	 
	 
 });

 //조회버튼을 누를 때 검수하는 것
 $("#submit").click(function(){
	 if($("#depCode option:selected").val()==""||$("#arrCode option:selected").val()==""){
		 alert("출발지와 도착지를 선택 후에 조회가능합니다");
		 return false;
	 }
	 
	 if($('input[name="way"]:checked').val()=="왕복"){
	 
	   if($("#depTime0").val()=="가는날 선택"||$("#depTime2").val()=="오는날 선택"){
		 alert("가는 날과 오는 날을 선택해주세요");
		 return false;
	    }
	 } else{
		 if($("#depTime0").val()=="가는날 선택"){
			 alert("가는 날을 선택해주세요");
			 return false;
		  }
	 }
	 
	 var adult = parseInt($('.pop span:eq(0)').text());
	 var child =parseInt($('.pop span:eq(1)').text());
	 var infant =parseInt($('.pop span:eq(2)').text());
	 var carrierd =adult+child+infant;
	 
	 $("#carrierd").val(carrierd);
	 $("#submitForm").submit();
	// var depCode = $('#depCode option:selected').val();
     //var arrCode = $('#arrCode option:selected').val();
	 //alert(max);
     //$.ajax({
		// type :"POST",
		// url : "/airline/reservation/maxCarrierd_count",
		// data :{max:max,depCode:depCode,arrCode:arrCode},
		// success:function(data){
		//	if(data==1){
		//		alert("성공");
		//	} 
		// }
	// })
	 
 });
 
 
 

//var i =1;

//$('.minus').on("click",function(){
//	var i = $('.layer01 span:eq(0)').text(i);
	//if(i<2){
	//	alert("최소 1명은 선택하셔야합니다");
	//}else{
	//	i--;
	//}
//});




	 

	
</script>
</html>