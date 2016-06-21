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
<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
<style type="text/css">
	#loginTable{
		margin: auto;
		margin-top: 150px;
	}
</style>
<script type="text/javascript">

//로그인 클릭시
function login() {
	var f = document.getElementById("loginForm");
	if (document.getElementById("id").value.trim() == "") {
		alert("아이디를 입력 하세요.");
		return;
	} else if (document.getElementById("password").value.trim() == "") {
		alert("비밀번호를 입력 하세요.");
		return;
	} else {
		f.action = "login.inc";
		f.method = "post";
		f.submit();
	}
}

</script>
</head>
<body>
	<form id="loginForm">
		<table class="table-condensed" id="loginTable">
			<tbody>
				<tr>
					<td><label for="id">ID:</label></td>
					<td><input type="text" id="id" name="id"></td>
					<td rowspan="2"><a href="javascript:login()"><img alt="로그인" src="img/login.png" title="로그인"></a></td>
				</tr>
				<tr>
					<td><label for="pwd">PASSWORD:</label></td>
					<td><input type="password" id="password" name="password"></td>
				</tr>
				<tr>
					<td colspan="3"><b style="color: red">아이디 또는 비밀번호를 다시 확인하세요.</b></td>
				</tr>
				<tr>
					<td><a href="goJoin.inc">회원가입</a></td>
					<td><a href="searchIdPwd.inc">아이디/비밀번호 찾기</a></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>