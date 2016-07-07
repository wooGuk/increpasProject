<!--
		/*
	제 목 : lefter.jsp
	역 할 : 게임구매 창의 왼쪽 탭
	로 그 : 1.프로그램 최초 생성(오우석 2016/06/13)
	*/ 
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="fl" style="margin-right: 50px">
	<table class="panel panel-primary" id="list-group">
		<thead class="panel-heading">
			<tr>
				<td class="list-group-item"><span>게임구매</span></td>
			</tr>
		</thead>
		<tbody class="panel-primary">
			<tr>
				<td class="list-group-item"><a href="todaylist.inc">구매가능 게임 ></a></td>
			</tr>
			<tr>
				<td class="list-group-item"><a href="endlist.inc">마감게임 보기 ></a></td>
			</tr>
			<tr>
				<td class="list-group-item"><a href="gamescedule.inc">게임일정 ></a></td>
			</tr>
			<!-- <tr>
				<td class="list-group-item"><a href="gameresult.inc">게임결과 ></a></td>
			</tr> -->
		</tbody>
	</table>
</div>