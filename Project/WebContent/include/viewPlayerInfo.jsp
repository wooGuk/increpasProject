<!--
		/*
	제 목 : viewPlayerInfo.jsp
	역 할 : 상세보기 탬 
	로 그 : 1.프로그램 최초 생성(오우석 2016/06/16)
				-투수,야수에 따라서 테이블값 다름
				-Ajax를 통해 값을 받아옴
	*/ 
 -->
<%@page import="mybatis.vo.PlayerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	PlayerVO vo= (PlayerVO)request.getAttribute("player");
%>
<thead class="panel-heading">
	<tr>
		<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#00F"> 이름</font></td>
		<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#00F"> 팀</font></td>
		<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#00F"> 포지션</font></td>
		<c:if test="${player.getPOSITION()=='투수' }">
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#00F"> 승</font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#00F"> 패</font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#00F"> 이닝</font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#00F"> 방어율</font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#00F"> 세이브</font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#00F"> 홀드</font></td>
		</c:if>
		<c:if test="${player.getPOSITION()=='야수' }">
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#00F"> 타석</font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#00F"> 안타</font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#00F"> 홈런</font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#00F"> 득점</font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#00F"> 타점</font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#00F"> 볼넷</font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#00F"> 삼진</font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#00F"> 타율</font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#00F"> 장타율</font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#00F"> 도루</font></td>
		</c:if>
	</tr>
</thead>
<tbody class="panel-bod">
	<tr id="inputPlayerInfo">
	<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#000"> <%=vo.getNAME()%></font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#000"> <%=vo.getTEAM_NAME() %></font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#000"> <%=vo.getPOSITION() %></font></td>
	<c:if test="${player.getPOSITION()=='투수' }">
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#000"> <%=vo.getWIN() %></font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#000"> <%=vo.getLOSE() %></font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#000"> <%=vo.getINN() %></font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#000"> <%=vo.getERA() %></font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#000"> <%=vo.getSAVE() %></font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#000"> <%=vo.getHOLD() %></font></td>
		</c:if>
	<c:if test="${player.getPOSITION()=='야수' }">
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#000"> <%=vo.getATBAT() %></font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#000"> <%=vo.getHITS() %></font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#000"> <%=vo.getHOMERUN() %></font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#000"> <%=vo.getRUN() %></font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#000"> <%=vo.getRBI() %></font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#000"> <%=vo.getBALLFOUR() %></font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#000"> <%=vo.getSOUT() %></font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#000"> <%=vo.getAVGS() %></font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#000"> <%=vo.getOPS() %></font></td>
			<td height="20" align="center" bgcolor="#669AB3" width="56"><font
			color="#000"> <%=vo.getSTEALBASE() %></font></td>
		</c:if>
	</tr>
</tbody>
