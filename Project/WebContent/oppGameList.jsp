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
<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
<style type="text/css">
table thead tr {
	border-bottom: 1px solid blue;
}

#center_info td {
	border: 1px solid green;
}

.center_table tr td {
	text-align: center;
	border-bottom: 1px dashed gray;
}
</style>
</head>
<body>
	<!-- Header 영역 -->
	<%@include file="include/header.jsp"%>
	<!-- 컨텐츠 영억 -->
	<div id="contents">
		<!-- 2.왼쪽 탭 링크연결 (오우석 2016/06/13) -->
		<%@include file="include/lefter.jsp"%>

		<div style="width: 100%">
			<table class="panel panel-default center_table" width="750px">
				<thead class="panel-heading">
					<tr>
						<td height="20" bgcolor="#669AB3" width="56"></td>
						<td height="20" bgcolor="#669AB3" width="56"><font color="#00F">게임명</font></td>
						<td height="20" bgcolor="#669AB3" width="56"><font color="#00F">회차</font></td>
						<td height="20" bgcolor="#669AB3" width="56"><font color="#00F">대상경기</font></td>
						<td height="20" bgcolor="#669AB3" width="56"><font color="#00F">마김일자</font></td>
						<td height="20" bgcolor="#669AB3" width="56"><font color="#00F">게임구매</font></td>
					</tr>
				</thead>
				<tbody class="panel-bod">
					<c:forEach var="game" items="${games }" varStatus="stat">
					<tr>
						<td height="20" bgcolor="#669AB3" width="56"><font color="#00F"></font></td>
						<td height="20" bgcolor="#669AB3" width="56"><font color="#00F">프로야구</font></td>
						<td height="20" bgcolor="#669AB3" width="56"><font color="#00F">${game.match_code }</font></td>
						<td height="20" bgcolor="#669AB3" width="56"><font color="#00F">${game.teamName(game.home_code) }:${game.teamName(game.away_code) }</font></td>
						<td height="20" bgcolor="#669AB3" width="56"><font color="#00F">${game.match_year }년${game.match_month }월${game.match_day } 자정</font></td>
						<td height="20" bgcolor="#669AB3" width="56"><font color="#00F"><a href=""> 게임구매</a></font></td>
					</tr>
					</c:forEach>
					<c:if test="${empty games }">
							<tr>
								<td bgcolor="#F2F7F9" colspan="6" height="70" align="center">등록된게시물이 없습니다.</td>
							</tr>
						</c:if>
				</tbody>
			</table>
		</div>
	</div>
		<div class="fclear"></div>
	<!-- Footer 영역 -->
	<%@include file="include/footer.jsp"%>
</body>
</html>