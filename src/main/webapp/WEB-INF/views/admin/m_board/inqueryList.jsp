<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의내역</title>
<%@include file="../../include/header.jsp"%>
</head>
<style>
.container{padding-left:400px;}
.myTitle{display:inline-block; font-size :30px; font-weight:bolder; color : #FF6600 ; margin-bottom:20px; }
.reply_Btn{padding:10px; background-color : pink; font-weight:bolder; border : 1px solid black; border-radius:10px; margin-top:20px;}</style>
<body>

<div class="container">
 
    <div class="loginCheck">${user.userId}</div>

  <div class="myTitle">문의목록</div>
  <table style="border-collapse:collapse; ">
     <thead align="center"; style= "color: orange; border : 1px solid grey;">
       <tr>
        <th></th>
        <th width ="100px;">순번</th>
        <th width ="300px;">제목</th>
        <th width ="150px;">문의유형</th>
        <th width ="100px;">답변상태</th>
        <th width="150px;">작성자</th>
        <th width="190px;">작성날짜</th>

        </tr>
     </thead>
     
     <tbody align="center"; style= "border : 1px solid grey;">
     <c:forEach items="${boardList}" var="boardList">

      <tr style="line-height:30px;">
        <td width ="20px;" align ="center"><input type="radio" name = "b_index" id="b_index" value="${boardList.b_index}"/></td>
        <td width = "100px;" style="border-right:1px solid grey;">${boardList.rownum}</td>
        <td width ="300px;" style="border-right:1px solid grey;">${boardList.b_title}</td>
        <td width = "15px;" style="border-right:1px solid grey;">${boardList.b_kind_name}</td>
        <td width ="100px;" style="border-right:1px solid grey;">
         <c:if test = "${boardList.b_replyed == 0}">
         답변예정
         </c:if>
         <c:if test = "${boardList.b_replyed==1 }">
          답변완료
         </c:if>
        
        
        </td>
        <td width ="150px;" style="border-right:1px solid grey;">${boardList.userId}</td>
        <td width ="190px;" style="border-right:1px solid grey;"><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value= "${boardList.b_regDate}"/></td>

        </tr>
        </c:forEach>
     
     </tbody>
  
  
  </table>
  
  <button type="button" class="reply_Btn" >답변하기</button>
  

  
  </div>

      <%@include file="../../include/footer.jsp"%>
 
     <%@include file="../../include/aside.jsp"%>
</body>

<script>

$(document).ready(function(){
  
  $('.loginCheck').css('display','none');

  $(".reply").click(function(){
	
	   var b_index = $("input[name=b_index]:checked").val();
	     if(b_index==null){
		     alert("답변하실 문의글을 선택해주세요");
		     return false;
	      }
	   location.href ="/admin/m_board/replying?b_index="+b_index;
	  
	  
  })
  
});
</script>

</html>