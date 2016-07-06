<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 
	
	제 목 : freeBoard.jsp
	역 할 : 자유게시판
	로 그 : 1.프로그램 최초 생성 (장준수 2016/06/21)
		  
		  

 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/basic.css">  
<link type="text/css" rel="stylesheet" href="css/text.css"> 
<link type="text/css" rel="stylesheet" href="css/bootstrap.css">   
</head>
<body>
	<div id="wrap">
		<jsp:include page="include/header.jsp"></jsp:include>
		<jsp:include page="include/list.jsp"></jsp:include>
		
	</div>	 
		
	<div class="fclear"></div>
	<!-- Footer 영역 -->
	<%@include file="include/footer.jsp"%>
</body>
</html>
