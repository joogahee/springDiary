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
	<h1>비밀번호 변경</h1>
		<form method="post" action="${pageContext.servletContext.contextPath}/member/updateMember">
			<table border="1">
				<tr>
					<th>ID</th>
					<td><input type="text" name="memberId" value="${updateMember.memberId}" readonly="readonly"></td>
				</tr>
				<tr>
					<th>Password</th>
					<td><input type="password" name="memberPw"></td>
				</tr>
				<tr>
					<th>변경할 Password</th>
					<td><input type="password" name="updateMemberPw"></td>
				</tr>					
			</table>
			<button type="submit">변경</button>
		</form>	
</body>
</html>