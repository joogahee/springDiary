<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<div>
		<h2>${year}년 ${month}월 ${day}일</h2>
	</div>
	<div>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>이모티콘</th>
				<th>일정</th>
				<th>작성일</th>
			</tr>
			
			<c:forEach var="schedule" items="${list}">
				<tr>
					<td>${schedule.scheduleNo }</td>
					<td>${schedule.scheduleEmoji }</td>
					<td>${schedule.scheduleMemo }</td>
					<td>${schedule.createdate }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<h2>일정추가</h2>
		<form method="post" action="${pageContext.request.contextPath}/schedule/addSchedule" id="scheduleAddForm">
			<input type="hidden" name="year" value="${year}">
			<input type="hidden" name="month" value="${month}">
			<input type="hidden" name="day" value="${day}">
			<label>
        		<input type="radio" name="emoji" value="&#127955;"> &#127955;
   			</label>
    		<label>
        		<input type="radio" name="emoji" value="&#127873;"> &#127873;
    		</label>
    		<label>
       	 		<input type="radio" name="emoji" value="&#128525;"> &#128525;
    		</label>
    		<label>
        		<input type="radio" name="emoji" value="&#127875;"> &#127875;
    		</label>
    		<label>
        		<input type="radio" name="emoji" value="&#127912;"> &#127912;
    		</label>
    		<label>
        		<input type="radio" name="emoji" value="&#127925;"> &#127925;
    		</label>
    		<label>
        		<input type="radio" name="emoji" value="&#128176;"> &#128176;
    		</label>
    		<label>
        		<input type="radio" name="emoji" value="&#128137;"> &#128137;
    		</label>
    		 <label>
        		<input type="radio" name="emoji" value="&#9940;"> &#9940;
    		</label>
    		 <label>
        		<input type="radio" name="emoji" value=""> 이모티콘 없음
    		</label>
			<table border="1">
				<tr>
					<td>
						<textarea rows="3" cols="80" name="scheduleMemo" id="scheduleMemo"></textarea>
					</td>
					<td>
						<button type="submit" id="scheduleAddButton" class="button add">추가</button>
					</td>
				</tr>
			</table>
		</form>
</body>
</html>