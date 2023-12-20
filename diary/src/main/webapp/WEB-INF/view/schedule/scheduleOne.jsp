<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스케줄 상세 보기</title>
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
	<div>
		<h2>&#9200; ${year}년 ${month}월 ${day}일 &#9000;</h2>
	</div>
	<br>
	<br>
	<div class="table-responsive">
	    <table class="table table-bordered table-hover">
	        <thead class="thead-dark">
	            <tr>
	                <th>번호</th>
	                <th>이모티콘</th>
	                <th>일정</th>
	                <th>작성일</th>
	                <th>수정</th>
	                <th>삭제</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="schedule" items="${list}">
	                <tr>
	                    <td>${schedule.scheduleNo}</td>
	                    <td>${schedule.scheduleEmoji}</td>
	                    <td>
	                        <textarea rows="3" class="form-control" name="scheduleMemo" id="scheduleMemo" readonly="readonly">${schedule.scheduleMemo}</textarea>
	                    </td>
	                    <td>${schedule.createdate}</td>
	                    <td>
	                        <a href="${pageContext.request.contextPath}/schedule/updateSchedule?scheduleNo=${schedule.scheduleNo}&year=${year}&month=${month}&day=${day}" class="btn btn-warning btn-sm">수정</a>
	                    </td>
	                    <td>
	                        <a href="${pageContext.request.contextPath}/schedule/deleteSchedule?scheduleNo=${schedule.scheduleNo}&year=${year}&month=${month}&day=${day}" class="btn btn-danger btn-sm">삭제</a>
	                    </td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
	</div>
	<br>
	<br>
	<h2>일정추가</h2>
		<form method="post" action="${pageContext.request.contextPath}/schedule/addSchedule" id="scheduleAddForm">
		    <input type="hidden" name="year" value="${year}">
		    <input type="hidden" name="month" value="${month}">
		    <input type="hidden" name="day" value="${day}">
		
		    <div class="mb-3">
		        <label>이모티콘 선택:</label>
		        <div class="btn-group" role="group">
		            <input type="radio" name="emoji" value="&#127955;" id="emoji1"> <label for="emoji1">&#127955;</label>
		            <input type="radio" name="emoji" value="&#127873;" id="emoji2"> <label for="emoji2">&#127873;</label>
		            <input type="radio" name="emoji" value="&#128525;" id="emoji3"> <label for="emoji3">&#128525;</label>
		            <input type="radio" name="emoji" value="&#127875;" id="emoji4"> <label for="emoji4">&#127875;</label>
		            <input type="radio" name="emoji" value="&#127912;" id="emoji5"> <label for="emoji5">&#127912;</label>
		            <input type="radio" name="emoji" value="&#127925;" id="emoji6"> <label for="emoji6">&#127925;</label>
		            <input type="radio" name="emoji" value="&#128137;" id="emoji7"> <label for="emoji7">&#128137;</label>
		            <input type="radio" name="emoji" value="" id="noEmoji" checked> <label for="noEmoji">이모티콘 없음</label>
		        </div>
		    </div>	
    	<div class="mb-3">
        	<label>일정 메모:</label>
        	<textarea class="form-control" rows="3" cols="80" name="scheduleMemo" id="scheduleMemo"></textarea>
    	</div>

    	<button type="submit" id="scheduleAddButton" class="btn btn-success">추가</button>
	</div>
	<br>
	<br>
	<br>
</body>
</html>