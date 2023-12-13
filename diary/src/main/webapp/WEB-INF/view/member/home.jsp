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
	<div id="menu">
    	<c:import url="/WEB-INF/view/inc/menu.jsp" />
	</div>
	<p>
		${noticeMap.loginMember.memberId}님 환영합니다 
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
		<c:if test="${noticeMap.loginMember.memberLevel ==1}">
			<a href="${pageContext.servletContext.contextPath}/notice/addNotice">공지추가</a>
		</c:if>
	<!-- 페이징 -->
	<div>
		<a href="${pageContext.request.contextPath}/member/home?currentPage=1">처음</a>
		<c:forEach var="c" begin="1" end="${noticeMap.lastPage}">
			<a href="${pageContext.request.contextPath}/member/home?currentPage=${c}">${c}</a>
		</c:forEach>
		<a href="${pageContext.request.contextPath}/member/home?currentPage=${noticeMap.lastPage}">마지막</a>
    </div>
    <!-- 캘린더 -->

    <div>
    	<h2>
    		${calendarMap.targetYear}년
    		${calendarMap.targetMonth+1}월 일정
    	</h2>
    </div>
    <div>
    	<a href="${pageContext.servletContext.contextPath}/member/home?targetMonth=${calendarMap.targetMonth-1}&targetYear=${calendarMap.targetYear}">이전달</a>
    	<a href="${pageContext.servletContext.contextPath}/member/home?targetMonth=${calendarMap.targetMonth+1}&targetYear=${calendarMap.targetYear}">다음달</a>
    </div>
    <div>
    	<table border="1">
    		<tr>
		        <th>일</th>
		        <th>월</th>
		        <th>화</th>
		        <th>수</th>
		        <th>목</th>
		        <th>금</th>
		        <th>토</th>
			</tr>
      <tr>
         <c:forEach var="i" begin="1" end="${calendarMap.totalTd}">
            <c:set var="d" value="${i-calendarMap.beginBlank}"/>
            <td>
               <c:if test="${d < 1 || d> calendarMap.lastDate}">
                  &nbsp;
               </c:if>
               <c:if test="${!(d < 1 || d > calendarMap.lastDate)}">
                    <a href="${pageContext.servletContext.contextPath}/schedule/scheduleOne?year=${calendarMap.targetYear}&month=${calendarMap.targetMonth+1}&day=${d}">
                        ${d}
                    </a>
                        <c:forEach var="schedule" items="${list}">
                            <c:if test="${schedule.scheduleDay == d}">
                                <p>${schedule.cnt}개의 일정</p>
                                <p>${schedule.scheduleEmoji}</p>
                            </c:if>
                        </c:forEach>
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