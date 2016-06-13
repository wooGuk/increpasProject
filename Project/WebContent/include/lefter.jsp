<!--
		/*
	제 목 : lefter.jsp
	역 할 : 게임구매 창의 왼쪽 탭
	로 그 : 1.프로그램 최초 생성(오우석 2016/06/13)
	*/ 
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="left_side">
	<table id="left_info">
		<thead>
			<tr>
				<td><span><a href="">게임구매</a></span></td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><a href="todaylist.inc">구매가능 게임 ></a></td>
			</tr>
			<tr>
				<td><a href="endlist.inc">마감게임 보기 ></a></td>
			</tr>
			<tr>
				<td><a href="gamescedule.inc">게임일정 ></a></td>
			</tr>
			<tr>
				<td><a href="gameresult.inc">게임결과 ></a></td>
			</tr>
		</tbody>
	</table>
</div>