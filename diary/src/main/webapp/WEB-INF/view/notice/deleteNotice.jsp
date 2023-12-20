<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 삭제</title>
<!-- jQuery css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- jQuery CDN 주소 -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha384-o3MhHVfqyFmXH5bLZC0DBOI1Cg3cCjTwxeRUq2zXn5CZAA/PLldpGFFC2eLbMKCs" crossorigin="anonymous"></script>
<style>
    .backdiv {
        background-color: #f2f2f1; /* 배경 색상 설정 */
    }  
</style>
</head>
<body>
	<div class="container backdiv">
        <!-- 메뉴바 -->
		<div id="menu">
    		<c:import url="/WEB-INF/view/inc/menu.jsp" />
		</div>
		<br>
		<div class="mx-4">
		<h2>&#128465;공지 삭제</h2>
			<p>&#10004; 삭제하려면 비밀번호를 입력하세요.</p>
			<form method="post" action="${pageContext.servletContext.contextPath}/notice/deleteNotice">
			    <input type="hidden" name="noticeNo" value="${deleteNotice.noticeNo}">
			
			    <div class="form-group">
			        <label for="deleteNoticeNo">삭제할 공지</label>
			        <input type="text" class="form-control" id="deleteNoticeNo" name="deleteNoticeNo" value="${deleteNotice.noticeNo}" readonly>
			    </div>
			
			    <div class="form-group">
			        <label for="deleteNoticeTitle">제목</label>
			        <input type="text" class="form-control" id="deleteNoticeTitle" name="deleteNoticeTitle" value="${deleteNotice.noticeTitle}" readonly>
			    </div>
			
			    <div class="form-group">
			        <label for="deleteNoticeContent">내용</label>
			        <textarea rows="3" class="form-control" id="deleteNoticeContent" name="noticeContent" readonly>${deleteNotice.noticeContent}</textarea>
			    </div>
			
			    <div class="form-group">
			        <label for="deleteNoticeDate">작성일</label>
			        <input type="text" class="form-control" id="deleteNoticeDate" name="deleteNoticeDate" value="${deleteNotice.createdate}" readonly>
			    </div>
			
			    <div class="form-group">
			        <label for="memberPw">비밀번호</label>
			        <input type="password" class="form-control memberPw" id="memberPw" name="memberPw">
			    </div>
			
			    <button type="submit" class="btn btn-outline-danger btn-sm">삭제</button>
			</form>
		</div>
	</div>
</body>
</html>