<!--
		/*
	제 목 : gamebuy.jsp
	역 할 : 구매페이지 
	로 그 : 1.프로그램 최초 생성(오우석 2016/06/21)
			2.게임구매방법tab 완료(오우석 2016/06/21)
			3.게임결제시 최소금액 1000원 검사 로직 추가(오우석 2016/06/22)
			4.Ajax활용을 위한 코인체크메소드 추가 오우석(2016/06/24)
			  if문 조건 null 에서 ''로 수정 오우석(2016/06/24)
			5.분석글 추가(정성훈 2016.06.27)  
			6.배팅취소하기 버튼 추가(오우석 2016.06.28)
			7.팀정보의 팀 전적정보 추가, 선수정보 레이아웃 정의(오우석 2016.06.28)
			8.callplay, res2메소드 추가(AJAX활용), 선수 P_IDX값 넘기기, 선수정보 테이블 레이아웃변경 오우석(2016/07/06)
			9.광고div추가 오우석(2016/07/07)
	*/ 
 -->
<%@page import="mybatis.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link type="text/css" rel="stylesheet" href="css/basic.css">
<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
<%
	MemberVO vo = (MemberVO)session.getAttribute("vo");
%>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript">
function trans(temp) {
	// id가 tab1,tab2,tab3 모두를 검색한다.
	var tab1 = document.getElementById("tab1");
	var tab2 = document.getElementById("tab2");
	var tab3 = document.getElementById("tab3");
	var tab4 = document.getElementById("tab4");
	var tab5 = document.getElementById("tab5");
	var t1 = document.getElementById("ta1");
	var t2 = document.getElementById("ta2");
	var t3 = document.getElementById("ta3");
	var t4 = document.getElementById("ta4");
	var t5 = document.getElementById("ta5");
	
	//검색된 tab1,tab2,tab3 모두를 클래스
	if (temp == 1) {
		tab1.className = "tab_cont show";
		tab2.className = "tab_cont";
		tab3.className = "tab_cont";
		tab4.className = "tab_cont";
		tab5.className = "tab_cont";
		t1.className = "active";
		t2.className = "";
		t3.className = "";
		t4.className = "";
		t5.className = "";
	} else if (temp == 2) {
		tab1.className = "tab_cont";
		tab2.className = "tab_cont show";
		tab3.className = "tab_cont";
		tab4.className = "tab_cont";
		tab5.className = "tab_cont";
		t1.className = "";
		t2.className = "active";
		t3.className = "";
		t4.className = "";
		t5.className = "";
	} else if (temp == 3) {
		tab1.className = "tab_cont";
		tab2.className = "tab_cont";
		tab3.className = "tab_cont show";
		tab4.className = "tab_cont";
		tab5.className = "tab_cont";
		t1.className = "";
		t2.className = "";
		t3.className = "active";
		t4.className = "";
		t5.className = "";
	} else if (temp == 4) {
		tab1.className = "tab_cont";
		tab2.className = "tab_cont";
		tab3.className = "tab_cont";
		tab4.className = "tab_cont show";
		tab5.className = "tab_cont";
		t1.className = "";
		t2.className = "";
		t3.className = "";
		t4.className = "active";
		t5.className = "";
	}  else {
		tab1.className = "tab_cont";
		tab2.className = "tab_cont";
		tab3.className = "tab_cont";
		tab4.className = "tab_cont";
		tab5.className = "tab_cont show";
		t1.className = "";
		t2.className = "";
		t3.className = "";
		t4.className = "";
		t5.className = "active";
	}
}
function info_send(){
	if(document.getElementById("coin").value < 1000){
		alert("최소구매가능금액은 1000원입니다.");
	}else if(document.getElementById("coin").value == ""){
		alert("구매금액을 입력해 주십시오");
	}else if(document.getElementById("pos").firstChild.getClassName == "impossible"){
		alert("구매금액을 확인하십시오");
	}else if(document.getElementById("result").value == null){
		alert("결과를 선택하십시오");
	}else{
		//alert(document.getElementById("pos").);
		hiddenWin();
		document.getElementById("f").submit();
	}
}
function showWin(){
	//if문 조건 null 에서 ''로 수정 오우석(2016/06/24)
	if('${vo}' == ''){
		alert("로그인이 필요합니다");
		location.href="mypageCheck.inc";
	}else{
		document.getElementById("bat_window").style.display = "block";
	}
}
function hiddenWin(){
	document.getElementById("bat_window").style.display = "none";
}
//Ajax활용을 위한 코인체크메소드 추가 오우석(2016/06/24)
function checkCoin(){
	var id = '${vo.id}';
	var coin = document.getElementById("coin").value;
	var param = "coin="+encodeURIComponent(coin)+"&id="+encodeURIComponent(id);
	sendRequest("checkCoin.inc", param, res, "post", true);
}
//Ajax활용을 위한 선수불러오기메소드 추가 오우석(2016/07/05)
function callPlayer(p_idx){
	var index = p_idx;
	var param = "index="+index;
	sendRequest("viewPlayerInfo.inc", param, res2, "post", true);
}
function res() {
	if(xhr.readyState==4 && xhr.status==200){
		//현재문서에서 아이디가 view인
		//객체를 검색한다.
		var v =document.getElementById("pos");
		v.innerHTML = xhr.responseText;
	}
}
//Ajax callback시 호출되는 함수 오우석(2016/07/05)
function res2() {
	if(xhr.readyState==4 && xhr.status==200){
		//현재문서에서 아이디가 view인
		//객체를 검색한다.
		var v =document.getElementById("player_intro");
		v.innerHTML = xhr.responseText;
		//HTML내에서 위치이동(location.href)
		location.href="#player_info";
	}
}
</script>
<style>
#basic_info {
	border: 1px double gray;
	padding: 5px;
}
#basic_info p{
	padding: 5px 8px;
}
#tab2 div {
	margin: 20px;
}
#tab1 div {
	margin: 20px;
}
.center_table tr td {
	text-align: center;
}
#bat_window{
		width: 400px;
		height:100px;
		padding: 20px;
		border: 2px solid #00b3dc;
		/*절대위치에 놓기 위해 absolute적용*/
		position: absolute;
		top:300px;
		left: 500px;
		text-align: center;
		background-color: #dedede;
		/*초기값을 보이지 않게 설정*/
		display: none;	
}
#buy_info{
	border: 1px double gray;
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
.panel-bod tr{
	border-bottom: 0.5px dotted gray;
}
#teamplayer:HOVER{
	text-decoration: underline;
	color: blue;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Header 영역 -->
	<%@include file="include/header.jsp"%>
	<div id="contents">
	<div class="center_side">
		<ul class="nav nav-tabs nav-justified">
			<li id="ta1" role="presentation"><a href="javascript:trans(1)">게임구매방법</a></li>
			<li id="ta2" role="presentation" class="active"><a
				href="javascript:trans(2)">기본정보</a></li>
			<li id="ta3" role="presentation"><a href="javascript:trans(3)">맞대결전적</a></li>
			<li id="ta4" role="presentation"><a href="javascript:trans(4)">팀정보</a></li>
			<li id="ta5" role="presentation"><a href="javascript:trans(5)">분석글</a></li>
		</ul>
	</div>
	<div class="fclear"></div>
	<!-- 2.게임구매방법tab 완료(오우석 2016/06/21) -->
	<div class="tab_cont" id="tab1">
		<div id="buy_info" style="border: none;">
			<img alt="" src="img/info.jpg" width="100%"/>
		</div>
		<div id="info_text">
				<div id="information">
					<h3 class="title">01 프로야구 승무패란?</h3>
					<ul>
						<li><h5 class="sub_title">1.게임방법</h5></li>
						<li><span> 국내 프로야구 하루 5경기를 대상으로 홈팀의 승/무/패를 맞히는 게임입니다.<br />
							연장전도 포함됩니다.<br /></span></li>
						<li><p>※ 승 : 홈팀 승 / 무: 무승부 / 패 : 홈팀 패</p></li>
						<br/>
						<li><h5 class="sub_title">2.최소구매가능금액은 <font color="orange">1000</font>원 입니다.</h5></li>
					</ul>
					<br/>
					<h3 class="title">02 경기정보 활용법</h3>
					<ul>
						<li><h1 class="sub_title" style="text-align: center;"> 구매 시 필요한 다앙한 정보를 제공합니다.<br/></h1>
						<li><img alt="" src="img/match_info.jpg" width="100%"/></li>
					</ul>
					<h3 class="title">03 구매하기</h3>
					<ul>
						<li><img alt="" src="img/buy_info.jpg" width="100%"/></li>
						<li class="sub_title"><span> <font color="red">홈팀 기준입니다.</font><br /></span></li>
						<li><p>※ 승 : 홈팀 승 / 무: 무승부 / 패 : 홈팀 패</p></li>
						<li>최소 1000원이상 구매하셔야 합니다.</li>
					</ul>
				</div>
			</div>
	</div>
	<div class="tab_cont show" id="tab2">
			<!-- 광고div추가 오우석(2016/07/07)-->
			<div id="ad">
				<p>
					<a href="http://www.betman.co.kr/betCoachMain.so">
						<img alt=""	src="img/ad.jpg" width="100%" height="100px">
					</a>
				</p>
			</div>
			<div id="basic_info">
			<p>발매기간 하루 전까지 발매</p>
			<p>발 표 일 경기개최 당일 적중결과 발표</p>
			<p>환급기간 선택한 모든 대상경기의 발표일 익일부터 1년간</p>
		</div>

		<div style="padding-top: 20px">
			<table class="panel panel-default center_table" style="width: 100%">
				<thead class="panel-heading">
					<tr>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#00F">회 차</font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#00F">경기시간 ▼<br />경기장소
						</font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#00F">홈 vs 원정</font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#00F">선발투수</font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#00F">상금(율)</font></td>
					</tr>
				</thead>
				<tbody class="panel-bod">
					<tr style="border: none;">
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#000">${game.match_code }</font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#000">${game.match_year }-${game.match_month }-${game.match_day }<br />${game.homeName(game.home_code) }구장</font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#000">${game.teamName(game.home_code) } vs
								${game.teamName(game.away_code) }</font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="blue">${game.home_pitcher } vs ${game.away_pitcher }</font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="red"> 2배 </font></td>
					</tr>
					<tr>
						<td colspan="5">
							<button id="getBat" onclick="javascript:showWin()">배팅하기</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	</div>
	<!-- 여기는 맞대결전적(상대전적 가져오기) -->
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
									color="#000">${vsgame.match_year }년${vsgame.match_month }월${vsgame.match_day }일</font></td>
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
						<!-- AJAX를 통해서 값을 넘기기 위해 javascript:callPlayer('')작업 수행 오우석 2016/07/06 -->
							<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="#000">
							투수 :
								<c:forEach var="home" items="${homeTeam.team_info }" varStatus="stat">
								<c:if test="${home.POSITION=='투수' }">
									<a id="teamplayer" href="javascript:callPlayer('${home.getP_IDX()}')"> ${home.NAME }</a>
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
									<a id="teamplayer" href="javascript:callPlayer('${away.getP_IDX()}')"> ${away.NAME }</a>
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
									<a id="teamplayer" href="javascript:callPlayer('${home.getP_IDX()}')"> ${home.NAME }</a>
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
									<a id="teamplayer" href="javascript:callPlayer('${away.getP_IDX()}')"> ${away.NAME }</a>
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
							color="#000"> ${awayTeam.win + awayTeam.lose } </font></td>
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
			<!-- AJAX를 통해서 넘어온 HTML값으로 꾸며짐 오우석 2016/07/05 -->
			<table id="player_intro" class="panel panel-default center_table"
					style="width: 100%; margin-top: 10px">
			</table>
			</div>
		</div>
		
		<div class="tab_cont" id="tab5">
			<table id="listTable" style="width: 70%; margin: auto;">
				<thead>
					<tr>
						<td class="t1"
							style="background: #5D5D5D; height: 35px; font-weight: bold;"><font
							color="#FFFFFF">번호</font></td>
						<td class="t2"
							style="background: #5D5D5D; height: 35px; font-weight: bold;"><font
							color="#FFFFFF">제목</font></td>
						<td class="t3"
							style="background: #5D5D5D; height: 35px; font-weight: bold;"><font
							color="#FFFFFF">아이디</font></td>
						<td class="t4"
							style="background: #5D5D5D; height: 35px; font-weight: bold;"><font
							color="#FFFFFF">날짜</font></td>
						<td class="t5"
							style="background: #5D5D5D; height: 35px; font-weight: bold;"><font
							color="#FFFFFF">조회수</font></td>
					</tr>
				</thead>
				<c:forEach var="list" items="${list }" varStatus="stat">
					<tr>
						<td class="a1">${rowTotal-((nowPage-1)*blockList+stat.index) }
						</td>
						<td class="a1">
							<%-- step값만큼 들여쓰기하는 반복문 --%> <c:forEach begin="1"
								end="${list.step }">
								<c:out value="&nbsp;&nbsp;" escapeXml="false" />
							</c:forEach> <%-- step이 0이 아닌 경우엔 화살표 이미지 출력 --%> <c:if
								test="${list.step > 0 }">
								<img src="img/arrow.JPG" />
							</c:if> <a href="viewAnal.inc?seq=${list.seq }&nowPage=${nowPage}">${list.title }</a>
						</td>
						<td class="a1">${list.id }</td>
						<td class="a1">${list.regdate }</td>
						<td class="a1">${list.hit }</td>
					</tr>
				</c:forEach>
				<c:if test="${empty list }">
					<tr>
						<td style="background: #DBDBDB; text-align: center" colspan="5"
							height="70">등록된 게시물이 없습니다.</td>
					</tr>
				</c:if>
					<tr>
						<td colspan="4" style="text-align: left;">${pageCode }</td>
						<td style="text-align: right;">
							<c:if test="${vo != null }">
								<input type="button" value="글쓰기"
									onclick="javascript:location.href='writeAnalForm.inc'" />
							</c:if>
						</td>
					</tr>
			</table>
		</div>
	</div>
	<div id="bat_window">
		<form action="buy.inc" id="f" name="f" method="post">
		 	<input type="radio" name="result" id="result"  value="${game.home_code }"/>승
		 	<input type="radio" name="result" id="result"  value="11"/>무
		 	<input type="radio" name="result" id="result"  value="${game.away_code }"/>패
		 	<br/>
		 	<label for="coin">배팅코인: </label>
		 	<input type="text" id="coin" name="coin" onkeyup="checkCoin()"/>
		 	<span id="pos"></span>
		 	<br/>
		 	<input type="button" id="go" onclick="javascript:info_send()" value="배팅하기"/>
		 	<input type="button" id="cancel" onclick="javascript:hiddenWin()" value="취    소"/>
			<input name="match_code" type="hidden" value="${game.match_code }"/>
			<input name="id" type="hidden" value="${vo.id }"/>
		</form>
	</div>
	<!-- Footer 영역 -->
	<%@include file="include/footer.jsp"%>
	
</body>
</html>