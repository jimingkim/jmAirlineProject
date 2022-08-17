<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매확정</title>
<style>

.container {
	padding-left: 500px;
}
</style>
</head>
<body>
<%@include file="../../include/header.jsp"%>
   <div class="container">
      <div class="title" style= "width:900px; height:90px; border : 1px dotted orange; background-color : orange; border-radius:20px; color: white; font-size:50px; font-weight:bolder; text-align:center; padding-top: 6px;">
          예약이 완료되었습니다 
     </div>  
    
      <div class = "main" style="width : 900px; height: 600px; border : 4px dotted grey; margin-top :40px;  padding-bottom:0px;">
          <div class = "user" style="font-size:30px; text-align: center; padding-top:20px; padding-bottom: 20px;">
            <c:if test='${reserveList0.userId==""}'>
            비회원님의 예약현황입니다. <br/>
            </c:if>
             <c:if test='${reserveList0.userId!=""}'>
             ${reserveList0.userId}님의 예약현황입니다. <br/>
            </c:if>
            예약 번호 :  <strong>${reserveList0.resrvNum}</strong> <br/>
            예약 일자 :  ${reserveList0.resrvDate} <br/>
          </div>
          
          <div class="go" style= "float :left; margin-left: 90px; margin-right:20px;">
           <div class= "goingClass">
             <div class="going" style="font-size :25px; padding-left: 90px; padding-bottom:10px;">가는편</div>
             <div class ="reserveList0" style="font-size: 20px; padding-left: 70px;">
          
	              항공편명 :  ${reserveList0.flgtName} <br/>
	              일정번호 : ${reserveList0.itnyName_go}<br/>
	              출발지 :   ${reserveList0.depCode} <br/>
	              도착지 :   ${reserveList0.arrCode} <br/>
	              출발시각 :  ${reserveList0.depTime} <br/>
	              도착시각 :  ${reserveList0.arrTime}<br/>
	              예약 좌석번호 :  ${reserveList0.seatNum_go} <br/>
             </div>
             </div>
             <c:if test="${reserveList1.flgtName==null}">
              <div class ="payInfo0" style = "text-align:center;font-size: 20px; margin-top:20px; ">
                <div class ="payInfo00" style="font-size: 24px; color : red; "> *결제정보 </div>
                 <div>결제 금액 :  ${reserveList0.resrvPrice_go} KRW</div>
                <strong>입금 계좌 정보 : ${reserveList0.account}</strong>
             </div>
               </c:if>
         </div>
  
       <c:if test='${reserveList1.flgtName!=null}'>
       <div class="hidden">${reserveList1.flgtName}</div>
         <div class="come" style="float:center; margin-left:150px;"> 
            <div class= "comingClass" >
              <div class="coming" style="font-size :25px; padding-left: 90px; padding-bottom:10px;">오는편_</div>
               <div class ="reserveList1" style="font-size: 20px; padding-left: 70px;">
	          
		          항공편명 :  ${reserveList1.flgtName} <br/>
		          일정번호 : ${reserveList1.itnyName_come}<br/>
		          출발지 :   ${reserveList1.depCode} <br/>
		          도착지 :   ${reserveList1.arrCode} <br/>
		          출발시각 :  ${reserveList1.depTime} <br/>
		          도착시각 :  ${reserveList1.arrTime}<br/>
		          예약 좌석번호 :  ${reserveList1.seatNum_come} <br/>
               </div>
              </div>
         
             <div class ="payInfo1" style=" font-size: 20px; margin-top:20px; float:center;">
               <div class ="payInfo11" style="font-size: 24px; color : red;  padding:0px;"> *결제정보 </div>
               <div>결제 금액 :  ${reserveList1.resrvPrice_come} KRW</div>
               <strong>입금 계좌 정보 : ${reserveList1.account}</strong>
             </div>
          </div>
        </c:if>
     
      </div>
      
    
      <button type="button" class="home btn" style="margin-top:20px; margin-left:380px;border-radius:10px; font-size:20px; font-weight : bold; border:1px solid #87CEFA; color:white; background-color : #87CEFA; padding:10px;">메인화면으로</button>
      <c:if test = "${reserveList0.userId==''}">
      <button type="button" class="login btn" style="margin-top:20px; margin-left:10px;border-radius:10px; font-size:20px; font-weight : bold; border:1px solid #FFC0CB; color:white; background-color : #FFC0CB; padding:10px;">로그인하러가기</button>
       </c:if>
     </div>
<%@include file="../../include/aside.jsp"%>
	<%@include file="../../include/footer.jsp"%>
</body>

<script> 
 
   //hidden클래스 값은 오는항공편의 여정번호임 
    $(".hidden").css('display','none');
     //오는항공편의 여정번호가 ""값일 때, 즉 편도예약편 일때!
    if($(".hidden").text()==""){
         $(".go").css('margin-left','240px');
         $(".payInfo0").css('margin-right','60px');
      }
     
     $(".home").click(function(){
    	 var result =confirm("메인화면으로 이동하시겠습니까?");
    	 if(result){
    	   location.href="/"   //home으로가는 매핑
    	 } else{
    		 return false; 
    	 }
     });
     
     $(".login").click(function(){
    	  location.href ="/user/signin";
    	  
     })
	
</script>
</html>