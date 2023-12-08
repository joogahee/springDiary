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
	<h1>공지 삭제</h1>
	<p>삭제하려면 비밀번호를 입력하세요.</p>
	<form method="post" action="${pageContext.servletContext.contextPath}/notice/deleteNotice">
		<input type="hidden" name="noticeNo" value="${deleteNotice.noticeNo}">
		<table border="1">
			<tr>
				<th>삭제할 공지</th>
				<td>${deleteNotice.noticeNo}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${deleteNotice.noticeTitle}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="3" cols="50" name="noticeContent">${deleteNotice.noticeContent}</textarea></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${deleteNotice.createdate}</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="memberPw" class="memberPw"></td>
			</tr>
		</table>
		<button type="submit">삭제</button>
	</form>
</body>
</html>