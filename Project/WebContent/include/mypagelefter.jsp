<!--
		
	제 목 : mypagelefter.jsp
	역 할 : 회원관리
	로 그 : 1.프로그램 최초 생성(장준수 2016/06/16)
	 
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/basic.css">
<title>Insert title here</title>
<style type="text/css">
div .left_side{
	
	display:inline-block;
	border: 1px solid black;
}
div .center_side{
	
	display:inline-block;
	border: 1px solid red;
}

table thead tr{
	border-bottom: 1px solid blue;  
}

#center_info td{
	border: 1px solid green; 
}
</style>
</head>
<body>
	<div class="left_side">
	<table id="left_info">
		<thead>
			<tr>
				<td><span>회원관리</span></td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><a href="memedit.inc">회원수정</a></td>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>