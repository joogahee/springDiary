<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지추가</title>
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
		<h2>공지 추가</h2>
		<br>
<form method="post" action="${pageContext.servletContext.contextPath}/notice/addNotice">
    <div class="form-group">
        <label for="noticeTitle">제목</label>
        <input type="text" class="form-control" id="noticeTitle" name="noticeTitle">
    </div>
    <div class="form-group">
        <label for="noticeContent">내용</label>
        <textarea class="form-control" rows="3" id="noticeContent" name="noticeContent"></textarea>
    </div>
    <div>
    	<button type="submit" class="btn btn-outline-dark btn-sm">추가</button>
    </div>
</form>
		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
	</div>
</body>
</html>