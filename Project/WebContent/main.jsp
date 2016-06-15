<!-- 
	/*
	제 목 : main.jsp
	역 할 : main 페이지
	로 그 : 1. flag를 통해 정상로그인을 체크 (정성훈 2016/06/15)
	*/
 -->

<%@page import="mybatis.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"
 uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/basic.css">
<script type="text/javascript">

//로그인 체크(onload로 바로 실행)
function check() {
	/*
	 * flag == 1 아이디 오류
	 * flag == 2 비밀번호 오류
	 * flag == 3 정상로그인
	*/
	var flag = document.getElementById("loginCheck").value;
	if(flag == "1"){
		alert("아이디가 존재 하지 않습니다.");
	}
	else if(flag == "2"){
		alert("비밀번호가 일치 하지 않습니다.")
	}
}
</script>
</head>
<body onload="check()">
	<div id="wrap">
		<!-- 상단영역시작 -->
		<jsp:include page="include/header.jsp"></jsp:include>
		<!-- 상단영역종료 -->
		
		<!-- 콘텐츠영역시작 -->
 		<div id="contents">
 		콘
 		텐
 		츠
 		영
 		역
		</div>
		<!-- 콘텐츠영역종료 -->

		<!-- 하단영역시작 -->
		<jsp:include page="include/footer.jsp"></jsp:include>
		<!-- 하단영역종료 -->
	</div>
	
	<!-- 로그인을 체크 할 flag 숨김 -->
	<input type="hidden" id=loginCheck value="${flag }">
</body>
</html>