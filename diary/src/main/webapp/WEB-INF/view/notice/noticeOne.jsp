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
	<!-- loginMember의 memberLevel이 1일 경우에만 수정,삭제 버튼 노출 -->
	<c:if test="${memberLevel == 1}">
		<a href="${pageContext.servletContext.contextPath}/notice/updateNotice?noticeNo=${noticeOne.noticeNo}">수정</a>
		<a href="${pageContext.servletContext.contextPath}/notice/deleteNotice?noticeNo=${noticeOne.noticeNo}">삭제</a>
	</c:if>
	<!-- comment 출력 -->
	<h2>댓글</h2>
	<table border="1">
		<c:forEach var="comment" items="${commentList}">
		<tr>
			<th>번호</th>
			<td>${comment.commentNo }</td>
			<th>작성자</th>
			<td>${comment.memberId }</td>
			<th>비밀글</th>
			<td>
				<c:if test="${comment.isSecret == 1 }">
				🔏
				</c:if>
			</td>
		</tr>
<tr>
    <th>내용</th>
    <c:choose>
        <c:when test="${comment.isSecret == 0}">
            <td colspan="5">
                <textarea rows="3" cols="50" name="commentContent" readonly="readonly">${comment.commentContent}</textarea>
            </td>
        </c:when>
        <c:when test="${comment.isSecret == 1 and (memberLevel == 1 or comment.memberId == loginMemberId)}">
            <td colspan="5">
                <textarea rows="3" cols="50" name="commentContent" readonly="readonly">${comment.commentContent}</textarea>
            </td>
        </c:when>
        <c:otherwise>
            <td colspan="5">
                <textarea rows="3" cols="50" name="commentContent" readonly="readonly">비밀글입니다</textarea>
            </td>
        </c:otherwise>
    </c:choose>
</tr>
		<tr>
			<th>작성일</th>
			<td colspan="5">${comment.createdate }</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>