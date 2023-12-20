<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스케줄 삭제</title>
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
	<h2>&#128465; 일정삭제</h2>
	<br>
	<p>&#10004; 일정을 삭제하려면 비밀번호를 입력하세요</p>
	<form method="post" achtion="${pageContext.request.contextPath}/schedule/deleteSchedule" id="deleteScheduleForm">
			<input type="hidden" name="year" value="${year}">
			<input type="hidden" name="month" value="${month}">
			<input type="hidden" name="day" value="${day}">
		<table class="table table-bordered table-striped">
			<tr>
				<th>번호</th>
				<td><input type="text" name="scheduleNo" value="${schedule.scheduleNo }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>일정</th>
				<td><textarea rows="3" cols="80" name="scheduleMemo" id="scheduleMemo" readonly="readonly">${schedule.scheduleMemo }</textarea></td>
			</tr>
			<tr>
				<th>날짜</th>
				<td><input type="date" name="scheduleDate" value="${schedule.scheduleDate }" readonly="readonly" ></td>
			</tr>
			<tr>
				<th>이모티콘 ${schedule.scheduleEmoji}</th>
				<td>
					<label>
    					<input type="radio" name="scheduleEmoji" readonly="readonly" value="&#127955;" ${schedule.scheduleEmoji eq '&#127955;' ? 'checked' : ''}> &#127955;
					</label>
					<label>
    					<input type="radio" name="scheduleEmoji" readonly="readonly" value="&#127873;" ${schedule.scheduleEmoji eq '&#127873;' ? 'checked' : ''}> &#127873;
					</label>
					<label>
					    <input type="radio" name="scheduleEmoji" readonly="readonly" value="&#128525;" ${schedule.scheduleEmoji eq '&#128525;' ? 'checked' : ''}> &#128525;
					</label>
					<label>
					    <input type="radio" name="scheduleEmoji" readonly="readonly" value="&#127875;" ${schedule.scheduleEmoji eq '&#127875;' ? 'checked' : ''}> &#127875;
					</label>
					<label>
					    <input type="radio" name="scheduleEmoji" readonly="readonly" value="&#127912;" ${schedule.scheduleEmoji eq '&#127912;' ? 'checked' : ''}> &#127912;
					</label>
					<label>
					    <input type="radio" name="scheduleEmoji" readonly="readonly" value="&#127925;" ${schedule.scheduleEmoji eq '&#127925;' ? 'checked' : ''}> &#127925;
					</label>
					<label>
					    <input type="radio" name="scheduleEmoji" readonly="readonly" value="&#128176;" ${schedule.scheduleEmoji eq '&#128176;' ? 'checked' : ''}> &#128176;
					</label>
					<label>
					    <input type="radio" name="scheduleEmoji" readonly="readonly" value="&#128137;" ${schedule.scheduleEmoji eq '&#128137;' ? 'checked' : ''}> &#128137;
					</label>
					<label>
					    <input type="radio" name="scheduleEmoji" readonly="readonly" value="&#9940;" ${schedule.scheduleEmoji eq '&#9940;' ? 'checked' : ''}> &#9940;
					</label>
					<label>
					    <input type="radio" name="scheduleEmoji" readonly="readonly" value="" ${schedule.scheduleEmoji eq '' ? 'checked' : ''}> 이모티콘 없음
					</label>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="password"></td>
			</tr>
		</table>
		<button type="submit" class="btn btn-outline-danger btn-sm">삭제</button>
	</form>
	</div>
</body>
</html>