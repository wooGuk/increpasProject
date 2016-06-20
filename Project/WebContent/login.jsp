<!-- 
	/*
	제 목 : login.jsp
	역 할 : login 페이지
	로 그 : 1. 로그인 오류시에 이동하는 페이지 (정성훈 2016.06.20)
	*/
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

//로그인 체크(onload로 바로 실행)
function check() {
	/*
	 * flag == 1 아이디 오류
	 * flag == 2 비밀번호 오류
	 * flag == 3 로그인 후 사용
	*/
	var flag = document.getElementById("loginCheck").value;
	if(flag == "1"){
		alert("아이디가 존재 하지 않습니다.");
	}
	else if(flag == "2"){
		alert("비밀번호가 일치 하지 않습니다.");
	}
	else if(flag == "3"){
		alert("로그인 후 사용해주세요.");
	}
}
</script>
</head>
<body onload="check()">
	로그인 페이지 입니다.
	<input type="hidden" id="loginCheck" value="${flag }">
</body>
</html>