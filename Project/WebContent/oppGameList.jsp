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
	width: 120px;
}
</style>
<script type="text/javascript">
function info_send(index){
	document.forms[index].submit();
}
function check(alertMessage) {
	if(alertMessage != ""){
		alert(alertMessage);
	}
}

</script>
</head>
<body onload="check('${alert}')">
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
						<td height="20" bgcolor="#669AB3" width="56"><font color="#000"></font></td>
						<td height="20" bgcolor="#669AB3" width="56"><font color="#000">프로야구</font></td>
						<td height="20" bgcolor="#669AB3" width="56"><font color="#000">${game.match_code }</font></td>
						<td height="20" bgcolor="#669AB3" width="56"><font color="#000">${game.teamName(game.home_code) }:${game.teamName(game.away_code) }</font></td>
						<td height="20" bgcolor="#669AB3" width="56"><font color="#000">${game.match_year }년${game.match_month }월${game.match_day-1 } 자정</font></td>
						<td height="20" bgcolor="#669AB3" width="56"><a href="javascript:info_send('${stat.count}')"><font color="blue"> 게임구매</font></a></td>
					</tr>
						<form name="f" id="f" action="buyGame.inc" method="post">
							<input type="hidden" id="match_code" name="match_code"
								value="${game.match_code }" /> <input type="hidden"
								id="home_code" name="home_code" value="${game.home_code }" /> <input
								type="hidden" id="away_code" name="away_code"
								value="${game.away_code }" /> <input type="hidden" id="result"
								name="result" value="${game.result }" /> <input type="hidden"
								id="match_year" name="match_year" value="${game.match_year }" />
							<input type="hidden" id="match_month" name="match_month"
								value="${game.match_month }"> <input type="hidden"
								id="match_day" name="match_day" value="${game.match_day }" /> <input
								type="hidden" id="match_hour" name="match_hour"
								value="${game.match_hour }" />
							<input type="hidden" name="home_pitcher" value="${game.home_pitcher }"/>
							<input type="hidden" name="away_pitcher" value="${game.away_pitcher }"/>
						</form>
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