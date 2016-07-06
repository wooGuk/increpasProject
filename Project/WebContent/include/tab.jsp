<!--
		/*
	제 목 : tab.jsp
	역 할 : 상세보기 탬 
	로 그 : 1.프로그램 최초 생성(오우석 2016/06/16)
	        2.광고추가, 알림창 추가, 정보 수정(오우석 2016/06/20)
	        3.게임구매방법tab 완료(오우석 2016/06/21)
	        4.나머지tab 채워넣음(gamebuy.jsp와 동일)(오우석 2016/06/29)
	*/ 
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#basic_info {
	border: 1px double gray;
	padding: 5px;
}

#ad {
	border: 1px double gray;
}

#basic_info p{
	padding: 5px 8px;
}
#tab2 div {
	margin: 20px;
}

.center_table tr td {
	text-align: center;
	border-bottom: 1px dashed gray;
}
.title{
	font-size: 20px;
	font: bold;
	color: blue; 
}
#info_text ul {
	margin-left: 10px;
}
#info_text ul li{
	margin: 10px;
}
.sub_title{
	font-size: 15px;
	font: bold;
	color: highlighttext; 
}
.possible{
	color: blue;
}
.impossible{
	color: red;
}
#team_intro tbody tr{
	border-bottom: 0.5px dotted gray;
}
.center_side{
	width: 100%;
}
#teamplayer:HOVER{
	text-decoration: underline;
	color: blue;
}
</style>
<div class="center_side">
	<ul class="nav nav-tabs nav-justified">
		<li id="ta1" role="presentation"><a href="javascript:trans(1)">게임구매방법</a></li>
		<li id="ta2" role="presentation" class="active"><a
			href="javascript:trans(2)">게임정보</a></li>
		<li id="ta3" role="presentation"><a href="javascript:trans(3)">맞대결전적</a></li>
		<li id="ta4" role="presentation"><a href="javascript:trans(4)">팀정보</a></li>
	</ul>
</div>
<div class="fclear"></div>
<div class="tab_cont" id="tab1">
<!-- 게임구매방법tab 완료(오우석 2016/06/21) -->
	<div id="buy_info" style="border: none;">
		<img alt="" src="img/info.jpg" width="100%" />
	</div>
	<div id="info_text">
		<div id="information">
			<h3 class="title">01 프로야구 승무패란?</h3>
			<ul>
				<li><h5 class="sub_title">1.게임방법</h5></li>
				<li><span> 국내 프로야구 하루 5경기를 대상으로 홈팀의 승/무/패를 맞히는 게임입니다.<br />
						연장전도 포함됩니다.<br /></span></li>
				<li><p>※ 승 : 홈팀 승 / 무: 무승부 / 패 : 홈팀 패</p></li>
				<br />
				<li><h5 class="sub_title">
						2.최소구매가능금액은 <font color="orange">1000</font>원 입니다.
					</h5></li>
			</ul>
			<br />
			<h3 class="title">02 경기정보 활용법</h3>
			<ul>
				<li><h1 class="sub_title" style="text-align: center;">
						Many Information 구매 시 필요한 다앙한 정보를 제공합니다.<br />
					</h1>
				<li><img alt="" src="img/match_info.jpg" width="100%" /></li>
			</ul>
			<h3 class="title">03 구매하기</h3>
			<ul>
				<li><img alt="" src="img/buy_info.jpg" width="100%" /></li>
				<li class="sub_title"><span> <font color="red">홈팀
							기준입니다.</font><br /></span></li>
				<li><p>※ 승 : 홈팀 승 / 무: 무승부 / 패 : 홈팀 패</p></li>
				<li>최소 1000원이상 구매하셔야 합니다.</li>
			</ul>
		</div>
	</div>
</div>
<div class="tab_cont show" id="tab2">
	<div id="ad">
		<p>
			<a href="http://www.betman.co.kr/betCoachMain.so"><img alt=""
				src="img/ad.jpg" width="100%" height="100px"></a>
		</p>
	</div>
	<div id="basic_info">
		<p>발매기간 ${game.match_year}년 ${game.match_month}월 ${game.match_day}
			하루 전까지 발매</p>
		<p>발 표 일 경기개최 당일 적중결과 발표</p>
		<p>환급기간 선택한 모든 대상경기의 발표일 익일부터 1년간</p>
	</div>
	<div style="padding-top: 20px">
		<table class="panel panel-default center_table" style="width: 100%">
			<thead class="panel-heading">
				<tr>
					<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="#00F">경 기</font></td>
					<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="#00F">경기시간 ▼<br/>경기장소</font></td>
					<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="#00F">홈 vs 원정</font></td>
					<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="#00F">결 과</font></td>
					<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="#00F">상 금</font></td>
				</tr>
			</thead>
			<tbody class="panel-bod">
				<tr>
					<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="#000">${game.match_code }</font></td>
					<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="#000">${game.match_year }-${game.match_month }-${game.match_day }<br/>${game.homeName(game.home_code) }구장</font></td>
					<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="#000">${game.teamName(game.home_code) } vs ${game.teamName(game.away_code) }</font></td>
					<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="red">${game.teamName(game.result) } 승리</font></td>
					<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="blue">배팅금액 2배</font></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="tab_cont" id="tab3">
	<div class="vs_info" style="padding-top: 20px">
				<h3>홈 기준 상대전적입니다.</h3>
				<h4>양팀 상대 전적: ${total }전 ${win }승 ${lose }패</h4>
				<table class="panel panel-default center_table" style="width: 100%">
					<thead class="panel-heading">
						<tr style="font: blue; text-align: center; font: bold 15px;">
							<td height="20" bgcolor="#669AB3" width="56"><font
								color="#00F">회자</font></td>
							<td height="20" bgcolor="#669AB3" width="56"><font
								color="#00F">경기일자</font></td>
							<td height="20" bgcolor="#669AB3" width="56"><font
								color="#00F">대상경기</font></td>
							<td height="20" bgcolor="#669AB3" width="56"><font
								color="#00F">스코어</font></td>
							<td height="20" bgcolor="#669AB3" width="56"><font
								color="#00F">결과</font></td>
						</tr>
					</thead>
					<tbody class="panel-bod">
						<c:forEach var="vsgame" items="${vsGame }" varStatus="stat">
							<tr>
								<td height="20" bgcolor="#669AB3" width="56"><font
									color="#000">${vsgame.match_code }</font></td>
								<td height="20" bgcolor="#669AB3" width="56"><font
									color="#000">${vsgame.match_year }년${vsgame.match_month }월${vsgame.match_day }</font></td>
								<td height="20" bgcolor="#669AB3" width="56"><font
									color="#000">${vsgame.teamName(vsgame.home_code) }:${vsgame.teamName(vsgame.away_code) }</font></td>
								<td height="20" bgcolor="#669AB3" width="56"><font
									color="#000">${vsgame.home_score } :${vsgame.away_score }</font></td>
								<td height="20" bgcolor="#669AB3" width="56"><font
									color="red">${vsgame.teamName(vsgame.result) } 승</font></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
</div>
<div class="tab_cont" id="tab4">
	<div id="team_main">
				<p style="font: bold 15px; color: blue;">●팀 정보</p>
				<table id="team_intro" class="panel panel-default center_table"
					style="width: 100%; margin-top: 10px">
					<thead class="panel-heading">
						<tr>
							<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#00F">${game.teamName(game.home_code) }</font></td>
							<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#00F">${game.teamName(game.away_code) }</font></td>
						</tr>
					</thead>
					<tbody class="panel-bod">
						<tr>
							<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#000">홈구장 : ${game.homeName(game.home_code) }</font></td>
							<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#000">홈구장 : ${game.homeName(game.away_code) }</font></td>
						</tr>
						<tr>
							<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#000">순 위 : ${homeTeam.rank } 위</font></td>
							<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#000">순 위 : ${awayTeam.rank } 위</font></td>
						</tr>
						<tr>
							<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#000">(${homeTeam.win }승 ${homeTeam.lose }패)</font></td>
							<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#000">(${awayTeam.win }승 ${awayTeam.lose }패)</font></td>
						</tr>
						<tr>
							<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="#000">
							투수 :
								<c:forEach var="home" items="${homeTeam.team_info }" varStatus="stat">
								<c:if test="${home.POSITION=='투수' }">
									<a id="teamplayer" href=""> ${home.NAME }</a>
 									<c:if test="${stat.count%3==0 }">
										<br />
									</c:if>
								</c:if>
								</c:forEach>
							</font></td>
							<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="#000">
							투수 :
								<c:forEach var="away" items="${awayTeam.team_info }" varStatus="stat">
								<c:if test="${away.POSITION=='투수' }">
									<a id="teamplayer" href=""> ${away.NAME }</a>
									<c:if test="${stat.count%3==0 }">
										<br />
									</c:if>
								</c:if>
								</c:forEach>
							</font></td>
						</tr>
						<tr>
							<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="#000">
							야수 :
								<c:forEach var="home" items="${homeTeam.team_info }" varStatus="stat">
								<c:if test="${home.POSITION=='야수' }">
									<a id="teamplayer" href=""> ${home.NAME }</a>
									<c:if test="${stat.count%3==0 }">
										<br />
									</c:if>
								</c:if>
								</c:forEach>
							</font></td>
							<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="#000">
							야수 :
								<c:forEach var="away" items="${awayTeam.team_info }" varStatus="stat">
								<c:if test="${away.POSITION=='야수' }">
									<a id="teamplayer" href=""> ${away.NAME }</a>
									<c:if test="${stat.count%3==0 }">
										<br />
									</c:if>
								</c:if>
								</c:forEach>
							</font></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="team_sub">
				<p style="font: bold 15px; color: blue;">●팀 전적</p>
				<table id="team_intro" class="panel panel-default center_table"
					style="width: 100%; margin-top: 10px">
					<thead class="panel-heading">
						<tr>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#00F"> 팀명 </font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#00F"> 순위 </font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#00F"> 경기수 </font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#00F"> 승 </font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#00F"> 패 </font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#00F"> 타율 </font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#00F"> 방어율 </font></td>
						</tr>
					</thead>
					<tbody class="panel-bod">
					<tr style="border-bottom: 0.5px dotted gray;">
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#000"> ${homeTeam.name }</font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#000"> ${homeTeam.rank } </font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#000"> ${homeTeam.win + homeTeam.lose } </font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#000"> ${homeTeam.win } </font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#000"> ${homeTeam.lose } </font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#000"> ${homeTeam.team_avg } </font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#000"> ${homeTeam.team_era }</font></td>
					</tr>
					<tr>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#000"> ${awayTeam.name }</font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#000"> ${awayTeam.rank } </font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#000"> ${awayTeam.win + homeTeam.lose } </font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#000"> ${awayTeam.win } </font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#000"> ${awayTeam.lose } </font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#000"> ${awayTeam.team_avg } </font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#000"> ${awayTeam.team_era } </font></td>
					</tr>
					</tbody>
				</table>
			</div>
			<div id="player_info">
			<p style="font: bold 15px; color: blue;">●선수 정보</p>
			<table id="player_intro" class="panel panel-default center_table"
					style="width: 100%; margin-top: 10px">
					<thead class="panel-heading">
						<tr>
							<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#00F"> 이름</font></td>
							<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#00F"> 포지션</font></td>
							<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#00F"> 정보들을 추가시키자</font></td>
						</tr>
					</thead>
			</table>
			</div>
</div>