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
</style>
<body>

<div class="container">
 
    <div class="loginCheck">${user.userId}</div>

  <div class="userId" style="font-size:20px; margin-bottom:20px;">${user.userId}님의 문의내역입니다.</div>
  <table style="border-collapse:collapse; ">
     <thead align="center"; style= "color: orange; border : 1px solid grey;">
       <tr >
        <th width ="100px;">순번</th>
        <th width ="300px;">제목</th>
        <th width ="150px;">문의유형</th>
        <th width ="100px;">답변상태</th>
        <th width="200px;">작성날짜</th>
        </tr>
     </thead>
     
     <tbody align="center"; style= "border : 1px solid grey;">
     <c:forEach items="${boardList}" var="boardList">

      <tr style="line-height:30px;">
        <td width = "100px;" style="border-right:1px solid grey;">${boardList.rownum}</td>
        <td width ="300px;" style="border-right:1px solid grey;">
            <a href="board/myPage/myInquery?b_index=${boardList.b_index}">${boardList.b_title}</a>
        </td>
        <td width = "150px;" style="border-right:1px solid grey;">${boardList.b_kind_name}</td>
        <td width ="100px;" style="border-right:1px solid grey;">
         <c:if test = "${boardList.b_replyed == 0}">
         답변예정
         </c:if>
         <c:if test = "${boardList.b_replyed==1 }">
          답변완료
         </c:if>
        </td>
        <td width ="200px;" style="border-right:1px solid grey;"><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value= "${boardList.b_regDate}"/></td>
      </tr>
        </c:forEach>
     
     </tbody>
  
  
  </table>
  

  
  </div>

      <%@include file="../../include/footer.jsp"%>
 
     <%@include file="../../include/aside.jsp"%>
</body>

<script>

$(document).ready(function(){
  
  $('.loginCheck').css('display','none');

  if($(".loginCheck").text()==""){
	   location.href = "/user/login";
  }
});
</script>

</html>