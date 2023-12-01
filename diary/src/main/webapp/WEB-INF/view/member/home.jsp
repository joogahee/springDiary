<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Home</h1>
	<p>
		${noticeMap.loginMember.memberId}님 정보관리 
		<a href="${pageContext.servletContext.contextPath}/member/logout">로그아웃</a>
		<a href="${pageContext.servletContext.contextPath}/member/deleteMember">회원탈퇴</a>
		<a href="${pageContext.servletContext.contextPath}/member/updateMember">비밀번호변경</a>
	</p>
	
	<h2>공지사항</h2>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
		</tr>
		<c:forEach var="notice" items="${noticeMap.noticeList}">
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
	<p>페이지: ${noticeMap.currentPage}</p>
	
		<!-- login한 member의 level이 1일때만 공지 추가 가능  -->
		<c:if test="${memberLevel ==1}">
			<a href="${pageContext.servletContext.contextPath}/notice/addNotice">공지추가</a>
		</c:if>
	<!-- 페이징 -->
	<div>
        <c:if test="${noticeMap.currentPage > 1}">
		<a href="${pageContext.request.contextPath}/member/home?currentPage=${noticeMap.currentPage - 1}">이전</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/member/home?currentPage=${noticeMap.currentPage + 1}">다음</a>
    </div>
    <!-- 캘린더 -->

    <div>
    	<h2>
    		${calendarMap.targetYear}년
    		${calendarMap.targetMonth+1}월 일정
    	</h2>
    </div>
    <div>
    	<a href="">이전달</a>
    	<a href="">이전달</a>
    </div>
    <div>
    	<table border="1">
      <tr>
         <c:forEach var="i" begin="1" end="${calendarMap.totalTd}">
            <c:set var="d" value="${i-calendarMap.beginBlank}"/>
            <td>
               <c:if test="${d < 1 || d> calendarMap.lastDate}">
                  &nbsp;
               </c:if>
               <c:if test="${!(d < 1 || d> calendarMap.lastDate)}">
                  <a href="">${d}</a>
               </c:if>
               
               <!-- 한 행 당 7열 -->
               <c:if test="${i<calendarMap.totalTd && i%7==0}">
                  </tr><tr>
               </c:if>
            </td>
         
         </c:forEach>
      </tr>
   </table>
    </div>
</body>
</html>