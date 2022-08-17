<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	
<style>
#content{text-align: center; margin-top:100px; margin-bottom:300px; margin-left: 600px; margin-right:600px;}
.input_area{margin: 15px 0 15px 0;}
input{padding : 2px 10px;}
.myTitle{display:inline-block; font-size :30px; font-weight:bolder; color : #FF6600 }
.signup{padding:10px; background-color : #FF6600; color : white ;font-weight:bolder; border : 1px solid #FF6600; border-radius:10px; margin-top:6px;}
.double{padding:10px; background-color : #FF91DC; color : white ;font-weight:bolder; border : 1px solid #FF91DC; border-radius:10px; margin-top:6px;}
td {padding:10px;}
</style>

</head>
<body>
	<%@ include file="../include/header.jsp" %>

	<section id="content" style="padding : 3px 70px; ">
	 <p class="myTitle">회원가입</p>
 		<form  method="post" autocomplete="off">
 		 <table style="margin-left:20px; margin-right:10px; width : 600px; ">
 		 <tbody>
 		     <tr>
   			  <td width ="100"><div class ="id">아이디 </div></td>
   			  <td style="text-align:left;"><input type="text" id="userId" name="userId"/></td>   
  			 
  			 </tr>
             <tr>
 			 <td>비밀번호 </td>
   			 <td style="text-align:left;"> <input type="password" id="passwd" name="passwd"  maxlength ="16"/> </td>     
  			</tr>
  			<tr><td>비밀번호 확인</td>
				<td style="text-align:left;"><input type="password" id="rePasswd" name="rePasswd"  maxlength="16" /></td>
			
			</tr>
			<tr><td style="text-align:left;" colspan="2">*(영문 대/소문자, 숫자를 조합하여 8자리 이상으로 작성해주세요.)</td></tr>
 			<tr><td>이름 </td>
   				<td style="text-align:left;"><input type="text" id="userName" name="userName" placeholder="김지민" /></td><td></td>
  			</tr>
  	       
  	       <input type="hidden" id="phone" name="phone"/>
  	       <tr> <td>전화번호</td><br/><br/>
					<td style="text-align:left;"> 
					    <select id="phone1" name="phone1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
				
					
						<span class="input-group-addon">-</span>
						<span>
							<input type="text"  id="phone2" name="phone2" maxlength="4" style ="padding-left  : 0px; padding-right:0px;" placeholder="0000"/>
						</span>
						<span class="input-group-addon">-</span>
						<span>
							<input type="text" id="phone3" name="phone3" maxlength="4" style ="padding-left  : 0px; padding-right:0px;" placeholder="0000"/>
						</span>
					
					</td>
                </tr>
                <tr>
			    <td>여권번호 </td>
   				<td style="text-align:left;"><input type="text" id="passPort" name="passPort" placeholder="여권번호를 입력해주세요" />  </td>
  		        </tr>
  			</tbody>
        </table>
           <button type="submit" id="signup"  class="signup">회원가입</button>
           <button type="button" id="double"  class="double">중복확인</button>
           </form>
	</section>

	<%@ include file="../include/aside.jsp" %>

	<%@ include file="../include/footer.jsp" %>

</body>
<script>

$(document).ready(function(){
	$('#double').click(function(){
	
	var inputID = $('#userId').val();
	  if(inputID==""){
		alert("아이디를 입력해주세요");
		return false;
	  } else{
	  alert(inputID);

	  var rtn = false;
    $.ajax({
	 url : "blockSignup",
	 type : "post",
	 async :false,
	 data : {userId : inputID},
	  success :function(data){
		  
		  if(data==1){
			 alert("이미 사용중인 아이디입니다.");
			 $("#userId").focus();
			 return rtn;
		  }
		  else{
			  alert("사용가능한 아이디입니다.");
			  rtn =true;
			  return rtn;
		  }
	    }
      });
    
        
	  }
});

	$("#signup").click(function(){
	  
		
		//*********아이디관련 
	var str = document.getElementById('userId');
	if( str.value == '' || str.value == null ){
	    alert( '아이디를 입력해주세요' );
	    $("#userId").focus();
	    return false;
	  }

     //공백 금지
     //var blank_pattern = /^\s+|\s+$/g;(/\s/g
     var blank_pattern = /[\s]/g;
      if( blank_pattern.test( str.value) == true){
          alert(' 아이디에 공백은 사용할 수 없습니다. ');
          return false;
      }
      
      var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

      if( special_pattern.test(str.value) == true ){
        alert('특수문자는 사용할 수 없습니다.');
        return false;
      }
     
      
    //*********비밀번호관련
      if($("#passwd").val() == "") {
          alert("비밀번호를 입력하십시오.");
          $("#passwd").focus();
          return false;
       }
       
       if($("#passwd").val().length < 8){
          alert("비밀번호는 8자 이상으로 해야합니다.");
          $("#password").focus();
          return false;
       }
       
       if($("#rePasswd").val()==""){
           alert("비밀번호 확인을 입력해주세요");
           return false;
        }

       if($('#passwd').val() != $('#rePasswd').val()) {
           alert("비밀번호가 같지 않습니다.");
           $("#repasswd").focus();
           return false;
        }
       
       if( blank_pattern.test($("#passwd").val()) == true){
           alert(' 비밀번호에 공백은 사용할 수 없습니다. ');
           return false;
       }

       
     //*********사용자이름관련
       if($("#userName").val() == "") {
           alert("이름을 입력하십시오.");
           $("#userName").focus();
           return false;
           }
     
     //*********전화번호
       if($("#phone2").val() == ""||$("#phone3").val()=="") {
           alert("전화번호를 입력하십시오.");
           $("#tel2").focus();
           return false;
        }
     
       if($("#phone3").val() == "") {
           alert("전화번호를 입력하십시오.");
           $("#phone3").focus();
           return false;
        }
       
       if($("#passPort").val() == ""||$("#passPort").val() ==" ") {
           alert("여권번호를 입력하십시오.");
           $("#passPort").focus();
           return false;
        }
       
      
       if( blank_pattern.test($("#passPort").val()) == true){
           alert(' 여권번호에 공백은 사용할 수 없습니다. ');
           return false;
       }
    

       $('#phone').val( $('#phone1').val() + "-" + $('#phone2').val() + "-" + $('#phone3').val() );

       alert("축하드립니다. 회원가입이 완료되셨습니다");
	});
});
	
</script>
</html>