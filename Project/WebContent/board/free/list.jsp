<!-- 
	/*
	제 목 : list.jsp
	역 할 : 자유게시판 페이지
	로 그 : 1. 자유게시판 페이지 (정성훈 2016.06.20)
	*/
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="./css/basic.css">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
			<!-- 상단영역시작 -->
			<jsp:include page="/include/header.jsp"></jsp:include>
			<!-- 상단영역종료 -->
			
			<!-- 콘텐츠영역시작 -->
			<div id="contents">
			자유게시판
			</div>
			<!-- 콘텐츠영역종료 -->
	
			<!-- 하단영역시작 -->
			<jsp:include page="/include/footer.jsp"></jsp:include>
			<!-- 하단영역종료 -->
	</div>
</body>
</html>