<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
    <%@ page import="java.io.PrintWriter"%>
         <jsp:useBean id="member" class="ClassPackage.MemberDAO" scope="session">
</jsp:useBean>
<jsp:useBean id="store" class="ClassPackage.StoreDAO" scope="session">
</jsp:useBean>
<jsp:useBean id="reservation" class="ClassPackage.ReserveDAO"
	scope="session">
</jsp:useBean>
    
    
    <%

String myid = member.getID();
int id_number = member.getMemNum(myid);


String store_id1 = request.getParameter("hidstoreid");
int store_id = Integer.parseInt(store_id1);

reservation.deleteReservation(id_number, store_id);


PrintWriter writers = response.getWriter();	 
writers.println("<script> alert('예약취소 완료'); location.href='MainPage.jsp';</script>");
writers.flush();
%>