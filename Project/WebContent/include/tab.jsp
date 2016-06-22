<!--
		/*
	제 목 : tab.jsp
	역 할 : 상세보기 탬 
	로 그 : 1.프로그램 최초 생성(오우석 2016/06/16)
	        2.광고추가, 알림창 추가, 정보 수정(오우석 2016/06/20)
	        3.게임구매방법tab 완료(오우석 2016/06/21)
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
</style>
<div class="center_side">
	<ul class="nav nav-tabs nav-justified">
		<li id="t1" role="presentation"><a href="javascript:trans(1)">게임구매방법</a></li>
		<li id="t2" role="presentation" class="active"><a
			href="javascript:trans(2)">게임정보</a></li>
		<li id="t3" role="presentation"><a href="javascript:trans(3)">맞대결전적</a></li>
		<li id="t4" role="presentation"><a href="javascript:trans(4)">팀정보</a></li>
		<li id="t5" role="presentation"><a href="javascript:trans(5)">분석글</a></li>
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
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="tab_cont" id="tab3">첫번째 tab</div>
<div class="tab_cont" id="tab4">첫번째 tab</div>
<div class="tab_cont" id="tab5">첫번째 tab</div>