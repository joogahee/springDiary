<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈</title>
<!-- jQuery css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- jQuery CDN 주소 -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha384-o3MhHVfqyFmXH5bLZC0DBOI1Cg3cCjTwxeRUq2zXn5CZAA/PLldpGFFC2eLbMKCs" crossorigin="anonymous"></script>
<style>
    .backdiv {
        background-color: #f2f2f1; /* 배경 색상 설정 */
    }
    .backp {
        background-color: #e7e7e3; /* 배경 색상 설정 */
    }
    .paging {
        background-color:#112E27; 
        color: #fff; 
        padding: 8px 15px; 
        border-radius: 5px; 
        text-decoration: none; 
    }
     .backcalendar {
        background-color: #FFF8E6; /* 배경 색상 설정 */
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
        <div class="col-md-12 text-center text-white p-3 backp text-dark">
			<h3>
				&#128161; ${noticeMap.loginMember.memberId}님 환영합니다 &#127957;
			</h3>
		</div>
		<br>
		<div class="mx-4">
		<h2>&#128196; 공지사항</h2>
			<div>
				<p class="small"> &#128269; 공지를 자세히 보려면 제목을 클릭하세요</p>
			</div>
			<div class="text-right">
				<!-- login한 member의 level이 1일때만 공지 추가 가능  -->
				<c:if test="${noticeMap.loginMember.memberLevel ==1}">
					<a href="${pageContext.servletContext.contextPath}/notice/addNotice">공지추가(관리자)</a>
				</c:if>
			</div>
			<div>
				<table class="table table-hover">
					<colcolgroup>
						<col style="width: 20%;">
	                	<col style="width: 50%;">
	                	<col style="width: 30%;">
					</colcolgroup>
					<thead class="thead-dark">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody style="background-color:#f5f7f2">
						<c:forEach var="notice" items="${noticeMap.noticeList}">
							<tr>
								<td>
		    						${notice.noticeNo}
		    					</td>
		    					<td>
		    						<a class="text-dark" href="${pageContext.servletContext.contextPath}/notice/noticeOne?noticeNo=${notice.noticeNo}">
		    							${notice.noticeTitle}
		    						</a>
		    					</td>
		    					<td>
		    						${notice.createdate}
		    					</td>
		    				</tr>
						</c:forEach>
					<tbody>
				</table>
			</div>
		</div>
	<!-- 페이징 -->
	<div class="pagination justify-content-center">
		<a class="page-link paging" href="${pageContext.request.contextPath}/member/home?currentPage=1">처음</a>
		<c:forEach var="c" begin="1" end="${noticeMap.lastPage}">
			<a class="page-link paging" href="${pageContext.request.contextPath}/member/home?currentPage=${c}">${c}</a>
		</c:forEach>
		<a class="page-link paging" href="${pageContext.request.contextPath}/member/home?currentPage=${noticeMap.lastPage}">마지막</a>
    </div>
    <br>
    
    <!-- 검색 -->
    <div class="mx-4">
		<h4>&#9999; 일정 검색 하기
		<br>
		</h4>	
		<a class="text-dark" href="${pageContext.request.contextPath}/schedule/scheduleByDate?year=${year}&month=${month}&day=${day}">날짜로 검색하기 &#128284;</a>
		<a class="text-dark" href="${pageContext.request.contextPath}/schedule/scheduleByWord">단어로 검색하기 &#128284;</a>	
	</div>
	<br>
    <!-- 캘린더 -->
    <div class="container mt-4">
    	<div class="row justify-content-center">
    		<h2>
    			<a class="text-dark" href="${pageContext.servletContext.contextPath}/member/home?targetMonth=${calendarMap.targetMonth-1}&targetYear=${calendarMap.targetYear}">&#9664;</a>
    				${calendarMap.targetYear}년
    				${calendarMap.targetMonth+1}월 일정
    			<a class="text-dark" href="${pageContext.servletContext.contextPath}/member/home?targetMonth=${calendarMap.targetMonth+1}&targetYear=${calendarMap.targetYear}">&#9654;</a>
    		</h2>
    	</div>
    	<div>
    		<p class="small"> &#128269; 일정을 자세히 보려면 날짜를 클릭하세요</p>
    	</div>
    	<div class="row justify-content-center">
    		<table class="table table-bordered backcalendar">
    		<thead class="thead-dark">
    			<tr>
			        <th>일</th>
			        <th>월</th>
			        <th>화</th>
			        <th>수</th>
			        <th>목</th>
			        <th>금</th>
			        <th>토</th>
				</tr>
			</thead>
      			<tr>
         			<c:forEach var="i" begin="1" end="${calendarMap.totalTd}">
            			<c:set var="d" value="${i-calendarMap.beginBlank}"/>
            				<td>
               					<c:if test="${d < 1 || d> calendarMap.lastDate}">
                  					&nbsp;
               					</c:if>
               					<c:if test="${!(d < 1 || d > calendarMap.lastDate)}">
                    				<a class="font-weight-bold text-dark" href="${pageContext.servletContext.contextPath}/schedule/scheduleOne?year=${calendarMap.targetYear}&month=${calendarMap.targetMonth+1}&day=${d}">
                        				${d}
                    				</a>
                        			<c:forEach var="schedule" items="${list}">
                            			<c:if test="${schedule.scheduleDay == d}">
                                			<p class="small bg-secondary text-white p-2">${schedule.cnt}개의 일정</p>
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
	</div>
	<br>
	<br>
	<br>
	<br>
</div>
</body>
</html>