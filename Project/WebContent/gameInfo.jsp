<!-- 
	/*
	제 목 : gameInfo.jsp
	역 할 : 게임정보 페이지
	로 그 : 1. 경기정보 페이지 (정성훈 2016.06.20)
			2. 팀순위보기 (정성훈 2016.06.20)
			3. 경기일정보기 (정성훈 2016.06.20)
			4. 어제,오늘,내일경기보기 (정성훈 2016.06.21)
			5. 선발투수, 장소 추가 (정성훈 2016.06.21)
			6. 날짜 선택 추가(정성훈 2016.06.22)
	*/
 -->

<%@page import="java.util.GregorianCalendar"%>
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

//ModelAndView에 담은 파라미터 받기
MatchVO[] games = (MatchVO[])request.getAttribute("games"); // 경기정보
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
<style type="text/css">
	table th{
		text-align: center;
		border: 1px solid black;
		background-color: #000;
		color: #fff;
	}
	#selectDate, #rank, #match{
		margin: auto;
	}
	#rank, #match{
		width: 70%;
		border: 1px solid black;
	}
	#match td, #rank td, #selectDate td, #match pre{
		text-align: center;
	}
	#match td, #rank td{
		border: 1px solid black;
	}
	.score{
		font-size: 20px;
	}
	.win{
		color: #00f;
		font-weight: bold;
	}
	.draw{
		color: #0f0;
		font-weight: bold;
	}
	.lose, .cancel{
		color: #f00;
		font-weight: bold;
	}
</style>
<script type="text/javascript">
	function sendDate(){
		//날짜 선택을 해주는 form을 찾아서
		var f = document.getElementById("selectDateForm");
		//전송
		f.submit();
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<!-- 상단영역시작 -->
		<jsp:include page="include/header.jsp"></jsp:include>
		<!-- 상단영역종료 -->
		
		<!-- 콘텐츠영역시작 -->
 		<div id="contents">
 			<!-- 좌측메뉴 시작 -->
			<div id="leftMenu" class="fl">
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
			<!-- 좌측메뉴 종료 -->

			<!-- 가운데 정보 영역 시작 -->
			<div id="centerInfo">
				<!-- 팀 순위보기 시작 -->
				<c:if test="${infoFlag =='viewRank' }">
					<table id="rank" class="table-condensed">
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
					<!-- 날짜선택 table 시작 -->
					<form action="viewSelectDateMatch.inc" method="post"
						id="selectDateForm">
						<table id="selectDate" class="table-condensed">
							<tbody>
								<tr>
									<td>
										<a href="viewSelectDateMatch.inc?yyyy=${yyyy }&mm=${mm }&dd=${dd }&day=pre">
											<img alt="" src="img/prevDay.png">
										</a>
									</td>
									<td>
										<!-- 년 --> <select name="yyyy" onchange="sendDate()">
										<c:forEach var="i" begin="2014" end="2016">
											<c:if test="${i == yyyy }">
												<option value="${i }" selected="selected">${i }</option>
											</c:if>
											<c:if test="${i != yyyy }">
												<option value="${i }">${i }</option>
											</c:if>
										</c:forEach>
									</select> <span>년</span>
									</td>
									<td>
										<!-- 월 --> <select name="mm" onchange="sendDate()">
										<c:forEach var="i" begin="1" end="12">
											<c:if test="${i == mm }">
												<option value="${i }" selected="selected">${i }</option>
											</c:if>
											<c:if test="${i != mm }">
												<option value="${i }">${i }</option>
											</c:if>
										</c:forEach>
									</select> <span>월</span>
									</td>
									<td>
										<!-- 일 --> <select name="dd" onchange="sendDate()">
										<c:forEach var="i" begin="1" end="${countDay }">
											<c:if test="${i == dd }">
												<option value="${i }" selected="selected">${i }</option>
											</c:if>
											<c:if test="${i != dd }">
												<option value="${i }">${i }</option>
											</c:if>
										</c:forEach>
									</select> <span>일</span>
									</td>
									<td>${day }요일</td>
									<td>
										<a href="viewSelectDateMatch.inc?yyyy=${yyyy }&mm=${mm }&dd=${dd }&day=next">
											<img alt="" src="img/nextDay.png">
										</a>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<!-- 날짜선택 table 종료 -->
					<!-- 경기정보 table 시작 -->
					<table id="match" class="table-condensed">
						<c:if test="${games==null }">
							<tr>
								<td style="height: 200px; font-size: 40px; color: #f00">경기정보가 DB에 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${games!=null }">
							<thead>
								<tr>
									<th>HOME</th>
									<th style="width: 50px;">SCORE</th>
									<th>장소</th>
									<th style="width: 50px;">SCORE</th>
									<th>AWAY</th>
								</tr>
							</thead>
							<tbody>
								<!-- 반복문 돌면서 경기일정 출력 -->
								<%
									for (int i = 0; i < games.length; i++) {
								%>
								<tr>
									<td><img alt=""
										src="<%=logo.get(games[i].getHome_code())%>"><br> <b><%=games[i].teamName(games[i].getHome_code())%></b><br>
										<b>(선발투수:<%=games[i].getHome_pitcher()%>)
									</b></td>
									<td>
										<b class="score"><%=games[i].getHome_score()%></b>
										<c:if test="<%=games[i].getHome_code()==games[i].getResult() %>">
											<pre class="win">(승)</pre>
										</c:if>
										<c:if test="<%=games[i].getResult()==11 %>">
											<pre class="draw">(무)</pre>
										</c:if>
										<c:if test="<%=games[i].getAway_code()==games[i].getResult() %>">
											<pre class="lose">(패)</pre>
										</c:if>
									</td>
									<td>
										<b>vs</b><br> 
										<b>(<%=games[i].homeName(games[i].getHome_code())%>)</b><br>
										<c:if test="<%=games[i].getResult()==99 %>">
											<pre class="cancel">경기취소</pre>
										</c:if>
									</td>
									<td>
										<b class="score"><%=games[i].getAway_score()%></b>
										<c:if test="<%=games[i].getAway_code()==games[i].getResult() %>">
											<pre class="win">(승)</pre>
										</c:if>
										<c:if test="<%=games[i].getResult()==11 %>">
											<pre class="draw">(무)</pre>
										</c:if>
										<c:if test="<%=games[i].getHome_code()==games[i].getResult() %>">
											<pre class="lose">(패)</pre>
										</c:if>
									</td>
									<td><img alt=""
										src="<%=logo.get(games[i].getAway_code())%>"><br> <b><%=games[i].teamName(games[i].getAway_code())%></b><br>
										<b>(선발투수:<%=games[i].getAway_pitcher()%>)
									</b></td>
								</tr>
								<%
									} //for()
								%>
							</tbody>
						</c:if>
					</table>
					<!-- 경기정보 table 종료 -->
				</c:if>
				<!-- 경기일정보기 종료 -->
			</div>
			<!-- 가운데 정보 영역 종료 -->
			<div class="fclear"></div>
		</div>
		<!-- 콘텐츠영역종료 -->

		<!-- 하단영역시작 -->
		<jsp:include page="include/footer.jsp"></jsp:include>
		<!-- 하단영역종료 -->
	</div>
</body>
</html>