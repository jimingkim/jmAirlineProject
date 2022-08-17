<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약확인</title>
<style>

.container {padding-left: 500px; margin-top:100px;}
</style>
</head>
<body>
<%@include file="../../include/header.jsp"%>
   <div class="container">
     <div class="check" style= "margin-left: 160px; width:400px; height:50px;  text-align:center; font-size:40px; font-weight:bolder; border-radius:20px; padding: 6px;">
         웹 체크인하기
     </div>
      
     <form method="post" id = "submitForm">
      <div class="insert" style= "margin-left: 160px; margin-top:30px;" >
         <input type="text" id = "resrvNum" name="resrvNum" placeholder="예약번호를 입력하세요" size="50px" maxlength = "15" style="padding:15px; "/>&nbsp;&nbsp;&nbsp;<input type="reset" name="reset" value="리셋" style="background-color:#C0C0C0;"/>
      </div> 
      <button type="button" class="insert_btn" style="margin-top:20px; margin-left:250px;border-radius:10px; font-size:20px; font-weight : bold; border:1px solid #FFC0CB; color:white; background-color : #FFC0CB; padding:10px;">예약조회</button>
      <button type="button" class="home btn" style="margin-top:20px; border-radius:10px; font-size:20px; font-weight : bold; border:1px solid #87CEFA; color:white; background-color : #87CEFA; padding:10px;">메인화면으로</button>
    </form>
   </div>
<%@include file="../../include/aside.jsp"%>
	<%@include file="../../include/footer.jsp"%>
</body>

<script>
  
     $(".insert_btn").click(function(){
    	 var inputresrvNum = $('#resrvNum').val();
    	 if(inputresrvNum==""){
    		 alert("예약번호를 입력하세요");
    		 return false;
    	   }
    	 
    	// alert(inputresrvNum);
    	 
    	 $.ajax({
    		 url : "findResrvNum",
    		 type : "post",
    		 data : {resrvNum : inputresrvNum},
    		 success:function(data){
    			 if(data==0){
    				 alert("입력하신 예약번호가 없습니다. 다시 입력해주세요");
    				 return false;
    			 } else {
    				 $("#submitForm").submit();
    			 }
    		 }
    	 });
  
        
      });
     
     
     $(".home").click(function(){
    	 var result =confirm("메인화면으로 이동하시겠습니까?");
    	 if(result){
    	   location.href="/"   //home으로가는 매핑
    	 } else{
    		 return false; 
    	 }
     });
	
</script>
</html>