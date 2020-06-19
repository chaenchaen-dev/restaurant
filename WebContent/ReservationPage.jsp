<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@ page import="ClassPackage.StoreDAO" %>
     <%@ page import="java.io.PrintWriter"%>
         <jsp:useBean id="member" class="ClassPackage.MemberDAO" scope="session">
</jsp:useBean>
<jsp:useBean id="reservation" class="ClassPackage.ReserveDAO"
	scope="session">
</jsp:useBean>
<jsp:useBean id="store" class="ClassPackage.StoreDAO"
	scope="session">
</jsp:useBean>

<% String myid = member.getID();
int id_number = member.getMemNum(myid);


String id_store = request.getParameter("hidstore_no"); //매장 번호 가져옴(키 값)

System.out.println("     **********"+id_store);
 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약페이지</title>
</head>
<body>

<h1> 예약 정보를 입력해주세요.</h1>
<p> 취소는 뒤로가기 </p>

<!-- <form id="creatememberform"  action="f_createMember.jsp" > -->
<form id=""  action="f_reserveStore.jsp" >
		
			<input type="hidden" name="h_store_no" value="<%=id_store %>" >
			<label>예약 날짜 :</label> <input type = "date" name = "RESERVE_DATE" required>
			<label>시간 :</label> <input type = "time" name = "RESERVE_TIME" required> <br/><br/>
			
			<label>예정인원수 :</label> <input type="number" name="PERSONS"> <br/><br/> <!-- 매장 검색 후 선호매장을 선택해야할듯 아니면 매장 리스트보여주기 -->
			
			<input type = "submit" value = "확인" >
		</form>




</body>
</html>