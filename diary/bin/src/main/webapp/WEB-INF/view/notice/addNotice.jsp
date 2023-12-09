<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="menu">
    	<c:import url="/WEB-INF/view/inc/menu.jsp" />
	</div>
	<h1>공지 추가</h1>
		<form method="post" action="${pageContext.servletContext.contextPath}/notice/addNotice">
			<table border="1">
				<tr>
					<th>제목</th>
					<td><input type="text" name="noticeTitle"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="3" cols="50" name="noticeContent"></textarea></td>
				</tr>				
			</table>
			<button type="submit">추가</button>
		</form>
</body>
</html>