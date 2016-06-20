<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 

	/*
	제 목 : oppGameList.jsp
	역 할 : 구매가능게임(당일) 목록 보여주는 화면
	로 그 : 1.최초 개발(레이아웃까지 잡음) (오우석 2016/06/09)
			2.왼쪽 탭 링크연결 (오우석 2016/06/13)
	*/
 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/basic.css">
<style type="text/css">
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
		<!-- 2.왼쪽 탭 링크연결 (오우석 2016/06/13) -->
			<%@include file="include/lefter.jsp" %>

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