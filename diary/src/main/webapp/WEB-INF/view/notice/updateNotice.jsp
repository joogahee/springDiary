<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 수정</title>
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
		<h2>&#128396; 공지수정 </h2>
			<p>&#10004; 수정하려면 비밀번호를 입력하세요.</p>
		   	<form method="post" action="${pageContext.servletContext.contextPath}/notice/updateNotice" class="updateNotice">
				<div class="form-group">
					<label for="noticeNo">공지번호</label>
				    <input type="text" readonly="readonly" class="form-control" id="noticeNo" name="noticeNo" value="${updateNotice.noticeNo}">
				</div>
				
				<div class="form-group">
				    <label for="noticeTitle">제목</label>
				    <input type="text" class="form-control noticeTitle" id="noticeTitle" name="noticeTitle" value="${updateNotice.noticeTitle}">
				</div>
				
				<div class="form-group">
				    <label for="noticeContent">내용</label>
				    <textarea rows="3" cols="50" class="form-control noticeContent" id="noticeContent" name="noticeContent">${updateNotice.noticeContent}</textarea>
				</div>
				
				<div class="form-group">
				    <label for="memberId">작성자(자동변경)</label>
				    <input type="text" readonly="readonly" class="form-control" id="memberId" name="memberId" value="${loginMember.memberId}">
				</div>
				
				<div class="form-group">
				    <label for="createdate">작성일</label>
				   	<input type="text" readonly="readonly" class="form-control" id="createdate" name="createdate" value="${updateNotice.createdate}">
			    </div>
				
				<div class="form-group">
				    <label for="memberPw">비밀번호</label>
				    <input type="password" class="form-control" id="memberPw" name="memberPw">
				</div>
				
		    	<button type="submit" class="btn btn-outline-info btn-sm">수정하기</button>
			</form>
   </div>
</body>
</html>