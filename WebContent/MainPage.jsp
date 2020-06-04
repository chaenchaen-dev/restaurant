<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			
			<form action="Iframe.jsp" target="param">
				 
				
				
				<label>매장검색</label> 
			<input type="text" name="searchContent" autofocus>
			<input type="submit" value="검색">
			
				
			</form>

		</div>
		</br>
		
<!-- 검색 결과 뽑는 iframe -->

		<div id="side_content_box">
		<iframe id="if" name="param" src= "Iframe.jsp" style="display:block; width:45%; height: 100vh" frameborder="0" scrolling="no"></iframe>
		</div>
			
	</div>
	
	<!-- iframe 끝 -->

</body>
</html>