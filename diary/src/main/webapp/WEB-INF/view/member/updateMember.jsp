<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 비밀번호 변경</title>
<!-- jQuery css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- jQuery CDN 주소 -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha384-o3MhHVfqyFmXH5bLZC0DBOI1Cg3cCjTwxeRUq2zXn5CZAA/PLldpGFFC2eLbMKCs" crossorigin="anonymous"></script>
<style>
    .backdiv {
        background-color: #e7e7e3; /* 배경 색상 설정 */
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
        <br>
        <br>
        <br>
        		
        <!-- 비밀번호 변경 창 -->
        <div class="row justify-content-center">
            <div class="card p-4 border rounded col-md-4">
                <div class="col-md-12">
					<h2>&#128397;비밀번호 변경</h2>
					<form method="post" action="${pageContext.servletContext.contextPath}/member/updateMember">
                       <div class="mb-3 mt-3">
                            <label for="memberId" class="form-label">아이디</label>
                            <input type="text" class="form-control" id="memberId" style="width: 100%;" value="${updateMember.memberId}" readonly="readonly" name="memberId">
                        </div>
                        <div class="mb-3">
                            <label for="memberPw" class="form-label">비밀번호</label>
                            <input type="password" class="form-control" id="memberPw" style="width: 100%;" placeholder="비밀번호를 입력하세요." name="memberPw">
                        </div>
                        <div class="mb-3">
                            <label for="memberPw" class="form-label">변경할 비밀번호</label>
                            <input type="password" class="form-control" id="updateMemberPw" style="width: 100%;" placeholder="변경할 비밀번호를 입력하세요." name="updateMemberPw">
                        </div>
                        <div>
                            <button type="submit" class="btn btn-dark btn-block">변경</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>	
        <br>
        <br>
        <br>
        <br>
        <br>	
	</div>
</body>
</html>