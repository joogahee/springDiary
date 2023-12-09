<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="">
	<div class="">
		<!-- 로고 -->
		<div class="">
            <span class="">다이어리</span>
        </div>
	
		<!-- 메뉴 -->
	    <ul>
	        <li><a href="${pageContext.request.contextPath}/member/home">홈으로</a></li>
	        <li><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
	        <li><a href="${pageContext.request.contextPath}/member/updateMember">비밀번호수정</a></li>
	        <li><a href="${pageContext.request.contextPath}/member/deleteMember">회원탈퇴</a></li>
	    </ul>
	    
	</div>
</body>
</html>