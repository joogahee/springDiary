<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날짜별 일정 조회</title>
<!-- jQuery css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- jQuery CDN 주소 -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha384-o3MhHVfqyFmXH5bLZC0DBOI1Cg3cCjTwxeRUq2zXn5CZAA/PLldpGFFC2eLbMKCs" crossorigin="anonymous"></script>
<style>
    .backdiv {
        background-color: #f2f2f1; /* 배경 색상 설정 */
    }
    .paging {
        background-color:#112E27; 
        color: #fff; 
        padding: 8px 15px; 
        border-radius: 5px; 
        text-decoration: none; 
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
		<button class="btn btn-outline-success btn-sm" type="submit">검색</button>
		<a class="btn btn-outline-success btn-sm" href="${pageContext.servletContext.contextPath}/schedule/scheduleByDate">전체보기</a>
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
    	<table class="table table-bordered table-sm">
        	<thead class="thead-dark">
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
		<a href="${pageContext.request.contextPath}/schedule/scheduleByDate?year=${year}&month=${month}&day=${day}&currentPage=1">처음</a>
			<c:forEach var="c" begin="1" end="${map.lastPage}">
    			<a href="${pageContext.request.contextPath}/schedule/scheduleByDate?year=${year}&month=${month}&day=${day}">${c}</a>
			</c:forEach>
		<a href="${pageContext.request.contextPath}/schedule/scheduleByDate?year=${year}&month=${month}&day=${day}&currentPage=${map.lastPage}">마지막</a>
    </div>
</div>
</body>
</html>