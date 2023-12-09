<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<div>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>이모티콘</th>
				<th>일정</th>
				<th>작성일</th>
			</tr>
			
			<c:forEach var="schedule" items="${list}">
				<tr>
					<td>${schedule.scheduleNo }</td>
					<td>${schedule.scheduleEmoji }</td>
					<td>${schedule.scheduleMemo }</td>
					<td>${schedule.createdate }</td>
				</tr>
			</c:forEach>
		</table>
	
	</div>
</body>
</html>