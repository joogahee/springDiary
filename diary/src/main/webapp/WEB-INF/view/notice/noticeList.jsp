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
	<h1>공지사항</h1>
	<p>page: ${currentPage}</p>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
		</tr>
		<c:forEach var="notice" items="${noticeList}">
			<tr>
				<td>
    				${notice.noticeNo}
    			</td>
    			<td>
    				<a href="${pageContext.servletContext.contextPath}/notice/noticeOne?noticeNo=${notice.noticeNo}">
    					${notice.noticeTitle}
    				</a>
    			</td>
    		</tr>
		</c:forEach>
	</table>
		<a href="${pageContext.servletContext.contextPath}/notice/addNotice">공지추가</a>
	
	<!-- 페이징 -->
	<div>
        <c:if test="${currentPage > 1}">
		<a href="${pageContext.request.contextPath}/notice/noticeList?currentPage=${currentPage - 1}">이전</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/notice/noticeList?currentPage=${currentPage + 1}">다음</a>
    </div>
</body>
</html>