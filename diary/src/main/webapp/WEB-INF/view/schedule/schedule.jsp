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
	<h2>단어별 일정조회</h2>
	<div>
		<form action="${pageContext.servletContext.contextPath}/schedule/word" method="get">
			<input type="text" name="word"> 
			<button type="submit">검색</button>
		</form>
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
				<td>${s.scheduleDate }</td>
				<td>${s.scheduleEmoji }</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 페이징 -->
	<div>
		<a href="${pageContext.request.contextPath}/schedule/word?currentPage=1&word=${word}">처음</a>
			<c:forEach var="c" begin="1" end="${lastPage}">
    			<a href="${pageContext.request.contextPath}/schedule/word?currentPage=${c}&word=${word}">${c}</a>
			</c:forEach>
		<a href="${pageContext.request.contextPath}/schedule/word?currentPage=${lastPage}&word=${word}">마지막</a>
    </div>
</body>
</html>