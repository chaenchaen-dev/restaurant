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
<title>레스토랑 메인페이지</title>
<link rel="stylesheet" href="css/MainPage.css">
</head>
<body>
	<h1>레스토랑 메인페이지</h1>


	<div id="mid_content">
		<div id="side_content_box">
			<h3> ** 매장목록 ** </h3>
			<script>
	
function storeTitle(){
	var tr = document.createElement('tr');
	var th = document.createElement('th');
	var temp ="매장번호";
	var text = document.createTextNode(temp);
	th.appendChild(text);
	tr.appendChild(th);
	th = document.createElement('th');
	temp ="매장주소";	
	text = document.createTextNode(temp);
	th.appendChild(text);
	tr.appendChild(th);
	th = document.createElement('th');
	temp ="매장전화번호";	
	text = document.createTextNode(temp);
	th.appendChild(text);
	tr.appendChild(th);
	th = document.createElement('th');
	temp ="테이블 수";	
	text = document.createTextNode(temp);
	th.appendChild(text);
	tr.appendChild(th);
	th = document.createElement('th');
	temp = "오픈시간";
	text = document.createTextNode(temp);
	th.appendChild(text);
	tr.appendChild(th);
	th = document.createElement('th');
	temp = "마감시간";
	text = document.createTextNode(temp);
	th.appendChild(text);
	tr.appendChild(th);
	th = document.createElement('th');
	tr.appendChild(th);
	document.getElementById('store-list').appendChild(tr); 
}
</script>
			<!-- 여기까지 테이블 머리 출력@@@@@@@@@ -->


			<form name="form1">
				<table id="store-list">
					<%
						String myid = member.getID(); //현재 로그인한 아이디(id1)값을 가져온다
					int id_no = member.getMemNum(myid); //회원의 고유 번호를 가져온다(1)

					ArrayList<String[]> store_list = new ArrayList<String[]>(); //검색되어 출력되는 arraylist를 저장할 공간

					String store_no = ""; //책의 아이디를 저장하는 변수
					String store_add = ""; //책의 제목을 저장하는 변수
					String store_tel = ""; //책의 저자를 저장하는 변수
					String table_cnt = ""; //책의 출판사를 저장하는 변수
					String open_time = "";
					String close_time = "";

					store_list = store.getStoreList();
					%>

					<script>storeTitle();</script>

					<%
						for (int i = 0; i < store_list.size(); i++) {
						//책 정보 값 저장
						store_no = store_list.get(i)[0];
						store_add = store_list.get(i)[1];
						store_tel = store_list.get(i)[2];
						table_cnt = store_list.get(i)[3];
						open_time = store_list.get(i)[4];
						close_time = store_list.get(i)[5];
					%>

					<script>
	//매장목록
				
		var tr = document.createElement('tr');
		var td = document.createElement('td');
		var temp ="<%=store_no%>";
		
		var text = document.createTextNode(temp);
		td.appendChild(text);
		tr.appendChild(td);
		td = document.createElement('td');
		temp ="<%=store_add%>";	
		text = document.createTextNode(temp);
		td.appendChild(text);
		tr.appendChild(td);
		td = document.createElement('td');
		temp ="<%=store_tel%>";	
		text = document.createTextNode(temp);
		td.appendChild(text);
		tr.appendChild(td);
		td = document.createElement('td');
		temp ="<%=table_cnt%>";	
		text = document.createTextNode(temp);
		td.appendChild(text);
		tr.appendChild(td);
		td = document.createElement('td');
		
		temp ="<%=open_time%>";	
		text = document.createTextNode(temp);
		td.appendChild(text);
		tr.appendChild(td);
		td = document.createElement('td');
		
		temp ="<%=close_time%>";	
		text = document.createTextNode(temp);
		td.appendChild(text);
		tr.appendChild(td);
		td = document.createElement('td');
		
		var form = document.createElement('form');
		form.action = "ReservationPage.jsp";
		
		var rt = document.createElement('input');
		rt.type = "submit";
		rt.value = "예약";
		
		var hidstore_id = document.createElement('input');
		hidstore_id.type = "hidden";
		hidstore_id.name = "hidstore_no";
		hidstore_id.value = '<%=store_no%>';
						form.appendChild(hidstore_id);
						form.appendChild(rt);
						//테이블에 동적으로 만든 검색 리스트 추가

						td.appendChild(form);
						tr.appendChild(td);

						document.getElementById('store-list').appendChild(tr);
					</script>


					<%
						//@@@@@@@@@@@@@@@@@@@@@ java
					} // 책 제목으로 검색했을 때 도서 리스트를 출력하는 for문 끝
					%>










				</table>

			</form>




		</div>
		<div id="my_content">
<h3>** 사용자 정보 **</h3>
<table id ="user-list">
<tr>
<th>사용자 아이디</th>
<th>포인트</th>
<th>회원등급</th>
<th></th>
<th></th>
</tr>


<%
					//회원정보!!!!!!!!!!!! 값을 읽어오는 자바메소드 시작
					ArrayList<String[]> userInfo_list = new ArrayList<String[]>();
					userInfo_list = member.printUserInfo(id_no);

					String id ="";
					String point ="";
					String grade = "";
					//for문을 예약한 목록 개수만큼 반복함 !!!!!!!!!!!!
					
id = userInfo_list.get(0)[0]; //storeno
						point = userInfo_list.get(0)[1];//bookname
						grade = userInfo_list.get(0)[2]; //reservenum

						
				%>
				
					<script> 
				//회원의 정보 출력
				
				var tr = document.createElement('tr');
				var td = document.createElement('td');
				var temp ="<%=id%>";
				var text = document.createTextNode(temp);
				td.appendChild(text);
				tr.appendChild(td);
				
				td = document.createElement('td');
				temp ="<%=point%>";	
				text = document.createTextNode(temp);
				td.appendChild(text);
				tr.appendChild(td);
				
				td = document.createElement('td');
				temp ="<%=grade%>";	
				text = document.createTextNode(temp);
				td.appendChild(text);
				tr.appendChild(td);
				
				
				
				
				td = document.createElement('td');
				
				//버튼 만드는곳
				/* var bt = document.createElement('button'); */
				
				
					var form = document.createElement('form');
				//회원 정보로!!!!!!!!!!!!!!1
					form.action = "b_gradehistory.jsp";
					
					var rt = document.createElement('input');
					rt.type = "submit";
					rt.value = "등급변경이력";
					
					var hidmem_no = document.createElement('input');
					hidmem_no.type = "hidden";
					hidmem_no.name = "hidmem_no";
					hidmem_no.value = '<%=id_no%>';
					form.appendChild(hidmem_no);
					form.appendChild(rt);
					
					td.appendChild(form);
					tr.appendChild(td);
					
				
				document.getElementById('user-list').appendChild(tr); 
				
				
				
		/* 		테이블에 동적으로 만든 행 추가 */
				

				
				</script>
				

</table>
</div>
		
		</br>

		<!-- 검색 결과 뽑는 iframe 얘는 아직 미완성 src 는 iframe/MainPageIframe.jsp로 새로 저장해서만들기 위에 Iframe도 마찬가지-->

		<div id="side_content_box">
			<h3>** 나의 예약현황 **</h3>

			<table id="reservation-list">
				<tr>
					<th>매장번호</th>
					<th>예약시간</th>
					<th>예약인원</th>
					<th></th>
					<th></th>
				</tr>
				<!-- 예약 목록 동적으로 추가하기 -->
				
				
				<%
					//예약 목록의 값을 읽어오는 자바메소드 시작
					ArrayList<String[]> reservation_list = new ArrayList<String[]>();
					reservation_list = reservation.searchReserveByMember_no(id_no);

					int r_store_no;
					String reserve_time = "";
					String wating_num = "";
					//for문을 예약한 목록 개수만큼 반복함 !!!!!!!!!!!!
					for (int i = 0; i < reservation_list.size(); i++) {


						r_store_no = Integer.parseInt(reservation_list.get(i)[0]); //storeno
						reserve_time = reservation_list.get(i)[1];//bookname
						wating_num = reservation_list.get(i)[2]; //reservenum
				%>
				
				<script> 
				//회원의 예약목록 출력
				var tr = document.createElement('tr');
				var td = document.createElement('td');
				var temp ="<%=r_store_no%>";
				var text = document.createTextNode(temp);
				td.appendChild(text);
				tr.appendChild(td);
				
				td = document.createElement('td');
				temp ="<%=reserve_time%>";	
				text = document.createTextNode(temp);
				td.appendChild(text);
				tr.appendChild(td);
				
				td = document.createElement('td');
				temp ="<%=wating_num%>";	 /* 대출가능한날짜로 수정해야함 수정함 */ 
				text = document.createTextNode(temp);
				td.appendChild(text);
				tr.appendChild(td);
				
				
				
				
				td = document.createElement('td');
				
				//버튼 만드는곳
				/* var bt = document.createElement('button'); */
				
				//rental_available이 true면 대출버튼으로 false면 예약취소버튼으로
				
					var form = document.createElement('form');
					form.action = "b_reservationCancel.jsp";
					
					var rt = document.createElement('input');
					rt.type = "submit";
					rt.value = "예약취소";
					
					var hidstoreid = document.createElement('input');
					hidstoreid.type = "hidden";
					hidstoreid.name = "hidstoreid";
					hidstoreid.value = '<%=r_store_no%>';
					form.appendChild(hidstoreid);
					form.appendChild(rt);
					
					td.appendChild(form);
					tr.appendChild(td);
					
				
				document.getElementById('reservation-list').appendChild(tr); 
				
				
				
		/* 		테이블에 동적으로 만든 행 추가 */
				

				
				</script>


				<%
					} //reservation for end 예약목록 출력 반복문 끝
				%>
				
				
				
				
				
				
				
			</table>
			<!-- <iframe id="if" name="param" src= "Iframe.jsp" style="display:block; width:45%; height: 100vh" frameborder="0" scrolling="no"></iframe> -->
		</div>

	</div>

	<!-- iframe 끝 -->

</body>
</html>