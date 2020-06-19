<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="member" class="ClassPackage.MemberDAO" scope="session">
</jsp:useBean>

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>

<jsp:useBean id="store" class="ClassPackage.StoreDAO" scope="session">
</jsp:useBean>
<jsp:useBean id="reservation" class="ClassPackage.ReserveDAO" scope="session">
</jsp:useBean>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원 등급 이력 조회</h1>
<table id = "history-list">

<tr>
					<th>변경일자</th>
					<th>변경등급</th>
				</tr>
<% 

String myid = member.getID();
int id_number = member.getMemNum(myid);

//String id_store = request.getParameter("hidmem_no"); //매장 번호 가져옴(키 값)


ArrayList<String[]> history = new ArrayList<String[]>();
history = member.gradeHistory(id_number);

					
					String change_date = "";
					String grade = "";
					//for문을 예약한 목록 개수만큼 반복함 !!!!!!!!!!!!
					for (int i = 0; i < history.size(); i++) {


						change_date = history.get(i)[0]; //storeno
						grade = history.get(i)[1];//bookname
				%>
				
				<script> 
				//회원의 예약목록 출력
				var tr = document.createElement('tr');
				var td = document.createElement('td');
				var temp ="<%=change_date%>";
				var text = document.createTextNode(temp);
				td.appendChild(text);
				tr.appendChild(td);
				
				td = document.createElement('td');
				temp ="<%=grade%>";	
				text = document.createTextNode(temp);
				td.appendChild(text);
				tr.appendChild(td);
			
				
				
				document.getElementById('history-list').appendChild(tr); 
				
				
				
		/* 		테이블에 동적으로 만든 행 추가 */
				

				
				</script>


				<%
					} //reservation for end 예약목록 출력 반복문 끝
				%>
				
</table>

</body>
</html>