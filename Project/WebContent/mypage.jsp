<%@page import="mybatis.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
	
	제 목 : mypage.jps
	역 할 : 마이페이지로 이동하는 역할
	로 그 : 프로그램 최초 생성 (장준수 2016/06/14)

 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/sub01.css" />
<title>Insert title here</title>

<style>
body {
	margin: 0;
	padding: 0;
}

div#h_menu {
	text-align: right;
	margin-top: 10px;
}

div#h_menu>ul {
	margin: 0;
	padding: 0;
	list-style: none;
	overflow: hidden;
	font: bold 20px sans-serif Impact;
}

div#h_menu>ul>li {
	display: inline;
	background: url("images/dash.gif") no-repeat right center;
	padding-right: 20px;
}

div#aa {
	display: inline-block;
	padding-right: 30px;
}

div#aa>li {
	display: block;
	padding-right: 20px;
}

div#aa a {
	display: inline-block;
	font-size: 12px;
	padding-right: 20px;
	text-decoration: none;
}


div#h_menu>ul>li>a {
	font-size: 12px;
	text-decoration: none;
}

div#aa input[type=text], div#aa input[type=password] {
	width: 100px;
	height: 25px;
}

#inBox {
	padding: 10px;
	width: 100%;
}

#inBox2 {
	width: 100%;
	text-align: center;
}



#aa input[type=submit] {
	display: inline-block;
	width: 70px;
	height: 30px;
	margin: 10px auto;
	font-size: 15px;
	font-weight: bold;
	border: 1px solid #dcdcdc;
}

#aa input[type=button] {
	display: inline;
	width: 70px;
	height: 30px;
	margin: 10px auto;
	font-size: 15px;
	font-weight: bold;
	border: 1px solid #dcdcdc;
}

input[type=button] {
	display: inline;
	width: 70px;
	height: 32px;
	margin: 10px auto;
	font-size: 15px;
	font-weight: bold;
	border: 1px solid #dcdcdc;
}

	div#mm{
		margin-left: 300px;
		margin-top: 30px;
	
	}
	
	div#mm form{
		font-size: 17px;
	}
	
	 div#mm label{
		font-size: 17px;
	} 
	
	div#mm input[type=text]{
		width: 100px;
		height: 25px;
	}
</style>
<script type="text/javascript">

	function main(){
		var id = document.f.id.value;
		var password = document.f.password.value;
		document.f.submit();
	}
	
	function charge(evt){
		
		var number = /[^0-9]/; //숫자만 허용
		
		var coin = document.c.coin.value;
		var usercoin = document.c.usercoin.value;
		var id = document.f.name.value;
		var name = document.f.name.value;
		var password = document.f.password.value;
		
		 if ( document.c.coin.value.search(number)!=-1 || document.c.coin.value.length == 0 ){
		        alert("해당항목은 필수항목이며, 숫자만 입력하실 수 있습니다!");
		        form.numberText.focus();
		        return;
		   }else{
		
		alert("충전완료!!");
		document.c.submit();
	   }
	}
</script>
</head>
<body>
	<c:if test="${vo != null }">
		
		<div id="wrap">
			<div id="header">
				<div id="h_menu">

					${vo.id }(${vo.name })님의 마이페이지
					 <input type="button" value="메인화면" onclick="main()" /> 
					 <input type="button" value="로그아웃" onclick="javascript:location.href='logout.inc'" />



				</div>
				<ul class="gnb">
					<li><a href=""><span class="menu m01">게임구매</span></a></li>
					<li><a href=""><span class="menu m02">경기정보</span></a></li>
					<li><a href=""><span class="menu m03">자유게시판</span></a></li>
					<li><a href=""><span class="menu m04">?</span></a></li>
					<li><a href=""><span class="menu m05">?</span></a></li>
				</ul>

			</div>
			<div id="mm">
			<form action="charge.inc" method="post" id="c" name="c">
				${vo.id }님의 코인 : <input type="text" id="usercoin" name="usercoin"
				 value="<c:out value="${vo.coin }"/>" readonly/>
				<label for="coin">코인 충전</label>
				<input type="text" id="coin" name="coin" value="0"/>
				<input type="button" value="충전" onclick="charge()"/>
				<input type="hidden" id="id1" name="id" value="<c:out value="${vo.id }"/>" />
				</form>
			</div>
		</div>

		<!-- 메인화면 클릭시 로그아웃(?)이 되므로 아이디값과 비밀번호를 보내 로그인상태를 유지하게 한다. -->
		<form name="f" action="login.inc" method="post">
			<input type="hidden" id="id" name="id" value="<c:out value="${vo.id }"/>" />
			<input type="hidden" id="password" name="password" value="<c:out value="${vo.password }"/>" />
			<input type="hidden" id="name" name="name" value="<c:out value="${vo.name }"/>" />
		</form>
		
		
		</c:if>
	
</body>
</html>

<c:if test="${vo == null }">
	<%
			response.sendRedirect("main.inc");
		%>
</c:if>
