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
	<h1>댓글 수정</h1>
	<p>수정하려면 비밀번호를 입력하세요.</p>
	<form method="post" action="${pageContext.servletContext.contextPath}/comment/updateComment">
		<input type="hidden" name="noticeNo" value="${comment.noticeNo}">
		<table border="1">
			<tr>
				<th>수정할 댓글</th>
				<td><input type="text" name="commentNo" value="${comment.commentNo }"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="3" cols="50" name="commentContent">${comment.commentContent}</textarea></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${comment.createdate}</td>
			</tr>
			<tr>
				<th>
					비밀글
				</th>
				<td>
				<c:if test="${comment.isSecret == 1 }">
				🔏
				</c:if>
			</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="memberPw" class="memberPw"></td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>