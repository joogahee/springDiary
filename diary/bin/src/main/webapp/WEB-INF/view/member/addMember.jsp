<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<h1>회원가입</h1>
   <form method="post" action="${pageContext.request.contextPath}/member/addMember">
      <table border="1">
         <tr>
            <td>ID</td>
            <td><input type="text" name="memberId" class="memberId"></td>
         </tr>
         
         <tr>
            <td>PW</td>
            <td><input type="password" name="memberPw" class="memberPw"></td>
         </tr>
      </table>
            <button type="submit">가입하기</button>
   </form>
   <a href="${pageContext.request.contextPath}/member/login">로그인</a>
</body>

</html>