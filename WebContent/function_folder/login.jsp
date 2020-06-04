<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

     <%@ page import="java.io.PrintWriter" %>
      <%@ page import="ClassPackage.MemberDAO"%>
      
      <%@ page import="ClassPackage.Administrator"%>

<%

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	System.out.println("내 아이디값은 "+id);
	System.out.println("비밀번호는 "+passwd);
	Administrator administrator = new Administrator();
	boolean bool1 = administrator.certifyAdmin(id, passwd);
	
	if(bool1){ // 페이지 이동 관리자라면
		response.sendRedirect("Adminimain.jsp");
	}
	else{
		Member mem = new Member();
		boolean bool = mem.certifyMember(id,passwd);
		
		if(bool){ // 페이지 이동 
		/* 	int memnum = mem.getMemNum(id); */
		%>
		
			<jsp:useBean id="member" class="ClassPackage.MemberDAO" scope="session">
			
			<%-- <jsp:setProperty name="member" property="MEMNUM" value = "<%=memnum %>"  /> --%>
			<jsp:setProperty name="member" property="ID" value = "<%=id %>"  />
			<jsp:setProperty name="member" property="PWD" value = "<%=passwd %>"  />
	<%-- 		<jsp:setProperty name="member" property="NAME" value = "<%=name %>"  />
			<jsp:setProperty name="member" property="EMAIL" value = "<%=phonenum %>"  />
			<jsp:setProperty name="member" property="PHONENUM" value = "<%=email %>"  />	
			<jsp:setProperty name="member" property="TYPE" value = "<%=type %>"  /> --%>
			</jsp:useBean> 
		<%
		response.sendRedirect("../MainPage.jsp"); //현재위치의 상단폴더의  jsp로가겠다.
		
		}else{ //재입력 메세지 
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('재입력 요망'); location.href='LogIn.jsp';</script>");
			writer.flush();
		}
	}

%>