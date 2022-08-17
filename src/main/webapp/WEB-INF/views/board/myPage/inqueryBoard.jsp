<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
<%@include file="../../include/header.jsp"%>
</head>
<style>
.container{padding-left:500px;}
</style>
<body>

<div class="container">
    <form id ="submitForm" method ="post" >
       <input type="hidden" name="userId" id="userId" value="${user.userId}"/>
       <input type="hidden" name="userNum" id="userNum" value="${user.userNum}"/>
       <div class="form-group" style="margin-bottom :8px;">
         <label class="form1"> 아이디 : </label>
          <span class = "userId">${user.userId}님</span>
       </div>
       
       <div class="form-group" style="margin-bottom :8px;">
         <label class="form2" style="margin-right:3px; "> 질문 유형</label>
          <span class = "inqueryKind">
            <select name = "b_kind" id="b_kind">
               <option  value ="" selected>문의유형 선택</option>
                <c:forEach items ="${board_kindVO}" var="board_kindList">
               <option value = "${board_kindList.b_kind_id}">${board_kindList.b_kind_name}</option>
              </c:forEach>
             </select>
           </span>
         </div>
         <div class="form-group" style="margin-bottom :8px;">
          <label class="form3">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</label>&nbsp;
          <span><input type="text"  name="b_title" id="b_title" style ="width :370px" maxlength ="20"/></span>
         </div>
         
         
         <div class="form-group">
          <div class ="text" style="margin-bottom :8px;">
           <label class="form4" >문의 내용</label>
          </div>
          <div class="content">
           <textArea rows="10" cols="80" name = "b_content" id="b_content" placeholder="문의하실 내용을 입력해주세요"></textArea>
          </div>
         </div>
         
         <button type="submit" class="submit"  style="padding:10px; background-color : yellow; border-radius:10px; margin-top:6px;">작성</button>
         <input type="reset" value="처음부터"  style="padding:10px; background-color : pink; border-radius:10px; margin-top:6px;"/>
         <button type="button" class="list"  style="padding:10px; background-color : sky; border-radius:10px; margin-top:6px;">문의목록</button>
      </form>
  </div>
  
</body>
<script>
 
 $(".submit").click(function(){
	 
	 
  if($("#b_kind option:selected").val()==""){
	  alert("문의유형을 선택해주세요");
	  document.getElementById("b_kind").focus();
	  return false;
	  }
  
  if($("#b_title").val()==""){
	  alert("제목을 입력해주세요");
	   $("#b_title").focus();
	   return false;
	  }
  
  if($("#b_content").val()==""){
	  alert("문의 내용을 입력해주세요");
	  $("#b_content").focus();
	  return false;
	  }
  
    var result = confirm("문의내용을 작성하시겠습니까?");
     if(result){
    	 alert("작성이 완료되었습니다.");
    	 $("#submitForm").function();
     } else{
    	 return false;
     }
   });
 
     var userId = $("#userId").val();
     $(".list").click(function(){
    	 location.href="/board/myPage/myInqueryList?userId="+userId;
     })



</script>
</html>