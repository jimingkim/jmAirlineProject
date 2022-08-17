<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<%@ include file="../../include/header.jsp" %>
</head>
<style>
#content{text-align: center; margin-top:50px; margin-bottom:300px; margin-left: 600px; margin-right:600px;}
.input_area{margin: 0 0 10px 0;}
input{padding-left: 10px;padding-right: 10px;}
.form-group {margin-top:10px; margin-bottom:10px;}
.submit{padding:10px; background-color : #CCFFFF;  border : 1px solid #CCFFFF; border-radius:10px; margin-top:6px;}
.cancel{padding:10px; background-color : #FFFF00;  border : 1px solid #FFFF00; border-radius:10px; margin-top:6px;}
.deleteUser{padding:10px; background-color : #FFCCFF;  border : 1px solid #FFCCFF; border-radius:10px; margin-top:6px;}
.updating{font-size:16px;}
.myTitle{display:inline-block; border-radius:10px;padding : 3px 150px;font-size :30px; color:#FF6600; font-weight:bolder; border: 1 solid grey; }
</style>
<body>
   <section id="content" style="display:inline-block; padding : 3px 60px;border : 1px solid #DDDDDD; ">
         <p class="myTitle">회원정보수정</p>
         <form  method="post" action="/user/updateUser" id="updateForm">
            <div class="form-group">
               <H3><label class="showingId">아이디 : </label><span class="userId"> ${user.userId}</span></H3>
               <input type="hidden" name="userId" id ="userId" value="${user.userId}"/>
            </div>
            
            <div class="form-group">
               <label class="updating">이 름</label>
                <div class="inputing">
                  <input type="text" id="userName" name="userName" maxlength="16" value="${user.userName}" />
               </div>
            </div>
            
            <div class="form-group">
               <label class="updating">기존 비밀번호</label>
               <div class="inputing">
                  <input type="password" id="passwd0" maxlength="16" placeholder="기존 비밀번호를 입력하세요"/>
               </div>
            </div>
            
            <div class="form-group">
               <label class="updating">새 비밀번호</label>
               <div class="inputing">
                  <input type="password" id="passwd" name="passwd" maxlength="16" placeholder="새 비밀번호"/>
               </div>
            </div>
            
            <div class="form-group">
               <div class="noticing"> 
                  (영문 대/소문자, 숫자를 조합하여 8자리 이상으로 작성해주세요.)
               </div>
            </div>
            
            <div class="form-group">
               <label class="updating">비밀번호 확인</label>
               <div class="inputing">
                  <input type="password" id="rePass" maxlength="16" placeholder="새 비밀번호 확인"/>
               </div>
            </div>
            
            
            
            <input type="hidden"  id="phone" name="phone" />
            
            <div class="form-group">
               <label class="updating">전화번호</label>
               <div>
               <span class="inputing">
                  <select class="form-control" id="phone1" name="phone1">
                     <option value="010">010</option>
                     <option value="011">011</option>
                     <option value="017">017</option>
                     <option value="018">018</option>
                     <option value="019">019</option>
                  </select>
               </span>
               <span class="inputing">
                  <span class="input-group-addon">-</span>
                  <span>
                     <input type="text" id="phone2" name="phone2" maxlength="4" placeholder="0000"/>
                  </span>
                  <span class="input-group-addon">-</span>
                  <span>
                     <input type="text" id="phone3" name="phone3" maxlength="4" placeholder="0000"/>
                  </span>
               </span>
               </div>
            </div>
            
            <div class="form-group">
               <label  class="updating">여권번호</label>
                 <div class="inputing"> 
                 <input type="text" id="passPort" name="passPort" value="${user.passPort}" />   
                 </div>   
                </div>  
            
            <div class="form-group">
                     <button  type="submit" id="submit" class="submit" >정보수정</button>
                     <input  type="reset"class="cancel" value="취소" >
                     <button  type="button" id="deleteUser" class="deleteUser">회원탈퇴</button>
                </div>
              </form>
     </section>

   <%@ include file="../../include/aside.jsp" %>

   <%@ include file="../../include/footer.jsp" %>

</body>
<script>

  
$("#deleteUser").click(function(){
    var userId = $("#userId").val();
      var result = confirm("저희 사이트에서 회원 탈퇴하시겠습니까?");
  
   if(result==true){
     
      alert("감사합니다");
      location.href = "/user/deleteUser?userId="+userId;
      return false;  
   }else{
      alert("잘생각하셨습니다");
      return false;
   }
});

$("#submit").click(function(){
	
   if($("#userName").val()==""){
      alert("변경할 사용자 이름을 입력해주세요");
      return false;
   }
   
  
   if($("#passwd0").val()==""){
      alert("기존 비밀번호를 입력해주세요");
      return false;
   }
   
   
   
   if($("#passwd").val()==""){
      alert("새로운 비밀번호를 입력해주세요");
      return false;
   }
   
   if($("#rePass").val()==""){
      alert("비밀번호를 확인해주세요");
      return false;
   }
   
   if($("#phone2").val()==""||$("#phone3").val()==""){
      alert("변경할 전화번호를 입력해주세요");
      return false;
   }
   
   if($('#passwd').val() != $('#rePass').val()) {
      alert("비밀번호가 같지 않습니다.");
      $("#rePass").focus();
      return false;
   }
   
  
   
   $('#phone').val( $('#phone1').val() + "-" + $('#phone2').val() + "-" + $('#phone3').val() );
   
         var result = confirm("회원정보를 수정하시겠습니까?");
         
   if(result==true){
	   var passwd = "${user.passwd}";
      if($("#passwd0").val()==passwd){
     	 alert("회원 정보가 수정되었습니다");
           $("#updateForm").submit();
        } else{
          alert("기존 비밀번호가 맞지않습니다.");
          $("#passwd0").focus();
          return false;
        }
      }else{
      return false;
     }
});

</script>
</html>