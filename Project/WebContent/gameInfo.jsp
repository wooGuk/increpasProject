<!-- 
	/*
	제 목 : gameInfo.jsp
	역 할 : 게임정보 페이지
	로 그 : 1. 경기정보 페이지 (정성훈 2016.06.20)
			2. 팀순위보기 (정성훈 2016.06.20)
			3. 경기일정보기 (정성훈 2016.06.20)
			4. 어제,오늘,내일경기보기 (정성훈 2016.06.21)
			5. 선발투수, 장소 추가 (정성훈 2016.06.21)
	*/
 -->

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
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

Calendar cal = Calendar.getInstance();

cal.add(Calendar.DATE,-1);
int preYear=cal.get(Calendar.YEAR);
int preMonth=cal.get(Calendar.MONTH)+1;
int preDay=cal.get(Calendar.DAY_OF_MONTH);

cal.add(Calendar.DATE,1);
int nowYear=cal.get(Calendar.YEAR);
int nowMonth=cal.get(Calendar.MONTH)+1;
int nowDay=cal.get(Calendar.DAY_OF_MONTH);

cal.add(Calendar.DATE,1);
int nextYear=cal.get(Calendar.YEAR);
int nextMonth=cal.get(Calendar.MONTH)+1;
int nextDay=cal.get(Calendar.DAY_OF_MONTH);


String yesterday = String.format("%d/%d/%d", preYear, preMonth, preDay);
String today = String.format("%d/%d/%d", nowYear, nowMonth, nowDay);
String tomorrow = String.format("%d/%d/%d", nextYear, nextMonth, nextDay);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
<style type="text/css">
	.info{
		width: 70%;
	}
	.info th, .info td{
		text-align: center;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<!-- 상단영역시작 -->
		<jsp:include page="include/header.jsp"></jsp:include>
		<!-- 상단영역종료 -->
		
		<!-- 콘텐츠영역시작 -->
 		<div id="contents">
			<div class="fl" style="margin-right: 50px">
				<table class="panel panel-primary" id="list-group">
					<thead class="panel-heading">
						<tr>
							<td class="list-group-item"><span>경기정보</span></td>
						</tr>
					</thead>
					<tbody class="panel-primary">
						<tr>
							<td class="list-group-item"><a href="viewMatch.inc?day=today">경기일정 ></a></td>
						</tr>
						<tr>
							<td class="list-group-item"><a href="viewRank.inc">팀 순위 ></a></td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 팀 순위보기 시작 -->
			<c:if test="${infoFlag =='viewRank' }">
				<table class="table-condensed info">
					<thead>
						<tr style="border: 1px solid black;">
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
				<table class="table-condensed info">
					<thead>
						<tr>
							<th>
								<a href="viewMatch.inc?day=yesterday">어제경기</a><br>
								<span><%=yesterday %></span>
							</th>
							<th colspan="3">
								<a href="viewMatch.inc?day=today">오늘경기</a><br>
								<span><%=today %></span>
							</th>
							<th>
								<a href="viewMatch.inc?day=tomorrow">내일경기</a><br>
								<span><%=tomorrow%></span>
							</th>
						</tr>
						<tr>
							<th>HOME</th>
							<th>SCORE</th>
							<th>장소</th>
							<th>SCORE</th>
							<th>AWAY</th>
						</tr>
					</thead>
					<tbody>
						<!-- 반복문 돌면서 경기일정 출력 -->
						<%
							for(int i=0; i<games.length; i++){
						%>
								<tr>
									<td>
										<img alt="" src="<%=logo.get(games[i].getHome_code()) %>"><br>
										<b><%=games[i].teamName(games[i].getHome_code()) %></b><br>
										<b>(선발투수:<%=games[i].getHome_pitcher() %>)</b>
									</td>
									<td>
										<b><%=games[i].getHome_score() %></b>
									</td>
									<td>
										<b>vs</b><br>
										<b>(<%=games[i].homeName(games[i].getHome_code()) %>)</b>
									</td>
									<td>
										<b><%=games[i].getAway_score() %></b>
									</td>
									<td>
										<img alt="" src="<%=logo.get(games[i].getAway_code()) %>"><br>
										<b><%=games[i].teamName(games[i].getAway_code()) %></b><br>
										<b>(선발투수:<%=games[i].getAway_pitcher() %>)</b>
									</td>
								</tr>
						<%
							}//for()
						%>		
					</tbody>
				</table>
			</c:if>
			<!-- 경기일정보기 종료 -->
			<div class="fclear"></div>
		</div>
		<!-- 콘텐츠영역종료 -->

		<!-- 하단영역시작 -->
		<jsp:include page="include/footer.jsp"></jsp:include>
		<!-- 하단영역종료 -->
	</div>
</body>
</html>