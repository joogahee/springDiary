<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>공지사항 상세보기</h1>
	<table border="1">
		<tr>
			<th>번호</th>
				<td>${noticeOne.noticeNo}</td>
		</tr>
		<tr>
			<th>제목</th>
				<td>${noticeOne.noticeTitle}</td>
		</tr>
		<tr>
			<th>내용</th>
				<td><textarea rows="3" cols="50" name="noticeContent" readonly="readonly">${noticeOne.noticeContent}</textarea></td>
		</tr>
		<tr>
			<th>작성일</th>
				<td>${noticeOne.createdate}</td>
		</tr>
	</table>
	<a href="${pageContext.servletContext.contextPath}/notice/updateNotice?noticeNo=${noticeOne.noticeNo}">수정</a>
	<a href="${pageContext.servletContext.contextPath}/notice/deleteNotice?noticeNo=${noticeOne.noticeNo}">삭제</a>
</body>
</html>