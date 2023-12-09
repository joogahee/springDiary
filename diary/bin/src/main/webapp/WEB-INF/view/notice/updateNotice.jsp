<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<div id="menu">
    	<c:import url="/WEB-INF/view/inc/menu.jsp" />
	</div>
<h1> 공지수정 </h1>
   <form method="post" action="${pageContext.servletContext.contextPath}/notice/updateNotice" class="updateNotice">
      <table border="1">
      
         <tr>
            <td>공지번호</td>            
            <td><input type="text" readonly="readonly" name="noticeNo" value="${updateNotice.noticeNo}"></td>
         </tr>
            
         <tr>
            <td>제목</td>      
            <td><input type="text" name="noticeTitle" value="${updateNotice.noticeTitle}" class="noticeTitle"></td>            
         </tr>
         
         
         <tr>
            <td>내용</td>         
            <td><textarea rows="3" cols="50" name="noticeContent" class="noticeContent">${updateNotice.noticeContent}</textarea></td>
         </tr>
         
         <tr>
            <td>작성자(자동변경)</td>   
            <td><input type="text" name="memberId" readonly="readonly" value="${loginMember.memberId}"></td>
         </tr>
            
         <tr>
            <td>작성일</td>      
            <td><input type="text" name="createdate" readonly="readonly" value="${updateNotice.createdate}"></td>
         </tr>
        <tr>
            <td>비밀번호</td>      
            <td><input type="password" name="memberPw"></td>
         </tr>      
      </table>
               <button type="submit" class ="updateBtn">수정하기</button>
   </form>
</body>
</html>