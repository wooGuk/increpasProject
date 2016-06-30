<%@page import="mybatis.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	MemberVO vo = (MemberVO)session.getAttribute("vo");
%>
<!-- 
	
	제 목 : mypage.jps
	역 할 : 마이페이지로 이동하는 역할
	로 그 : 1.프로그램 최초 생성 (장준수 2016/06/14)
	
		  2. include로 할수 있게 수정

 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/basic.css" />
<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
<script type="text/javascript">

/* 	function check(){
			location.href="mypage.inc";
	}
 */
</script>
</head>
<body >
	<div id="wrap">
		<!-- 상단영역시작 -->
		<jsp:include page="include/mypageheader.jsp"></jsp:include>
		<!-- 상단영역종료 -->
		 <!-- <div id="contents"> -->
	 	<%-- <%@include file="include/mypagelefter.jsp"%> --%>
		

		 <!-- </div>  -->
	</div>
		<!-- 하단영역시작 -->
		<jsp:include page="include/footer.jsp"></jsp:include>
		<!-- 하단영역종료 -->
</body>
</html>
