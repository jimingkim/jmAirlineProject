<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@ include file="../include/header.jsp" %>
<style>
#content{text-align: center;margin: 200px 750px;}

input{padding-left: 10px;padding-right: 10px;}
.myTitle{display:inline-block; font-size :30px; font-weight:bolder; color : #FF92B1 }
#signin{padding:10px; background-color : #FF92B1; color : white ;font-weight:bolder; border : 1px solid #FF92B1; border-radius:10px; margin-top:6px;}

</style>	
</head>
<body>

	<section id="content">
	<p class="myTitle">로그인</p>
		<form id="loginForm" method="post" autocomplete="off">
               <table style= "width :600px;">
                  <tr>
                    <td width ="60px"><div class="id">아이디</div></td>
                    <td  style="text-align:left;"><input type="text" id="userId" name="userId" autocomplete="on" /></td>
                  </tr>
                  <tr>
                    <td width ="60px"><div class="password">비밀번호</div></td>
                    <td  style="text-align:left;"><input type="password" id="passwd" name="passwd" /></td>
                   </tr>
                   
                </table>

			<button type="submit" id="signin" name="signin">로그인</button>
 
			<c:if test="${msg == false}">
				<p style="color:#f00;">로그인에 실패했습니다.</p>
			</c:if>
			
			<c:if test="${msg2==false}">
			     <p style="color:#f00;">비밀번호가 일치하지않습니다.</p>
			</c:if>
 		</form>   
	</section>

	<%@ include file="../include/aside.jsp" %>

	<%@ include file="../include/footer.jsp" %>
</body>

<script>
 $(function(){
	 $("#signin").click(function(){
	   if($("#userId").val()==""){
		   alert("아이디를 입력하세요");
		   $("#userId").focus();
		   return false; //함수 종료 명령문
		}
	   if($("#passwd").val()==""){
		   alert("비밀번호를 입력하세요");
		   $("#passwd").focus();
		   return false ;
	   }
		  document.loginForm.submit();
   });
 });
</script>
</html>