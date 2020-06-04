<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레스토랑 로그인 & 회원가입 페이지</title>
<link rel="stylesheet" href="css/IntroPage.css">
</head>
<body>

<form action="function_folder/login.jsp">
		<label>아이디 :</label> <input type = "text" name = "id" maxlength= "12"><br/>
		<label>패스워드 :</label> <input type = "password" name = "passwd" maxlength= "12"><br/>
		<input type = "submit" value = "로그인">
		<input type = "button" value = "회원가입" onclick= "button1_click();"><br/> 
	</form>


	<div id = "loginpage-modal-content">
		<form id="creatememberform"  action="CreateIncrement.jsp" >
			<select name = "TYPE">
			  <option value="0">학부</option>
			  <option value="1">대학원</option>
			  <option value="2">교직원</option>
			</select><br/><br/>
			<label>이름 :</label> <input type = "text" name = "NAME" maxlength= "12" required><br/><br/>
			<label>이메일 :</label> <input type = "email" name = "EMAIL" required><br/><br/>
			<label>전화번호 :</label> <input type = "tel" name = "PHONENUM" maxlength= "12" required><br/><br/>
			<label>아이디 :</label> <input type = "text" name = "ID" maxlength= "12" required><br/><br/>
			<label>패스워드 :</label> <input type = "password" name = "PWD" maxlength= "12" required><br/><br/>
			<input type = "submit" value = "회원가입" >
			<input type = "button" value = "닫기" onclick= "button2_click();"><br/> 
		</form>
	
	</div>


	<Script>
	function button1_click(){
		document.getElementById('loginpage-modal-content').style.display="block";
	}
	
	function button2_click(){
		document.getElementById('loginpage-modal-content').style.display="none";
	}
	
	</Script>



</body>
</html>