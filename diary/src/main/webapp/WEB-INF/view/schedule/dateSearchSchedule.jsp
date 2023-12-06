<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>날짜별 일정 조회</h1>
	<div>
	<form action="${pageContext.servletContext.contextPath}/schedule/scheduleByDate" method="get">
		<label for="year">년:</label>
    <select id="year" name="year">
    	<option value=""></option> 
		<c:forEach var="y" begin="${map.maxMinMap.minYear}" end="${map.maxMinMap.maxYear }"> 
        	<option value="${y}">${y}</option> 
       	</c:forEach>
    </select>

    <label for="month">월:</label>
    <select id="month" name="month">
    	<option value=""></option> 
 		<c:forEach var="m" begin="1" end="12">
			<option value="${m}">${m}</option>
  		</c:forEach>
    </select>

    <label for="day">일:</label>
    <select id="d" name="day">
    	<option value=""></option> 
		<c:forEach var="day" begin="1" end="31">
       		<option value="${day}">${day}</option>
        </c:forEach>
    </select>
	<button type="submit">검색</button>
	<a href="${pageContext.servletContext.contextPath}/schedule/scheduleByDate">전체보기</a>
	</form>
	</div>
	<h2>
		<c:choose>
		    <c:when test="${not empty year}">
		        ${year}년
		    </c:when>
		    <c:otherwise>
		        &nbsp;
		    </c:otherwise>
		</c:choose>
		
		<c:choose>
		    <c:when test="${not empty month}">
		        ${month}월
		    </c:when>
		    <c:otherwise>
		        &nbsp;
		    </c:otherwise>
		</c:choose>
		
		<c:choose>
		    <c:when test="${not empty day}">
		        ${day}일
		    </c:when>
		    <c:otherwise>
		        &nbsp;
		    </c:otherwise>
		</c:choose>
	 </h2>
	<c:if test="${not empty map.list}">
    <table border="1">
        <thead>
            <tr>
                <th>날짜</th>
                <th>일정</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="schedule" items="${map.list}">
                <tr>
                    <td>${schedule.scheduleDate}</td>
                    <td>${schedule.scheduleMemo}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>
<c:if test="${empty map.list}">
    <p>스케줄이 없습니다</p>
</c:if>

<!-- 페이징 -->
<div>
    <c:if test="${currentPage > 1}">
        <a href="${pageContext.request.contextPath}/schedule/scheduleByDate?year=${year}&month=${month}&day=${day}&currentPage=${currentPage - 1}">이전</a>
    </c:if>

        <a href="${pageContext.request.contextPath}/schedule/scheduleByDate?year=${year}&month=${month}&day=${day}&currentPage=${currentPage + 1}">다음</a>

</div>

</body>
</html>