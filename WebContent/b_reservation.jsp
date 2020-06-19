<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="ClassPackage.StoreDAO" %>
     <%@ page import="java.io.PrintWriter"%>
         <jsp:useBean id="member" class="ClassPackage.MemberDAO" scope="session">
</jsp:useBean>
<jsp:useBean id="reservation" class="ClassPackage.ReserveDAO"
	scope="session">
</jsp:useBean>
<% 

String myid = member.getID();
int id_number = member.getMemNum(myid);


String id_store = request.getParameter("hidstore_id"); //매장 번호 가져옴(키 값)



//예약할 방식 선택
reservation.reserve(id_number, id_store);


PrintWriter writers = response.getWriter();	 
writers.println("<script> alert('레스토랑 예약 완료'); parent.document.location.reload();</script>");
writers.flush();
%>