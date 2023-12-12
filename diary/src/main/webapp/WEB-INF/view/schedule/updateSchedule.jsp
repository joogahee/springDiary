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
	<h2>${year}년 ${month}월 ${day}일</h2>
	<h2>일정수정</h2>
	<p>일정을 수정하려면 비밀번호를 입력하세요</p>
	<form method="post" achtion="${pageContext.request.contextPath}/schedule/updateSchedule" id="updateScheduleForm">
			<input type="hidden" name="year" value="${year}">
			<input type="hidden" name="month" value="${month}">
			<input type="hidden" name="day" value="${day}">
		<table border="1">
			<tr>
				<th>번호</th>
				<td><input type="text" name="scheduleNo" value="${schedule.scheduleNo }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>일정</th>
				<td><textarea rows="3" cols="80" name="scheduleMemo" id="scheduleMemo">${schedule.scheduleMemo }</textarea></td>
			</tr>
			<tr>
				<th>날짜</th>
				<td><input type="date" name="scheduleDate" value="${schedule.scheduleDate }" ></td>
			</tr>
			<tr>
				<th>이모티콘 ${schedule.scheduleEmoji}</th>
				<td>
					<label>
    					<input type="radio" name="scheduleEmoji" value="&#127955;" ${schedule.scheduleEmoji eq '&#127955;' ? 'checked' : ''}> &#127955;
					</label>
					<label>
    					<input type="radio" name="scheduleEmoji" value="&#127873;" ${schedule.scheduleEmoji eq '&#127873;' ? 'checked' : ''}> &#127873;
					</label>
					<label>
					    <input type="radio" name="scheduleEmoji" value="&#128525;" ${schedule.scheduleEmoji eq '&#128525;' ? 'checked' : ''}> &#128525;
					</label>
					<label>
					    <input type="radio" name="scheduleEmoji" value="&#127875;" ${schedule.scheduleEmoji eq '&#127875;' ? 'checked' : ''}> &#127875;
					</label>
					<label>
					    <input type="radio" name="scheduleEmoji" value="&#127912;" ${schedule.scheduleEmoji eq '&#127912;' ? 'checked' : ''}> &#127912;
					</label>
					<label>
					    <input type="radio" name="scheduleEmoji" value="&#127925;" ${schedule.scheduleEmoji eq '&#127925;' ? 'checked' : ''}> &#127925;
					</label>
					<label>
					    <input type="radio" name="scheduleEmoji" value="&#128176;" ${schedule.scheduleEmoji eq '&#128176;' ? 'checked' : ''}> &#128176;
					</label>
					<label>
					    <input type="radio" name="scheduleEmoji" value="&#128137;" ${schedule.scheduleEmoji eq '&#128137;' ? 'checked' : ''}> &#128137;
					</label>
					<label>
					    <input type="radio" name="scheduleEmoji" value="&#9940;" ${schedule.scheduleEmoji eq '&#9940;' ? 'checked' : ''}> &#9940;
					</label>
					<label>
					    <input type="radio" name="scheduleEmoji" value="" ${schedule.scheduleEmoji eq '' ? 'checked' : ''}> 이모티콘 없음
					</label>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="password"></td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>