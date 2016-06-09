<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/basic.css">
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
	<!-- Header 영역 -->
	<%@include file="include/header.jsp"%>
	<!-- 컨텐츠 영억 -->
	<div id="contents">
		<div class="fl">
			<div class="left_side">
				<table id="left_info">
					<thead>
						<tr>
							<td><span>게임구매</span></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><a href="">구매가능 게임 ></a></td>
						</tr>
						<tr>
							<td><a href="">마감게임 보기 ></a></td>
						</tr>
						<tr>
							<td><a href="">게임일정 ></a></td>
						</tr>
						<tr>
							<td><a href="">게임결과 ></a></td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="center_side">
				<p><img alt="" src=""></p>
				<table id="center_info">
					<thead>
						<tr>
							<td></td>
							<td>게임명</td>
							<td>회차</td>
							<td>대상경기</td>
							<td>마김일자</td>
							<td>게임구매</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<td>게임명</td>
							<td>회차</td>
							<td>대상경기</td>
							<td>개임구매</td>
							<td><a href=""> 게임구매</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- Footer 영역 -->
	<%@include file="include/footer.jsp"%>
</body>
</html>