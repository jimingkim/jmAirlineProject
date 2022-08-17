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
.delete{padding:10px; background-color : pink; border-radius:10px; margin-top:6px;}
.list{padding:10px; background-color : sky; border-radius:10px; margin-top:6px;}
</style>
<body>

<div class="container">
      <input type="hidden" name="userId" id="userId" value="${boardVO.userId}"/>
       <input type="hidden" name="b_index" id="b_index" value="${boardVO.b_index}"/>
       <div class="form-group" style="margin-bottom :8px;">
         <label class="form1"> 아이디 : </label>
          <span class = "userId">${boardVO.userId}님</span>
       </div>
       
       <div class="form-group" style="margin-bottom :8px;">
         <label class="form2" style="margin-right:3px; "> 질문 유형</label>
          <span class = "inqueryKind">
           <input type="text" value="${boardVO.b_kind_name}" readonly/>
            
           </span>
         </div>
         <div class="form-group" style="margin-bottom :8px;">
          <label class="form3">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</label>&nbsp;
          <span><input type="text" value="${boardVO.b_title}" readonly name="b_title" id="b_title" style ="width :370px" maxlength ="20"/></span>
         </div>
         
         
         <div class="form-group">
          <div class ="text" style="margin-bottom :8px;">
           <label class="form4" >문의 내용</label>
          </div>
          <div class="content">
           <textArea rows="10" cols="80" name = "b_content" id="b_content" placeholder="문의하실 내용을 입력해주세요">${boardVO.b_content}</textArea>
          </div>
         </div>
         
         <button type="button" class="delete" >삭제</button>
         <button type="button" class="list">문의목록</button>
  </div>
  
   <div class="replyshow" style="position :absolute; left:450px; margin-top:20px; ">
     <div id="replyList"></div>
   </div>
  
</body>
<script>
 
$(document).ready(function() {
	//문서가 로딩될때부터 댓글목록을 보여준다
   showReply();
    });
    
    var b_index = $("#b_index").val();
    function showReply(){
    	 $.ajax({
             url:"/board/myPage/showReply?b_index="+b_index,
             type:"post",
             success:function(result) {
                 var output ="<table  width = 700, style='border-collapse:collapse; border : 1px solid grey; >";
                 for(var i in result){
                    output +="<tr style='line-height:20px;'><td><b>"+result[i].r_writer+"</b>&nbsp;("+changeDate(result[i].r_regDate)+") <br/><br/></td></tr>";
                    output +="<tr style='line-height:28px;'><td>"+result[i].r_reply+"</td></tr>";
                   }
                output +="</table>";
                $("#replyList").html(output);
             }
          
          });    
         }
    
    function changeDate(data){
        var date = new Date(data);
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var day = date.getDate();
        var hour = date.getHours() - 9;
        var minute = date.getMinutes();
        var second = date.getSeconds();
        
        month = month < 10 ? '0' + month : month;
        hour = hour<10 ? '0'+hour : hour;
        minute = minute < 10 ? '0' + minute : minute;
        second = second < 10 ? '0' + second : second;
        
        strDate = year+"-"+month+"-"+day+" "+hour+":" +minute+":" + second;
        return strDate;   
     }
 
 $(".delete").click(function(){
	 var b_replyed = ${boardVO.b_replyed};
	 if(b_replyed==1){
		 alert("답변이 등록된 문의글은 삭제하실 수 없습니다");
		 return false;
	 }
	 var result = confirm("문의글을 삭제하시겠습니까?");
	 if(result==true){
		 var b_index =$("#b_index").val();
		 location.href = "board/myPage/deleteInquery?b_index="+b_index;
	   }
	 });
 
 
	
 
     var userId = $("#userId").val();
     $(".list").click(function(){
    	 location.href="/board/myPage/myInqueryList?userId="+userId;
     });



</script>
</html>