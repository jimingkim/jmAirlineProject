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
      <input type="hidden" name="userId" id="userId" value="${boardVO.userId}"/>
       <input type="hidden" name="b_index" id="b_index" value="${boardVO.b_index}"/>
       <div class="form-group" style="margin-bottom :8px;">
          <span class = "userId">${boardVO.userId}님 문의내역</span>
       </div>
       
       <div class="form-group" style="margin-bottom :8px;">
         <label class="form2" style="margin-right:3px; "> 질문 유형</label>
          <span class = "inqueryKind">
           <input type="text" value="${boardVO.b_kind_name}" readonly/>
            
           </span>
         </div>
         <div class="form-group" style="margin-bottom :8px;">
          <label class="form3">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</label>&nbsp;
          <span><input type="text" value="${boardVO.b_title}" readonly name="b_title" id="b_title" style ="width :370px" maxlength ="20" readonly/></span>
         </div>
         
         
         <div class="form-group">
          <div class ="text" style="margin-bottom :8px;">
           <label class="form4" >문의 내용</label>
          </div>
          <div class="content">
           <textArea rows="10" cols="80" name = "b_content" id="b_content"  readonly>${boardVO.b_content}</textArea>
          </div>
         </div>
         
         <div class="form-group">
         <div class ="text" style="margin-bottom :8px;">
           <label class="form5" >답변하기</label>
         </div>
         <div class="replying">
           <textArea rows="5" cols="80" name = "r_reply" id="r_reply"></textArea>
          </div>
         
         </div>
         
        
         <button type="button" class="submit" style="padding:10px; background-color : yellow; border-radius:10px; margin-top:6px;" >답변등록</button>
         <button type="button" class="list" style="padding:10px; background-color : sky; border-radius:10px; margin-top:6px;">문의목록</button>
  </div>
  <div class="replyshow" style="position :absolute; left:450px; margin-top:20px; ">
   <div id="replyList"></div>
   </div>
  
<div class="footer" style="margin-top:400px;">
     <%@include file="../../include/footer.jsp"%>

 </div>
     <%@include file="../../include/aside.jsp"%>
</body>
<script>

$(document).ready(function() {
	//문서가 로딩될때부터 댓글목록을 보여준다
   showReply();
    });
        var userId = $("#userId").val();
        var b_index = $("#b_index").val();
        var r_writer ="관리자";

    $(".submit").click(function(){
    	 if($("#r_reply").val()==""){
    		 alert("최소 한글자 이상은 입력하셔야합니다");
    		 $("#r_reply").focus();
    		 return false;
    	 }
    	 var result = confirm("이대로 답변하시겠습니까?");
    	 var rtn = true;
    	 if(result==true){
    		  var r_reply = $("#r_reply").val();
    		 
    		  $.ajax({
                  url:"/admin/m_board/insertReply",
                  type:"post",
                  data:{r_reply:r_reply,r_writer:r_writer,b_index:b_index},
                  success:function(data){
                     if(data==1){
                        alert("답변이 등록되었습니다");
                        $("#r_reply").val("");
                        showReply();
                        return rtn;
                     } else {
                        alert("답변등록에 실패했습니다");
                        $("#r_reply").focus();
                        rtn = false;
                        return rtn;
                        }
                     }
                   });//ajax
    	 }else {
    		 alert("다시등록하세요");
    		 $("#r_reply").focus();
            return  rtn;
          }

    	 });
 
    function showReply(){
       $.ajax({
          url:"/admin/m_board/showReply?b_index="+b_index,
          type:"post",
          success:function(result) {
              var output ="<table  width = 700, style='border-collapse:collapse; border : 1px solid grey; >";
              for(var i in result){
                 output +="<tr style='line-height:20px;'><td><b>"+result[i].r_writer+"</b>&nbsp;("+changeDate(result[i].r_regDate)+") <a onclick = replyDelete("+result[i].r_index+");>삭제</a><br/><br/></td></tr>";
                 output +="<tr style='line-height:28px;'><td>"+result[i].r_reply+"</td></tr>";
                }
             output +="</table>";
             $("#replyList").html(output);
          }
       
       });    
      }
    
    function replyDelete(r_index){
    	var result = confirm("답글을 삭제하시곘습니까?");
    	if(result){
    		
    		$.ajax({
    			 url : "/admin/m_board/deleteReply?r_index="+r_index+"&b_index="+b_index,
    			 type : "post",
    			 success : function(data){
    				 
    				 if(data==1){
    					 showReply();
    				 }
    			 }
    		}); //ajax
    	}
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
		 



    $(".list").click(function(){
    	 location.href="/admin/m_board/inqueryList";
     });


</script>
</html>