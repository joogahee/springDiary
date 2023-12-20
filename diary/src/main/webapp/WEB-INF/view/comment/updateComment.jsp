<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 수정</title>
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
		<h1>&#128396;댓글 수정</h1>
		<p>&#10004;수정하려면 비밀번호를 입력하세요.</p>
			<form method="post" action="${pageContext.servletContext.contextPath}/comment/updateComment">
			    <input type="hidden" name="noticeNo" value="${comment.noticeNo}">
			    
			    <div class="form-group">
			        <label for="commentNo">수정할 댓글</label>
			        <input type="text" class="form-control" name="commentNo" value="${comment.commentNo}">
			    </div>
			    
			    <div class="form-group">
			        <label for="commentContent">내용</label>
			        <textarea rows="3" class="form-control" name="commentContent">${comment.commentContent}</textarea>
			    </div>
			    
			    <div class="form-group">
			        <label for="createdate">작성일</label>
			        <div>${comment.createdate}</div>
			    </div>
			    
			    <div class="form-group">
			        <label>비밀글</label>
			        <div>
			            <c:if test="${comment.isSecret == 1}">
			                🔏
			            </c:if>
			        </div>
			    </div>
			    
			    <div class="form-group">
			        <label for="memberPw">비밀번호</label>
			        <input type="password" class="form-control" name="memberPw">
			    </div>
			    
			    <button type="submit" class="btn btn-outline-info btn-sm">수정</button>
			</form>
	</div>
</body>
</html>