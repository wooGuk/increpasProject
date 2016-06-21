<!-- 
	/*
	제 목 : gameInfo.jsp
	역 할 : 게임정보 페이지
	로 그 : 1. 경기정보 페이지 (정성훈 2016.06.20)
			2. 팀순위보기 (정성훈 2016.06.20)
			3. 경기일정보기 (정성훈 2016.06.20)
	*/
 -->

<%@page import="mybatis.vo.MatchVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c"
 uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//로고 이미지 경로 저장
	//팀코드, 경로
Map<Integer, String> logo = new HashMap<Integer, String>();
logo.put(1, "img/team/emblem_OB.png");
logo.put(2, "img/team/emblem_NC.png");
logo.put(3, "img/team/emblem_WO.png");
logo.put(4, "img/team/emblem_LG.png");
logo.put(5, "img/team/emblem_SS.png");
logo.put(6, "img/team/emblem_LT.png");
logo.put(7, "img/team/emblem_SK.png");
logo.put(8, "img/team/emblem_HT.png");
logo.put(9, "img/team/emblem_HH.png");
logo.put(10, "img/team/emblem_KT.png");

	MatchVO[] games = (MatchVO[])request.getAttribute("games");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<!-- 상단영역시작 -->
		<jsp:include page="include/header.jsp"></jsp:include>
		<!-- 상단영역종료 -->
		
		<!-- 콘텐츠영역시작 -->
 		<div id="contents">
			<table class="fl" style="margin-right: 50px;">
				<thead>
					<tr>
						<td><span><a href="">경기정보</a></span></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><a href="viewMatch.inc">경기일정 ></a></td>
					</tr>
					<tr>
						<td><a href="viewRank.inc">팀 순위 ></a></td>
					</tr>
				</tbody>
			</table>
			<!-- 팀 순위보기 시작 -->
			<c:if test="${infoFlag =='viewRank' }">
				<table class="table-condensed">
					<thead>
						<tr>
							<th>순위</th>
							<th>팀명</th>
							<th>승</th>
							<th>패</th>
							<th>팀타율</th>
							<th>팀방어율</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="team" items="${teams }">
						<tr>
							<td>${team.rank }</td>
							<td>${team.name }</td>
							<td>${team.win }</td>
							<td>${team.lose }</td>
							<td>${team.team_avg }</td>
							<td>${team.team_era }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
			<!-- 팀 순위보기 종료 -->
			<!-- 경기일정보기 시작 -->
			<c:if test="${infoFlag =='viewMatch'}">
				<table class="table-condensed">
					<tbody>
						<!-- 반복문 돌면서 경기일정 출력 -->
						<%
							for(int i=0; i<games.length; i++){
						%>
								<tr>
									<td>
										<img alt="" src="<%=logo.get(games[i].getHome_code()) %>">
										<b><%=games[i].teamName(games[i].getHome_code()) %></b>
										<b>(선발투수:)</b>
									</td>
									<td>vs</td>
									<td>
										<img alt="" src="<%=logo.get(games[i].getAway_code()) %>">
										<b><%=games[i].teamName(games[i].getAway_code()) %></b>
										<b>(선발투수:)</b>
									</td>
								</tr>
						<%
							}//for()
						%>		
					</tbody>
				</table>
			</c:if>
			<!-- 경기일정보기 종료 -->
		</div>
		<!-- 콘텐츠영역종료 -->

		<!-- 하단영역시작 -->
		<jsp:include page="include/footer.jsp"></jsp:include>
		<!-- 하단영역종료 -->
	</div>
</body>
</html>