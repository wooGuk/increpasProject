<!--
		/*
	제 목 : tab.jsp
	역 할 : 상세보기 탬 
	로 그 : 1.프로그램 최초 생성(오우석 2016/06/16)
	        2.광고추가, 알림창 추가, 정보 수정(오우석 2016/06/20)
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

#tab2 div {
	margin: 20px;
}

.center_table tr td {
	text-align: center;
	border-bottom: 1px dashed gray;
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
<div class="tab_cont" id="tab1">첫번째 tab</div>
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
					<td>경 기</td>
					<td>경기시간 ▼<br/>경기장소</td>
					<td>홈 vs 원정</td>
					<td>결 과</td>
					<td>상 금</td>
				</tr>
			</thead>
			<tbody class="panel-bod">
				<tr>
					<td>${game.match_code }</td>
					<td>${game.match_year }-${game.match_month }-${game.match_day }<br/>${game.homeName(game.home_code) }구장</td>
					<td>${game.teamName(game.home_code) } vs ${game.teamName(game.away_code) }</td>
					<td><font color="red">${game.teamName(game.result) } 승리</font></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="tab_cont" id="tab3">첫번째 tab</div>
<div class="tab_cont" id="tab4">첫번째 tab</div>
<div class="tab_cont" id="tab5">첫번째 tab</div>