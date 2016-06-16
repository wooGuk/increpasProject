<!--
		/*
	제 목 : tab.jsp
	역 할 : 상세보기 탬 
	로 그 : 1.프로그램 최초 생성(오우석 2016/06/16)
	*/ 
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="center_side">
					<ul class="nav nav-tabs nav-justified">
						<li id="t1" role="presentation"><a href="javascript:trans(1)">게임구매방법</a></li>
						<li id="t2" role="presentation" class="active"><a href="javascript:trans(2)">게임정보</a></li>
						<li id="t3" role="presentation"><a href="javascript:trans(3)">맞대결전적</a></li>
						<li id="t4" role="presentation"><a href="javascript:trans(4)">팀정보</a></li>
						<li id="t5" role="presentation"><a href="javascript:trans(5)">분석글</a></li>
					</ul>
			</div>
			<div class="fclear"></div>
			<div class="tab_cont" id="tab1">
				첫번째 tab
			</div>
			<div class="tab_cont show" id="tab2">
				<table>
					<thead>
						<tr>
							<td>경    기</td>
							<td>경기일자</td>
							<td>경기시간</td>
							<td>홈 vs 원정</td>
							<td>결    과</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${game.match_code }</td>
							<td>${game.match_year }-${game.match_month }-${game.match_day }</td>
							<td>${game.match_hour }</td>
							<td>${game.teamName(game.home_code) } vs ${game.teamName(game.away_code) }</td>
							<td>${game.result }</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="tab_cont" id="tab3">
				첫번째 tab
			</div>
			<div class="tab_cont" id="tab4">
				첫번째 tab
			</div>
			<div class="tab_cont" id="tab5">
				첫번째 tab
			</div>