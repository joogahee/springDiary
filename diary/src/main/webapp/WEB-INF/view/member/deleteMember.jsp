<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<h1>회원탈퇴</h1>
		<form method="post" action="${pageContext.servletContext.contextPath}/member/deleteMember">
			<table border="1">
				<tr>
					<th>ID</th>
					<td><input type="text" name="memberId" value="${deleteMember.memberId}" readonly="readonly"></td>
				</tr>
				<tr>
					<th>Password</th>
					<td><input type="password" name="memberPw"></td>
				</tr>				
			</table>
			<button type="submit">탈퇴</button>
		</form>	
</body>
</html>