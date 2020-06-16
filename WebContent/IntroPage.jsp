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
<h1>레스토랑 Intro 페이지</h1>
<form action="f_login.jsp">
		<label>아이디 :</label> <input type = "text" name = "id" maxlength= "12"><br/>
		<label>패스워드 :</label> <input type = "password" name = "passwd" maxlength= "12"><br/>
		<input type = "submit" value = "로그인">
		<input type = "button" value = "회원가입" onclick= "button1_click();"><br/> 
	</form>


	<div id = "loginpage-modal-content">
		<form id="creatememberform"  action="f_createMember.jsp" >
			<p>* 표시는 필수 입력사항입니다.</p>
			
			<label>* 아이디 :</label> <input type = "text" name = "ID" maxlength= "12" required><br/><br/>
			<label>* 패스워드 :</label> <input type = "password" name = "PWD" maxlength= "12" required><br/><br/>
			
			<label>* 이름 :</label> <input type = "text" name = "MEMBER_NAME" maxlength= "12" required><br/><br/>
			<label>* 주소 :</label> <input type = "text" name = "MEMBER_ADDRESS" maxlength= "30" required> <br/><br/>
			<label>* 생일 :</label> <input type = "date" name = "BIRTHDAY" required> <br/><br/>
			<label>* 전화번호 :</label> <input type = "tel" name = "MEMBER_TEL" maxlength= "20" required><br/><br/>
			
			<label>취미 :</label> <input type="text" name="HOBBY" maxlength="20"> <br/><br/>
			<label>선호매장 :</label> <input type="number" name="PREFRENCE_STORE_NO"> <br/><br/> <!-- 매장 검색 후 선호매장을 선택해야할듯 아니면 매장 리스트보여주기 -->
			
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