<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.io.PrintWriter" %>
      <%@ page import="ClassPackage.MemberDAO"%>
<%--       <%@ page import="ClassPackage.Administrator"%> --%>

<%

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	System.out.println("내 아이디값은 "+id);
	System.out.println("비밀번호는 "+passwd);

		MemberDAO mem = new MemberDAO();
		boolean bool = mem.certifyMember(id,passwd);
		
		if(bool){ // 페이지 이동 
		/* 	int memnum = mem.getMemNum(id); */
		%>
		
			<jsp:useBean id="member" class="ClassPackage.MemberDAO" scope="session">
			<jsp:setProperty name="member" property="ID" value = "<%=id %>"  />
			<jsp:setProperty name="member" property="PWD" value = "<%=passwd %>"  />
			</jsp:useBean> 
		<%
		response.sendRedirect("MainPage.jsp");
		
		}else{ //재입력 메세지 
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('재입력 요망'); location.href='IntroPage.jsp';</script>");
			writer.flush();
		}

%>
