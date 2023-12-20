<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 상세보기</title>
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
		<div class="mx-4">
		<h3 class="font-weight-bold p-2">&#128196; 공지사항</h3>
		<br>
	<table class="table table-bordered">
		<tr>
			<th class="bg-dark text-white">번호</th>
				<td class="bg-white">${noticeOne.noticeNo}</td>
		</tr>
		<tr>
			<th class="bg-dark text-white">제목</th>
				<td class="bg-white">${noticeOne.noticeTitle}</td>
		</tr>
		<tr>
			<th class="bg-dark text-white">내용</th>
				<td class="bg-white"><textarea rows="3" cols="100" name="noticeContent" readonly="readonly">${noticeOne.noticeContent}</textarea></td>
		</tr>
		<tr>
			<th class="bg-dark text-white">작성일</th>
				<td class="bg-white">${noticeOne.createdate}</td>
		</tr>
	</table>
	<div class="text-right">
		<!-- loginMember의 memberLevel이 1일 경우에만 수정,삭제 버튼 노출 -->
		<c:if test="${memberLevel == 1}">
			<a href="${pageContext.servletContext.contextPath}/notice/updateNotice?noticeNo=${noticeOne.noticeNo}">수정(관리자)</a>
			<a href="${pageContext.servletContext.contextPath}/notice/deleteNotice?noticeNo=${noticeOne.noticeNo}">삭제(관리자)</a>
		</c:if>
	</div>
	<!-- comment 출력 -->
	<h3 class="font-weight-bold p-2">&#128221; 댓글</h3>
	<br>
	<c:forEach var="comment" items="${commentList}">
		<table class="table table-bordered table-sm">
			<colcolgroup>
				<col style="width: 15%;">
	            <col style="width: 15%;">
	            <col style="width: 15%;">
	            <col style="width: 25%;">
	            <col style="width: 15%;">
	            <col style="width: 15%;">
			</colcolgroup>
			<tr>
				<th class="bg-secondary text-white">번호</th>
				<td>${comment.commentNo }</td>
				<th class="bg-secondary text-white">작성자</th>
				<td>${comment.memberId }</td>
				<th class="bg-secondary text-white">비밀글</th>
				<td>
					<c:if test="${comment.isSecret == 1 }">
					🔏
					</c:if>
				</td>
			</tr>
			<tr>
    			<th class="bg-secondary text-white">내용</th>
    				<c:choose>
        				<c:when test="${comment.isSecret == 0}">
            				<td colspan="5">
                				<textarea rows="3" cols="100" name="commentContent" readonly="readonly">${comment.commentContent}</textarea>
            				</td>
        				</c:when>
        				<c:when test="${comment.isSecret == 1 and (memberLevel == 1 or comment.memberId == loginMemberId)}">
            				<td colspan="5">
                				<textarea rows="3" cols="100" name="commentContent" readonly="readonly">${comment.commentContent}</textarea>
            				</td>
        				</c:when>
        					<c:otherwise>
            					<td colspan="5">
                					<textarea rows="3" cols="100" name="commentContent" readonly="readonly">비밀글입니다</textarea>
            					</td>
        					</c:otherwise>
    				</c:choose>
				</tr>
			<tr>
				<th class="bg-secondary text-white">작성일</th>
				<td colspan="5">${comment.createdate }</td>
			</tr>
				<c:if test="${comment.memberId == loginMemberId}">
			</c:if>
		</table>
		<div class="text-right">
			<a href="${pageContext.servletContext.contextPath}/comment/deleteComment?commentNo=${comment.commentNo}">&#11014; 삭제(관리자,작성자)</a>
			<a href="${pageContext.servletContext.contextPath}/comment/updateComment?commentNo=${comment.commentNo}">수정(관리자,작성자)</a> 
		</div>
	</c:forEach>
	<br>
	<!-- 댓글 작성 폼 -->
	<p>&#128221; 댓글을 작성해주세요.</p>
	<form method="post" action="${pageContext.servletContext.contextPath}/comment/insertComment">
	    <input type="hidden" class="form-control" id="noticeNo" name="noticeNo" value="${noticeOne.noticeNo}">
	    <div class="form-check">
	        <input type="checkbox" class="form-check-input" id="isSecret" name="isSecret" value="1">
	        <label class="form-check-label" for="isSecret"> &#128274; 비밀글</label>
	    </div>
	    <div class="form-group">
	        <label for="commentContent"></label>
	        <textarea class="form-control" rows="5" id="commentContent" name="commentContent"></textarea>
	    </div>
	    <button type="submit" class="btn btn-outline-dark btn-sm">등록</button>
	</form>
		</div>
	<br>
	<br>
	<br>
	<br>
	</div>
</body>
</html>