<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단어별 일정조회</title>
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
	<h2>🔍 단어별 일정조회</h2>
	<div>
		<form action="${pageContext.servletContext.contextPath}/schedule/word" method="get">
		    <div class="form-group">
		        <label for="word" class="mr-2">&#9999; 검색어를 입력하세요.</label>
		        <input type="text" class="form-control mr-2" id="word" name="word">
		    </div>
		    <button type="submit" class="btn btn-outline-success btn-sm">검색</button>
		</form>
		<br>
		<form action="${pageContext.servletContext.contextPath}/schedule/word" method="get">
			<input type="hidden" name="word" value=""> 
			<button type="submit" class="btn btn-outline-success btn-sm">전체보기</button>
		</form>
	</div>
	<br>
	<div>
		<table class="table table-bordered table-sm">
			<thead class="thead-dark">
				<tr>
					<th>번호</th>
					<th>일정</th>
					<th>날짜</th>
					<th>이모티콘</th>
				</tr>
			</thead>
			<tbody style="background-color:#f5f7f2">
				<c:forEach var="s" items="${list}">
					<tr>
						<td>${s.scheduleNo }</td>
						<td>${s.scheduleMemo }</td>
						<td>${s.scheduleDate }</td>
						<td>${s.scheduleEmoji }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 페이징 -->
		<div class="pagination justify-content-center">
			<a class="page-link paging" href="${pageContext.request.contextPath}/schedule/word?currentPage=1&word=${word}">처음</a>
				<c:forEach var="c" begin="1" end="${lastPage}">
	    			<a class="page-link paging" href="${pageContext.request.contextPath}/schedule/word?currentPage=${c}&word=${word}">${c}</a>
				</c:forEach>
			<a class="page-link paging" href="${pageContext.request.contextPath}/schedule/word?currentPage=${lastPage}&word=${word}">마지막</a>
	    </div>
	    <br>
	    <br>
	    <br>
    	</div>
    </div>
</body>
</html>