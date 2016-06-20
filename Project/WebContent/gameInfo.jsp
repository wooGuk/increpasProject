<!-- 
	/*
	제 목 : gameInfo.jsp
	역 할 : 게임정보 페이지
	로 그 : 1. 경기정보 페이지 (정성훈 2016.06.20)
			2. 팀순위보기 (정성훈 2016.06.20)
	*/
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c"
 uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/basic.css">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<!-- 상단영역시작 -->
		<jsp:include page="include/header.jsp"></jsp:include>
		<!-- 상단영역종료 -->
		
		<!-- 콘텐츠영역시작 -->
 		<div id="contents">
			<table class="fl" style="margin-right: 50px;">
				<thead>
					<tr>
						<td><span><a href="">경기정보</a></span></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><a href="todaylist.inc">경기일정 ></a></td>
					</tr>
					<tr>
						<td><a href="viewRank.inc">팀 순위 ></a></td>
					</tr>
				</tbody>
			</table>
			<!-- 팀 순위보기 시작 -->
			<c:if test="${infoFlag =='viewRank' }">
				<table>
					<tbody>
						<c:forEach var="team" items="${teams }">
						<tr>
							<td>${team.name }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
			<!-- 팀 순위보기 종료 -->
		</div>
		<!-- 콘텐츠영역종료 -->

		<!-- 하단영역시작 -->
		<jsp:include page="include/footer.jsp"></jsp:include>
		<!-- 하단영역종료 -->
	</div>
</body>
</html>