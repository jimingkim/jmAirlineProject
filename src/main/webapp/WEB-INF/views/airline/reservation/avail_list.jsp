<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공편 선택</title>
<%@include file="../../include/header.jsp"%>
<style>
.itinerary-section {position: static;}

</style>

</head>
<body>
  <div class="hidden">${user.userNum}</div>
   <div class="itinerary-section">
      <div class="title"
         style="position: absolute; left: 240px; font-size: 20pt; font-weight: bolder;">
         <h2>항공편 선택</h2>
      </div>
    <form id="submitForm" method="GET" action="/airline/reservation/selectSeat">
         <input type="hidden" id="itnyName" name="itnyName" />
         <input type="hidden" id="itnyName2" name="itnyName" />
         <input type="hidden" id="carrierd" name="carrierd"  value="${carrierd}"/>
         <input type="hidden" id="goPrice" name="goPrice"/>
         <input type="hidden" id="comePrice" name="comePrice"/>
        <!-- <input type="hidden" id="totalPrice" name="totalPrice"/> -->
         <div class="all" style="position: absolute; left: 240px; top: 280px; border: 2px solid orange; height: 150px; width: 1200px;">
            <div class="itinerary" style="font-size: 20pt; font-weight: bolder; border-bottom: 1px dotted grey; padding-left: 10px; background-color: #FAFAAA;">
            가는 여정
            </div>
               <c:if test="${itineraryCount1==0}">
                  <div class="goFlight" style="position: relative; font-size: 40px; font-weight: bolder; left: 380px; padding-top: 10px;">
                    선택하신 스케줄은 현재 없습니다.
                  </div>
               </c:if>
               <c:if test="${itineraryCount1!=0 }">
                  <div class="goFlight" style="position: relative; font-size: 50px; font-weight: bolder; left: 480px; padding-top: 10px;">
                     ${goFlight.depCode}&nbsp;&nbsp;-> &nbsp;${goFlight.arrCode}
                  </div>


              <div class="table" style="margin-top: 80px;">(통화:KRW)
               <table style="border: 1px dotted grey; width: 1200px; position: absolute;">
                  <thead align="center" style="background-color: orange;">
                     
                     <tr>
                        <th>여정번호</th>
                        <th>편명</th>
                        <th>출발시간</th>
                        <th>도착시간</th>
                        <th>할인운임</th>
                        <th>정규운임</th>
                     </tr>
                  </thead>
                  <tbody align="center">
                     <c:forEach items="${itineraryList}" var="itineraryList">
                        
                       <tr>
                         <td>${itineraryList.itnyName}</td>
                         <td>${itineraryList.flgtName}</td>
                         <td>${itineraryList.depTime}</td>
                         <td>${itineraryList.arrTime}</td>
                         <td>
                             
                              <a href="#"> <span class="itnyPrice" > 
                              <!-- 원래 이 span태그에 id도있었는데 id는유일해야되어서 지움 --> 
                              <c:if test="${itineraryList.discount_rate!=0}">
                               ${itineraryList.itnyPrice * (100-itineraryList.discount_rate)/100}
                               
                              </c:if>
                               
                               </span> </a>
                             
                             <c:if test="${itineraryList.discount_rate==0}">없음</c:if>
                         </td>
                         <td>
                            <a href="#"><span class="itnyPrice">
                            ${itineraryList.itnyPrice}
 
                            <!--  <fmt:formatNumber value="${itineraryList.itnyPrice}" pattern="###,###,###" /> -->
                            </span></a>
                         </td> 
                         <td><div class="hidden0">${itineraryList.acftName}</div></td>
                         </tr>
                      
                     </c:forEach>
                  </tbody>
               </table>
             </div>
            </c:if>

         </div>


         <!-- 바깥요소와의 차이는 margin을 줘야함 -->
 
       
         <div class="all"style="position: absolute; left: 240px; top: 780px; border: 2px solid orange; height: 150px; width: 1200px;">
            <div class="itinerary" style="font-size: 20pt; font-weight: bolder; border-bottom: 1px dotted grey; padding-left: 10px; background-color: #FAFAAA;">
            오는 여정
            </div>
              
               <c:if test="${itineraryCount2==0}">
                <c:if test="${depTimeOfreturn!='오는날 선택'}">
                 <div class="goFlight" style="position: relative; font-size: 40px; font-weight: bolder; left: 380px; padding-top: 10px;">
                   선택하신 스케줄은 현재 없습니다.
                 </div>
                 </c:if>
                 <c:if test="${depTimeOfreturn=='오는날 선택'}">
                 <div class="goFlight" style="position: relative; font-size: 40px; font-weight: bolder; left: 380px; padding-top: 10px;">
                   돌아오는 항공편은 선택하지않으셨습니다.
                 </div>
                 </c:if>
               </c:if>
              
               <c:if test="${itineraryCount2!=0}">
                 <div class="goFlight" style="position: relative; font-size: 50px; font-weight: bolder; left: 480px; padding-top: 10px;">
                     ${goFlight.arrCode}&nbsp;&nbsp;-> &nbsp;${goFlight.depCode}
                 </div>
            
             <div class="table" style="margin-top: 80px;">(통화:KRW)
               <table style="border: 1px dotted grey; width: 1200px; position: absolute;">
                  <thead align="center" style="background-color: orange;">
                     <tr>
                     <th>여정번호</th>
                        <th>편명</th>
                        <th>출발시간</th>
                        <th>도착시간</th>
                        <th>할인운임</th>
                        <th>정규운임</th>
                     </tr>
                  </thead>
                  <tbody align="center">
                  
                     <c:forEach items="${itineraryList2}" var="itineraryList2">
                        
                        <tr>
                         <td>${itineraryList2.itnyName}</td>
                         <td>${itineraryList2.flgtName}</td>
                         <td>${itineraryList2.depTime}</td>
                         <td>${itineraryList2.arrTime}</td>
                         <td>
                          <a href="#"><span class="itnyPrice2">
                          <c:if test="${itineraryList2.discount_rate!=0}">
                           ${itineraryList2.itnyPrice * (100-itineraryList2.discount_rate)/100}
                           
                          </c:if>
                           </span></a>
                          <c:if test="${itineraryList2.discount_rate==0}">없음</c:if>
                         </td>
                         <td>
                         <a href="#"><span class="itnyPrice2">
                           ${itineraryList2.itnyPrice}
                           
                         </span></a>
                         </td>
                         <td><div class="hidden1">${itineraryList2.acftName}</div></td>
                         </tr>
                     </c:forEach>
                  </tbody>
               </table>
             </div>
            </c:if>
          </div>


         <div class="container-fluid"  style="margin-bottom:0px;  position: absolute;left: 240px; font-size: 30px; font-weight: bolder; margin-top: 1000px;">
            <div class="fareTitle">여정 및 운임 확인</div>
            <div class="checkFare" style="position:static; background-color: #FFE0C6; width: 1210px; height: 150px; padding-left: 10px; margin-bottom: 10px; margin-top: 20px;">
              예상 항공운임
               <div style="font-size: 15px; font-weight: lighter;"> (유류할증료 & TAX 포함)</div>
              <div id="totalPrice_result"></div>
            </div>
             
          </div>
          <div class="button" style="position:relative; top : 1000px; left:500px;" >
    
               <button type="submit" class="submit" id="submit" style="border-radius: 10px; color: white; font-size: 20px; border: 1px solid orange; background-color: orange; padding: 10px;">
                  예매하기
               </button>
          </div>
          

      </form>
   </div>
   
   <div style="padding-top: 20px; position: relative; top: 1200px; ">
      <%@include file="../../include/footer.jsp"%>
   </div>
   
     <%@include file="../../include/aside.jsp"%>

</body>

<script>

  $(document).ready(function(){
	 
	  $('.hidden').css('display','none');
	  $('.hidden0').css('display','none');
	  $('.hidden1').css('display','none');
    
	   //서버에서 받은 carrierd값(선택한 인원수)을 저장한다
       var carrierd = ($('input[name="carrierd"]').val())*1; 

     
     //가는 여정의 항공권 총 합을 구하여 세팅하는 과정.
     //클래스명이 table인 태그 아래 tr태그 아래 td태그 아래 클래스명이 itnyPrice인 태그를 클릭했을 때
      $(".table tr td .itnyPrice").click(function(){ 
		
    	 var price = $(this).text();//현재 클릭된 row(데이터,행)값
    	 var acftName =$(this).parent().parent().parent().children().eq(6).text(); //가는여정의 기종번호
    	 var itnyName =$(this).parent().parent().parent().children().eq(0).text();
	                 $("#itnyName").val(itnyName);
	                 alert(price+" KRW 을 선택하셨습니다");
	       	         var totalPrice = price*carrierd;
	       		     $("#goPrice").val(totalPrice); //hidden으로 넘겨줄 goPrice값에 totalPrice값 세팅
	       		     var goPrice = $("#goPrice").val();
	       		     var comePrice = $("#comePrice").val();
	       		     var totalPrice3 = (goPrice*1+comePrice*1);
	       		     $("#totalPrice_result").html(totalPrice3);
	               });
      
      //오는여정의 항공권 총 합을 구하여 세팅하는 과정
	   $(".table tr td .itnyPrice2").click(function(){ 
		   var goPrice = $("#goPrice").val();
		     if(goPrice==""){
			     alert("가는여정 항공권을 선택해주세요");
			     return false;
		       }   
		   var price2 = $(this).text();
		   var acftName =$(this).parent().parent().parent().children().eq(6).text(); //가는여정의 기종번호
	       var itnyName =$(this).parent().parent().parent().children().eq(0).text();
		              $("#itnyName2").val(itnyName);
		 
	       			  alert(price2+" KRW 을 선택하셨습니다");
	       			  var totalPrice2 =price2*carrierd;
	       			  $("#comePrice").val(totalPrice2); //hidden으로 넘겨줄 comePrice값에 totalPrice2값 세팅
	       			  var comePrice = $("#comePrice").val();
	       			  var totalPrice3 = (goPrice*1+comePrice*1);
	       			  $("#totalPrice_result").html(totalPrice3);
	       	         });
	     
		 $("#submit").click(function(){
			 //가는 여정의 값을 선택안했다면
 			 if($("#goPrice").val()==""){
 				 alert("항공편을 선택해주세요");
 				 return false;
 				}
			   var itnyName = $("#itnyName").val();
			   var rtn = true;
	         	    $.ajax({
	         	     url:"/airline/reservation/maxCarrierd_count",
	         	     type:"post",
	         	     data : {carrierd:carrierd, itnyName :itnyName},
	         	     async : false,
	         	     success :function(data){
	         	    	if(data==0){
	         	    		alert("좌석이 부족합니다");
	         	    		rtn =false;
	         	    		return rtn;
	         	    		
	         	    	   }else {rtn =true; return rtn;} 
	         	    	  }
	         	    	});
	         	    
	         	    
	         	     var user = $(".hidden").text();
	    	           
	    	         //오는여정의 항공권값이 페이지에 없으면,편도를 택했거나 왕복을 택했는데 오는여정스케줄이 없다면
	    	          if($("table tr td .itnyPrice2").text()==""){
	    	             $("#itnyName2").val(" "); //값을 세팅해주는 이유는 컨트롤러에적어둠
	    	             $("#comePrice").val("0");
	    	              if(user==""){ //로그인 안된 상태면
	    	               var result = confirm("로그인 후 예약하시면 더 다양한 혜택이있습니다. 로그인 하시겠습니까?");
	    	                   if(result==true){
	    	                     location.href ="/user/signin";
	    	                     return false;
	    	                   }else{
	    	                     $("#submitForm").function();
	    	                   }
	    	             } else{ //로그인된상태면
	    	                   $("#submitForm").function();    
	    	                 }
	    	             } //오는 여정의 항공권이 페이지에 있는데, 즉 왕복을 선택했는데
	    	              else if($("table tr td .itnyPrice2").text()!="") {
	    	              //근데 그 와중에 선택을 안하고 예매하기를 눌렀다면?..
	    	                  if($('#comePrice').val()==""){
	    	                     alert("돌아오는 항공권도 선택해주세요");
	    	                        return false;
	    	                   } else{ //선택을했다면 그대로 넘겨주기
	    	                      if(user==""){
	    	                        var result = confirm("로그인 후 예약하시면 더 다양한 혜택이있습니다. 로그인 하시겠습니까?");
	    	                         if(result==true){
	    	                           location.href ="/user/signin";
	    	                           return false;
	    	                        } else{
	    	                        	
	    	                         $("#submitForm").function();
	    	                        }
	    	                      }else{ //로그인 된 상태면
	    	                    	
	    	                         $("#submitForm").function();
	    	                      }
	    	                   }
	    	                } 
	        
			 
			
			
			 
  });
  });
    
</script>



</html>