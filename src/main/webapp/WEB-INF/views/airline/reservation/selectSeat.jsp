<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공권 예매</title>
<style>
.container {padding-left: 400px;float: center;}
</style>
</head>
<body>
   <div class="header">
	<%@ include file="../../include/header.jsp"%>
	</div>
	
            
  <!-- ****************가는여정에 대한 좌석정보**************** -->
  
  <!--<form id= "submitForm" name="submitForm" method = "get">  -->
	<div class="container" style="float: left; margin-right: 140px;">
	    <div class="hidden0">${carrierd}</div><!-- 선택해야할 인원 수 -->
		<div class="hidden1">${itnyName0}</div><!-- 가는여정번호 -->
		<div class="hidden2">${goPriceper1}</div><!-- 가는여정 항공권값 -->
		
		<h2>${itnyName0}편(가는여정)좌석목록</h2><BR/>
		<div class ="flight" style ="margin-top : 4px; display : inline-block ;border :3px dotted orange;">
          항공편명 :  ${flightVO0.flgtName} 
          출발지 : ${flightVO0.depCode} 
          도착지 : ${flightVO0.arrCode}
      
          </div>
		   <table style = "margin-top:5px;">
				<thead>
					<tr>
					
						<th width="60px">좌석번호</th>
						<th width="60px">좌석등급</th>
						<th width="60px"></th>
					</tr>
				</thead>
				<tbody align="center">
					<c:forEach items="${seatList0}" var="seatList0">
						<tr>
						
							<td width="60px">${seatList0.seatNum}</td>
							<td width="60px">${seatList0.seatClass}</td>
                            <!-- 원래 체크박스에 value을 줬었음 -->
							<td><input type="checkbox" name="seatNum_go" value="${seatList0.seatNum}" class="checkSeat"> <!-- <button type="button" value = "${seatList.seatNum}" class="btn reservation">항공권 예매</button> -->

							</td>

						</tr>
					</c:forEach>

				</tbody>
			</table>


           <!-- 가는여정에대한 좌석정보 -->
			<div class="paymentForm" style="display: none; margin-top: 20pt; border: 3px dotted skyblue; width: 400px; padding: 20px;">
				<div class="container-fluid">
					

					<div class="title" style="font-size: 20pt; font-weight: bolder; margin-top: 10px; margin-bottom: 10px;">선택한 좌석 정보</div>

					<!-- 선택한 좌석을 보여줌 -->
					<div id="seatNum_result"></div>


			    <div class="btn_pay" style="margin-top: 10px;">
					<div class="title" style="font-size: 20pt; font-weight: bolder;">결제란</div>
<label style="font-size: 20px;">*계좌 정보</label><br />
					<select name="account" id="account0" style="padding: 10px; font-size: 15px;">
						<option value="" disabled>계좌 선택</option>
						<option value="신한은행 111-111-111111 정호상">신한은행
							111-111-111111 정호상</option>
						<option value="국민은행 222-222-222222 김지민">국민은행
							222-222-222222 김지민</option>
						<option value="기업은행 333-333-333333 김정수">기업은행
							333-333-333333 김정수</option>
					</select>
						<button type="submit" class="submit" id="submit" style="border-radius: 10px; color: white; font-size: 20px; border: 1px solid skyblue; background-color: skyblue; padding: 10px;">결제하기</button>
					
			   </div>
				</div>
			</div>

	</div>
	
	<!-- ****************오는여정에 대한 좌석정보**************** -->
     <c:if test='${itnyName1!=" "}'> <!-- 오는여정번호가 존재한다면-->
	  <div class="container" style="float: center; margin-right: 0px;">
          <div class="hidden3">${itnyName1}</div>
          <div class="hidden4">${comePriceper1}</div>
		  <h2>${itnyName1}편(오는여정)좌석목록</h2><br/>
		  <div class ="flight" style ="margin-top : 4px; display : inline-block ;border :3px dotted orange;">
          항공편명 :  ${flightVO1.flgtName} 
          출발지 : ${flightVO1.depCode} 
          도착지 : ${flightVO1.arrCode}
      
          </div>
		    <table style = "margin-top:5px;">
				<thead>
					<tr>
		
						<th width="60px">좌석번호</th>
						<th width="60px">좌석등급</th>
						<th width="60px"></th>
					</tr>
				</thead>
				<tbody align="center">
					<c:forEach items="${seatList1}" var="seatList1">
						<tr>

							<td width="60px">${seatList1.seatNum}</td>
							<td width="60px">${seatList1.seatClass}</td>

							<td>
							<input type="checkbox" name="seatNum_come" value="${seatList1.seatNum}" class="checkSeat1"> <!-- <button type="button" value = "${seatList.seatNum}" class="btn reservation">항공권 예매</button> -->
							</td>

						</tr>
					</c:forEach>
                 </tbody>
			</table>


           <!-- 오는여정에 대한 좌석정보 -->
			<div class="paymentForm1" style="position: absolute; left: 980px; display: none; margin-top: 20pt; border: 3px dotted skyblue; width: 400px; padding: 20px;">
				<div class="container-fluid">

					<div class="title" style="font-size: 20pt; font-weight: bolder; margin-top: 10px; margin-bottom: 10px;">선택한 좌석 정보</div>

					<!-- 선택한 좌석을 보여줌 -->
					<div id="seatNum_result1"></div>


					<div class="btn pay" style="margin-top: 10px;">
					<div class="title" style="font-size: 20pt; font-weight: bolder;">결제란</div>

					<label style="font-size: 20px;">*계좌 정보</label><br />
					  <select name="account" id="account1" style="padding: 10px; font-size: 15px;">
						<option value="" disabled>계좌 선택</option>
						<option value="신한은행 111-111-111111 정호상">신한은행
							111-111-111111 정호상</option>
						<option value="국민은행 222-222-222222 김지민">국민은행
							222-222-222222 김지민</option>
						<option value="기업은행 333-333-333333 김정수">기업은행
							333-333-333333 김정수</option>
					  </select>
						<button type="submit" class="submit1" id="submit1" style="border-radius: 10px; color: white; font-size: 20px; border: 1px solid skyblue; background-color: skyblue; padding: 10px;">결제하기</button>
					</div>
				</div>
			</div>
		

	</div>
	</c:if>
	
	<c:if test='${itnyName1==" "}'><!-- 오는여정번호가 존재하지않는다면-->
    </c:if>
	
	        <!-- js로 가는 여정 값 세팅 -->
			
			<!--  <input type="hidden" name="userNum" value="${user.userNum}" />  일단은 로그인해야 이 페이지로 넘어오게 해놈 -->
			<input type="hidden" name="itnyName_go" value="${itnyName0}" />
			<input type="hidden" name="resrvPrice_go" value="${goPriceper1}"/>
	        <!--  <input type="hidden" name="seatNum_go" id="seatNum_go"/>-->
	   
	        <!-- js로 오는 여정 값 세팅 -->
			<input type="hidden" name="itnyName_come" value="${itnyName1}" />
			<input type="hidden" name="resrvPrice_come" value="${comePriceper1}"/>
			<!-- <input type="hidden" name="seatNum_come" id="seatNum_come"/> -->
			
	<div style="padding-top: 20px; position: relative; top: 500px;"><%@include file="../../include/footer.jsp"%></div>
	
	
</body>
<script>
  $(document).ready(function(){
	  //서버에서 넘어온 값들 중 
	  //<div class="hidden0~4">태그들은 css속성 중 display에 none처리한다
	  $('.hidden0').css('display','none');  //승객 수
	  $('.hidden1').css('display','none');  //가는여정의 여정번호
	  $('.hidden2').css('display','none');  //가는여정의 항공권가격
	  $('.hidden3').css('display','none');  //오는여정의 여정번호
	  $('.hidden4').css('display','none');  //오는여정의 항공권가격
			     
	  var carrierd = ($(".hidden0").text())*1; //선택해야하는 승객 수!!
	  
	  
	//*********************가는 여정에 해당하는 체크박스 선택 시***********************
	$('input:checkbox[name="seatNum_go"]').click(function(){ 
		   //체크된 체크박스를 객체형태로담아온다
	       var checkbox =$("input:checkbox[name=seatNum_go]:checked");
           //alert(checkbox); =>출력시 Object object
		 
		   //값을 넣어줄 배열 생성
           var seatNum = new Array();
		   var seatClass = new Array();
		   //seatNum클릭했을 후 ajax로 보낼때 쓰이는 값
		   var itnyName = $(".hidden1").text();   
	      
           //체크된 체크박스의 갯수만큼 반복해서 값을 넣준다
	       checkbox.each(function(i){
	    	   seatNum[i] = checkbox.parent().parent().eq(i).children().siblings().eq(0).text();
	    	   //alert(seatNum[i]);
	    	   seatClass[i] = checkbox.parent().parent().eq(i).children().siblings().eq(1).text();
	       });
	       
          
 	        if(carrierd < $('input:checkbox[name=seatNum_go]:checked').length){
 	        	 alert("선택하신 인원 수는 "+carrierd+"명 입니다");
 	        	 return false;
 	        }
 	         //바로바로 선택한값이 밑 화면에 보이도록 ajax호출
	         //if(carrierd==$('input:checkbox[name=seatNum_go_]:checked').length){
	        	    $.ajax({
	                 url : 'airline/reservation/seatCheck',
	                 type : 'post',
	                 traditional :'true',
	                 data : {seatNum:seatNum,seatClass:seatClass,itnyName:itnyName},
	                 success : function(data){
	                          var itnyPrice = $(".hidden2").text();  //가는여정의 항공권가격
	                          var output = "<table border =1, style='width:275px ; border-collapse : collapse;'><tr><th>좌석번호</th><th>좌석등급</th><th>좌석가격</th></tr>";
	                          for(j in data){
	                            output += "<tr align='center'><td>"+data[j].seatNum+"</td><td>"+data[j].seatClass+"</td><td>"+itnyPrice+"</td></tr>";
	                            }
	                          output+="</table>";
	                          
	                          $("#seatNum_result").html(output);
	                          $(".paymentForm").css('display','block');
	                     }
                     });
	         //}) else if(carrierd<=$('input:checkbox[name=seatNum_go]:checked').length) {
	                //	alert("선택하신 인원은 "+carrierd+"명 입니다");
	                	//  return false;
	               // } else{
	               // 	return;
	               // }
	       
	          if($(".hidden3").text()!=0){ //오는여정의 값이 존재한다면! 즉 왕복이면
	    		 $(".btn_pay").css('display','none'); //가는여정의 결제하기 버튼부분을 숨긴다
	    		 } else if($(".hidden3").text()==0){ //오는여정의 값이 없다면! 즉 편도이면..근데 0은 아니고 " " 값인데 되네?..
	    			$(".btn_pay").css('display','block');  //가는 여정의 결제하기 버튼을 보여준다
	    		 } 
	      }); //$("input:checkbox[name=seatNum_go]")를 클릭 시 
	      
	    	//편도의 값만있을 때 id가 submit인 버튼, 즉 결제하기 버튼 클릭 시 발생
	    	 $("#submit").click(function(){
	    		
	    		 
	    		 
	    	 
	    		 var send_array = new Array();
    	         var fullchkbox= $(".checkSeat"); //모든 체크박스갯수(체크된것뿐아니라)
    	         //alert(fullchkbox.length);
    	         var send_cnt = 0;
    	         for(i=0; i<fullchkbox.length; i++){
    	        	  if(fullchkbox[i].checked==true){
    	        	 // send_array[send_cnt] = fullchkbox[i].value;
    	        	  send_array[send_cnt] = fullchkbox.parent().parent().eq(i).children().siblings().eq(0).text();
    	        	  //alert(send_array[send_cnt]);
    	        	  send_cnt++; 
    	           }
    	         }
    	       
    	         $("#seatNum_go").val(send_array);
    	         
    	         var result = confirm("결제페이지로 넘어가시겠습니까?");
    	         
    	         
    	         if(result==true){
		  		     var itnyName_go = $("input[name=itnyName_go]").val();
     		         //var itnyName_come = $("input[name=itnyName_come]").val();
     		         var resrvPrice_go =$("input[name=resrvPrice_go]").val();
     		        // var resrvPrice_come =$("input[name=resrvPrice_come]").val();
     		         var account= $("#account0 option:selected").val();
     		         send_array = send_array.toString();
     		         //send_array1 = send_array1.toString();
     		       
     		         
     		         $.ajax({
     		        	  url:"/airline/reservation/confirm_reservation",
	        		          type:"POST",
	        		          data : {seatNum_go:send_array,itnyName_go:itnyName_go,resrvPrice_go:resrvPrice_go,account:account},
	        		          async : false,
	        		          success:function(data){
	        		        	 // alert(data);
	        		        	  location.href = "/airline/reservation/confirmReservation?resrvNum="+data;
	        		              //location.replace('/airline/reservation/confirmReservation?resrvNum='+data);
	        		              }
                             });
                        } else { //결제하기실행안할꺼면
		  		    	  return false;
		  		      }
		  	    });
	        
	  
	     //*********************오는 여정에 해당하는 체크박스 선택 시***********************
	     $('input:checkbox[name="seatNum_come"]').click(function(){
	    	 var checkbox =$("input:checkbox[name=seatNum_come]:checked");//이름이 seatNum_come_인 checkbox에서 체크된 갯수
	    	
	    
		       var seatNum = new Array();  //체크한 싯넘을 넣을배열
	    	   var seatClass = new Array(); //체크한 싯클래스를 넣을배열
	    	   var itnyName = $('.hidden3').text(); //클래스가 hidden3인 태그의 text값, 오는여정번호
	    	 
	    	  //체크된 체크박스의 값을 반복해서 불러옴
		       checkbox.each(function(i){
		    	   seatNum[i] = checkbox.parent().parent().eq(i).children().siblings().eq(0).text();
		    	   seatClass[i] = checkbox.parent().parent().eq(i).children().siblings().eq(1).text();
		    	});
	    	   
                //seatNum_come_체크박스를 인원수이상보다 체크하려고할 때 발생
		          if(carrierd < $('input:checkbox[name=seatNum_come]:checked').length){
		        	  alert("선택하신 인원 수는 " + carrierd +"명 입니다");
		        	  return false;
		          }
		         //if(carrierd==$('input:checkbox[name=seatNum_come]:checked').length){
		        	   $.ajax({
		                 url : 'airline/reservation/seatCheck',
		                 type : 'post',
		                 traditional :'true',
		                 data : {seatNum:seatNum,seatClass:seatClass,itnyName:itnyName},
		                 success : function(data){
		                          var itnyPrice = $(".hidden4").text();  //오는여정의 항공권값
		                          var output = "<table border =1, style='width:275px ; border-collapse : collapse;'><tr><th>좌석번호</th><th>좌석등급</th><th>좌석가격</th></tr>";
		                          for(j in data){
		                            output += "<tr align='center'><td>"+data[j].seatNum+"</td><td>"+data[j].seatClass+"</td><td>"+itnyPrice+"</td></tr>";
		                            }
		                          output+="</table>";
		                          $("#seatNum_result1").html(output);
		                          
		                          $(".paymentForm1").css('display','block');
		                          //seatNum_come라는 name의 체크박스에 값을넣어서 서버로보내준다
		         		        
		                       }
		                    });
		         });
		    
		         //id가 submit1인 버튼,즉 결제하기 버튼 클릭 시 발생
		        $("#submit1").click(function(){ 
		        	 if(carrierd>$('input:checkbox[name=seatNum_go]:checked').length||carrierd>$('input:checkbox[name=seatNum_come]:checked').length){
		        		 alert("선택하신 인원 수에 대한 좌석을 모두 선택해주세요");
		        		 return false;
		        	 }
		       	 
		        		//***********가는여정에대한 배열생성
		        		 var send_array = new Array();
		    	         var fullchkbox= $(".checkSeat"); //체크안한 체크박스 갯수포함하여 다셈
		    	         //alert(fullchkbox.length);
		    	         var send_cnt = 0;
		    	         for(var i=0; i<fullchkbox.length; i++){
		    	        	  if(fullchkbox[i].checked==true){
		    	        	    send_array[send_cnt] = fullchkbox.parent().parent().eq(i).children().siblings().eq(0).text();
                               send_cnt++; 
		    	           }
		    	         }
		    	         //alert("send_array값"+send_array);
		    	        
		    	        $("#seatNum_go").val(send_array);
		    	        
		               //***********오는여정에대한 배열생성
		        		 var send_array1 = new Array();
		        		 var fullchkbox1= $(".checkSeat1"); //체크안한 체크박스 갯수포함하여 다셈
        		         //alert(fullchkbox1.length);
		        		 var send_cnt1 = 0;
        		         //checkbox에는 checked된 오는여정을 체크한 체크박스길이만담겨있었음..
        		         //원래 for(i =0; i <checkbox.length; i++){
        		         //  sent_array1[send_cnt1] = checkbox.parent()~~해서넣었는데
        		         //}if 조건빼주고나서 그게안댐..
        		         for(var i=0; i<fullchkbox1.length; i++){
        		            if(fullchkbox1[i].checked==true){
        		              send_array1[send_cnt1] = fullchkbox1.parent().parent().eq(i).children().siblings().eq(0).text();
        		        	  //alert(send_array1[send_cnt1]);
        		        	  send_cnt1++;
        		        	 }
        		           }
        		          // alert("send_array1의 값"+send_array1);
        		          // send_array1 = send_array1.toString();
        		         $("#seatNum_come").val(send_array1);
		        	 
        		         var result = confirm("결제페이지로 넘어가시겠습니까?");
			  		     if(result==true){
			  		      //DB에 등록하기위해 매퍼에서 필요한값들
			  		    	var itnyName_go = $("input[name=itnyName_go]").val();
	        		         var itnyName_come = $("input[name=itnyName_come]").val();
	        		         var resrvPrice_go =$("input[name=resrvPrice_go]").val();
	        		         var resrvPrice_come =$("input[name=resrvPrice_come]").val();
	        		         var account= $("#account1 option:selected").val();
	        		         //JS에서는 모든게 Object라서 string으로변환
	        		         send_array = send_array.toString();
	        		         send_array1 = send_array1.toString();
	        		       
	        		         
	        		         $.ajax({
	        		        	  url:"/airline/reservation/confirm_reservation",
		        		          type:"POST",
		        		          data : {seatNum_go:send_array,seatNum_come : send_array1,itnyName_come:itnyName_come,itnyName_go:itnyName_go,resrvPrice_go:resrvPrice_go,resrvPrice_come:resrvPrice_come,account:account},
		        		          async : false,
		        		          success:function(data){
		        		        	 // alert(data);
		        		        	  location.href = "/airline/reservation/confirmReservation?resrvNum="+data;
		        		              //location.replace('/airline/reservation/confirmReservation?resrvNum='+data);
		        		        	 
		        		          }

		        		         });
	 
			  		       } else {
			  		    	  return false;
			  		      }
			  		     
			  		     
             });
		         
		        
             });
             
             
             
</script>
</html>