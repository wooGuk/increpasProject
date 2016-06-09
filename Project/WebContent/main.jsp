<%@page import="mybatis.vo.TestVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
 uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	body{
		margin:0;
		padding:0;
	}
	
	div#h_menu{
		text-align: right;
		margin-top: 10px;
	}
	
	div#h_menu>ul{
		margin:0;
		padding:0;
		list-style: none;
		overflow: hidden;
		font: bold 20px sans-serif Impact;
	}
	
	div#h_menu>ul>li{
	  display: inline;
	  background: url("images/dash.gif") 
	  	no-repeat right center;
	  padding-right: 20px;
	}
	
	div#aa{
	  display: inline-block;
	  padding-right: 30px;
	}
	
	div#aa>li{
	  display: block;
	  padding-right: 20px;
	}
	
	div#aa a{
	  display: inline-block;
	  font-size: 12px;
	  padding-right: 20px;
	  text-decoration: none;
	}
	
	div#h_menu>ul>li>a{
		font-size: 12px;
		text-decoration: none;
	}
	
	div#aa input[type=text],div#aa input[type=password]{
		width: 100px;
		height: 25px;
	}
	
	div#bar{
		height: 10px;
		background-color: #fff;
		margin-top: 10px;
	}
	
	#inBox{
		padding: 10px;
		width: 100%;
	}
	
	#inBox2{
		width: 100%;
		text-align: center;
	}
	
	#aa input[type=submit]{
		display: inline-block;
		width: 70px;
		height: 30px;
		margin: 10px auto;
		font-size: 15px;
		font-weight: bold;
		border: 1px solid #dcdcdc;
	}
	
	#aa input[type=button]{
		display: inline;
		width: 70px;
		height: 30px;
		margin: 10px auto;
		font-size: 15px;
		font-weight: bold;
		border: 1px solid #dcdcdc;
	}
	
	input[type=button]{
		display: inline;
		width: 70px;
		height: 32px;
		margin: 10px auto;
		font-size: 15px;
		font-weight: bold;
		border: 1px solid #dcdcdc;
	}
	
</style>
</head>
<body>
	<div id="header">
		<div id="h_menu">
			
			<!-- 로그인X -->
			<c:if test="${vo == null }">
				<div id="aa">
					<form action="login.inc" method="post">
					<input type="text" id="s_id" name="s_id" placeholder="아이디" />
					<input type="password" id="s_pwd" name="s_pwd" placeholder="비밀번호" />
					<input type="submit" value="LOGIN"/>
				    <input type="button" value="회원가입" onclick="javascript:location.href='reg.inc'"/>
					</form>		
				</div>
			</c:if>
			
			<!-- 로그인 -->
			<c:if test="${vo != null }">	
				${vo.s_name }(${vo.s_id })님 환영합니다.
					<input type="button" value="MyPage" onclick=""/>
					<input type="button" value="로그아웃" onclick=""/>
			</c:if>	
			
		</div>
	</div>
	
	<div id="bar">
	
	</div>
</body>
</html>


