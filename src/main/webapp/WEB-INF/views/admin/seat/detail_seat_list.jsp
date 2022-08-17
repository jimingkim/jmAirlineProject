<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석 목록</title>
<style>
#container {
   padding-left: 500px;
}
</style>
</head>
<body>
   <%@include file="../../include/header.jsp"%>
   <div id="container">
   
   <h2>${itnyName }편 좌석 목록</h2>
   <!-- display:inline-block은 컨텐츠의 너비에맞게 요소(div)의 너비 변함 -->
      <div class ="flight" style ="margin-top : 4px; display : inline-block ;border :3px dotted orange;">
          항공편명 :  ${flightVO.flgtName} 
          출발지 : ${flightVO.depCode} 
          도착지 : ${flightVO.arrCode}
      
      </div>
      <table border=1 style = "margin-top:15px; border-collapse : collapse;">
         <thead align=center>
            <tr>
                <th width = "70px;">좌석번호</th>
               <th width = "70px;">좌석등급</th>
               <th width = "100px;">예매가능현황</th>
               <th width = "100px;"></th>
            </tr>
         </thead>
         <tbody align=center>
            <c:forEach items="${seatList}" var="seatList">
               <tr>
                  <td width = "70px;">${seatList.seatNum}</td>
                  <td width = "70px;">${seatList.seatClass}</td>
                  <td width = "100px;">${seatList.avail}</td>
                  <td width = "100px;" >
                     <form role="form" method="get" action="/admin/seat/seat_list_delete">
                        <input type="hidden" name="seatNum" value="${seatList.seatNum}" />
                        <input type="hidden" name="itnyName" value="${seatList.itnyName}" />
                        <button type="submit" class="delete_${seatList.seatNum}_btn">삭제</button>
                     </form>
                  </td>
               </tr>
            </c:forEach>
         </tbody>
      </table>
   </div>
   <%@include file="../../include/aside.jsp"%>
   <%@include file="../../include/footer.jsp"%>
</body>
</html>