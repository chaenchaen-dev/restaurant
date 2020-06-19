<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ClassPackage.MemberDAO"%>
<%@ page import="java.io.PrintWriter" %>

         <jsp:useBean id="member" class="ClassPackage.MemberDAO" scope="session">
</jsp:useBean>
<jsp:useBean id="reservation" class="ClassPackage.ReserveDAO"
	scope="session">
</jsp:useBean>
<jsp:useBean id="store" class="ClassPackage.StoreDAO"
	scope="session">
</jsp:useBean>
      
<%
/* String member_no1 = request.getParameter("MEMBER_NO");
int member_no = Integer.parseInt(member_no1); */
String reserve_date = request.getParameter("RESERVE_DATE");

String reserve_time = request.getParameter("RESERVE_TIME");

String persons1 = request.getParameter("PERSONS");
int person = Integer.parseInt(persons1);


String myid = member.getID();
int id_number = member.getMemNum(myid);

String id_store1 = request.getParameter("h_store_no"); //매장 번호 가져옴(키 값)
int id_store = Integer.parseInt(id_store1);
System.out.println(id_store1);
System.out.println("*********** id : "+id_number);

System.out.println(reserve_date);
System.out.println(reserve_time);
System.out.println(person); 

boolean bool = reservation.reserve( id_number,  id_store,  reserve_date,  reserve_time, person);

/* MemberDAO mem = new MemberDAO();
boolean bool = mem.insertMember( member_name,  member_address,  member_tel,  birthday, hobby,  preference_store_no, id,pwd);


 */

if(bool){ // 페이지 이동 
	PrintWriter writer = response.getWriter();
	writer.println("<script>alert('예약 완료'); location.href='MainPage.jsp';</script>");
	writer.flush();
}else{ //재입력 메세지 
	PrintWriter writer = response.getWriter();
	writer.println("<script>alert('예약 실패'); location.href='MainPage.jsp';</script>");
	writer.flush();
}

%>

