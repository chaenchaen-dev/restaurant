<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ClassPackage.MemberDAO"%>
<%@ page import="java.io.PrintWriter" %>
      
<%
/* String member_no1 = request.getParameter("MEMBER_NO");
int member_no = Integer.parseInt(member_no1); */
String member_name = request.getParameter("MEMBER_NAME");

String member_address = request.getParameter("MEMBER_ADDRESS");
String member_tel = request.getParameter("MEMBER_TEL");
String birthday = request.getParameter("BIRTHDAY");

String hobby = request.getParameter("HOBBY");

String preference_store_no1 = request.getParameter("PREFRENCE_STORE_NO");
int preference_store_no = Integer.parseInt(preference_store_no1);



String id = request.getParameter("ID");
String pwd = request.getParameter("PWD");



MemberDAO mem = new MemberDAO();
boolean bool = mem.insertMember( member_name,  member_address,  member_tel,  birthday, hobby,  preference_store_no, id,pwd);




if(bool){ // 페이지 이동 
	PrintWriter writer = response.getWriter();
	writer.println("<script>alert('회원가입이 완료되었습니다.'); location.href='IntroPage.jsp';</script>");
	writer.flush();
}else{ //재입력 메세지 
	PrintWriter writer = response.getWriter();
	writer.println("<script>alert('아이디 중복으로 회원가입에 실패했습니다'); location.href='IntroPage.jsp';</script>");
	writer.flush();
}

%>

