<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
	<table border="1">
		<tr>
			<th>no</th>
			<th>memo</th>
		</tr>
		<c:forEach var="s" items="${list}">
			<tr>
				<td>${s.scheduleNo }</td>
				<td>${s.scheduleMemo }</td>
			</tr>
		</c:forEach>
	</table>
	<div>
		<form action="${pageContext.servletContext.contextPath}/schedule/word" method="get">
			<input type="text" name="word"> 
			<button type="submit">검색</button>
		</form>
	</div>
</body>
</html>