<!-- 

	/*
	제 목 : endGameList.jsp
	역 할 : 구매가능게임(당일) 목록 보여주는 화면
	로 그 : 1.최초 개발(레이아웃까지 잡음)(데이터테스트 필요함) (오우석 2016/06/12)
			2.왼쪽 탭 링크연결 (오우석 2016/06/13)
			3.파라미터 네임 오류로 인한 변경 list - > games (오우석 2016.06/13)
			4.팀코드로 표현하는 팀명 초기화 작업 오우석(2016.06.14)
			5.팀명출력 오우석(2016.06.15) 
	*/
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/basic.css">
<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript">
	function info_send(){
		document.getElementById("f").submit();
	}
</script>
<style type="text/css">
	.center_table tr td{
		text-align: center;
		border-bottom: 1px dashed gray;
	}
}
</style>
<title>Insert title here</title>
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
							<td></td>
							<td height="20" bgcolor="#669AB3" width="56"><font
								color="#00F">게임명</font></td>
							<td height="20" bgcolor="#669AB3" width="56"><font
								color="#00F">회차</font></td>
							<td height="20" bgcolor="#669AB3" width="56"><font
								color="#00F">대상경기</font></td>
							<td height="20" bgcolor="#669AB3" width="56"><font
								color="#00F">마김일자</font></td>
							<td height="20" bgcolor="#669AB3" width="56"><font
								color="#00F">게임정보보기</font></td>
						</tr>
					</thead>
					<tbody class="panel-bod">
						<!-- 여기를 반복문으로 돌려야 됨 -->
						<!-- 파라미터 네임 오류로 인한 변경 오우석(2016.06/13) -->
						<c:forEach var="game" items="${games }" varStatus="stat">
							<!-- 팀코드로 표현하는 팀명 초기화 작업 오우석(2016.06.14) -->
							<%-- <!-- if문 구문 오류로 인한 변경 오우석(2016.06.14) -->
						<c:if test="${game.home_code eq '1'}">
								<%=home="두산" %>
							</c:if>
							<c:if test="${game.home_code eq '2'}">
								<%=home="NC" %>
							</c:if>
							<c:if test="${game.home_code eq '3'}">
								<%=home="넥센" %>
							</c:if>
							<c:if test="${game.home_code eq '4'}">
								<%=home="LG" %>
							</c:if>
							<c:if test="${game.home_code eq '5'}">
								<%=home="삼성" %>
							</c:if>
							<c:if test="${game.home_code eq '6'}">
								<%=home="롯데" %>
							</c:if>
							<c:if test="${game.home_code eq '7'}">
								<%=home="SK" %>
							</c:if>
							<c:if test="${game.home_code eq '8'}">
								<%=home="기아" %>
							</c:if>
							<c:if test="${game.home_code eq '9'}">
								<%=home="한화" %>
							</c:if>
							<c:if test="${game.home_code eq '10'}">
								<%=home="KT" %>
							</c:if>
							<c:if test="${game.away_code eq '1'}">
								<%=away="두산" %>
							</c:if>
							<c:if test="${game.away_code eq '2'}">
								<%=away="NC" %>
							</c:if>
							<c:if test="${game.away_code eq '3'}">
								<%=away="넥센" %>
							</c:if>
							<c:if test="${game.away_code eq '4'}">
								<%=away="LG" %>
							</c:if>
							<c:if test="${game.away_code eq '5'}">
								<%=away="삼성" %>
							</c:if>
							<c:if test="${game.away_code eq '6'}">
								<%=away="롯데" %>
							</c:if>
							<c:if test="${game.away_code eq '7'}">
								<%=away="SK" %>
							</c:if>
							<c:if test="${game.away_code eq '8'}">
								<%=away="기아" %>
							</c:if>
							<c:if test="${game.away_code eq '9'}">
								<%=away="한화" %>
							</c:if>
							<c:if test="${game.away_code eq '10'}">
								<%=away="KT" %>
							</c:if> --%>

							<tr>
								<td height="20" align="center" bgcolor="#669AB3" width="56"><font
											color="#00F">프로야구</font></td>
								<td height="20" align="center" bgcolor="#669AB3" width="56"><font
											color="#00F">${game.match_code }</font></td>
								<!-- 팀명출력 오우석(2016.06.15) -->
								<td height="20" align="center" bgcolor="#669AB3" width="56"><font
											color="#00F">${game.teamName(game.home_code) }:
									${game.teamName(game.away_code) }</font></td>
								<td height="20" align="center" bgcolor="#669AB3" width="56"><font
											color="#00F">${game.match_month}-${game.match_day}</font></td>
								<td height="20" align="center" bgcolor="#669AB3" width="56"><font
											color="#00F">${game.match_month}-${game.match_day}</font></td>
								<td height="20" align="center" bgcolor="#669AB3" width="56"><a href="javascript:info_send()"><font
											color="#00F"> 상세보기</font></a></td>
							</tr>
						<form name="f" id="f" action="detailGame.inc" method="post">
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
						</form>
					</c:forEach>
						<!-- 파라미터 네임 오류로 인한 변경 오우석(2016.06/13) -->
						<c:if test="${empty games }">
							<tr>
								<td bgcolor="#F2F7F9" colspan="5" height="70" align="center">등록된
									게시물이 없습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
			<div>
				<table width="556" border="0" cellspacing="0" cellpadding="0" align="center">
					<tr>
						<td width="315" align="left">${pageCode }</td>
					</tr>
				</table>
			</div>
	</div>
	<div class="fclear"></div>



	<!-- Footer 영역 -->
	<%@include file="include/footer.jsp"%>

</body>
</html>