<!-- 

	/*
	제 목 : gameSchedule.jsp
	역 할 : 모든 게임 일정 불러오기
	로 그 : 1.최초 개발(레이아웃까지 잡음)(데이터테스트 필요함) (오우석 2016/06/13)
			2.왼쪽 탭 링크연결 (오우석 2016/06/13)
			3.파라미터 네임 오류로 인한 변경 list - > games (오우석 2016.06/13)
			4.팀코드로 표현하는 팀명 초기화 작업 오우석(2016.06.14)
			5.팀명출력 오우석(2016.06.15)
			6.해당경기가 판매중인지 마감 되었는지 확인 오우석(2016.06.15)
			7.테이블 수정 오우석(2016.06.20)
			8.년월 까지 파악해야 되기 때문에 조건문을 choose로 수정 오우석(2016.07.04)
	*/
 -->
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/basic.css">
<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게임스케줄-프로야구 토토 승무패 페이지</title>
<link type="text/css" rel="stylesheet" href="css/basic.css">
<style type="text/css">
	.center_table tr td{
		text-align: center;
		border-bottom: 1px dashed gray;
		width: 240px;
	}
}
</style>
</head>
<body>
	<!-- Header 영역 -->
	<%@include file="include/header.jsp"%>
	
	<!-- 컨텐츠 영억 -->
	<div id="contents">
			<%@include file="include/lefter.jsp" %>
			<div style="width: 100%">
				<table class="panel panel-default center_table" width="750px">
					<thead class="panel-heading">
						※마감일자는 게임일정 하루 전입니다.
						<tr>
							<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="#00F">게임명</font></td>
							<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="#00F">게임일정</font></td>
							<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="#00F">상태</font></td>
						</tr>
					</thead>
					<tbody class="panel-bod">
						<!-- 여기를 반복문으로 돌려야 됨 -->
							<!-- 파라미터 네임 오류로 인한 변경 오우석(2016/06/13) -->
							<c:forEach var="vo" items="${games }" varStatus="stat">
							<!-- 팀코드로 표현하는 팀명 초기화 작업 오우석(2016.06.14) -->
							<!-- if문 구문 오류로 인한 변경 오우석(2016.06.14) -->
							<%-- <c:if test="${vo.home_code eq '1'}">
								<%=home="두산" %>
							</c:if>
							<c:if test="${vo.home_code eq '2'}">
								<%=home="NC" %>
							</c:if>
							<c:if test="${vo.home_code eq '3'}">
								<%=home="넥센" %>
							</c:if>
							<c:if test="${vo.home_code eq '4'}">
								<%=home="LG" %>
							</c:if>
							<c:if test="${vo.home_code eq '5'}">
								<%=home="삼성" %>
							</c:if>
							<c:if test="${vo.home_code eq '6'}">
								<%=home="롯데" %>
							</c:if>
							<c:if test="${vo.home_code eq '7'}">
								<%=home="SK" %>
							</c:if>
							<c:if test="${vo.home_code eq '8'}">
								<%=home="기아" %>
							</c:if>
							<c:if test="${vo.home_code eq '9'}">
								<%=home="한화" %>
							</c:if>
							<c:if test="${vo.home_code eq '10'}">
								<%=home="KT" %>
							</c:if>
							<c:if test="${vo.away_code eq '1'}">
								<%=away="두산" %>
							</c:if>
							<c:if test="${vo.away_code eq '2'}">
								<%=away="NC" %>
							</c:if>
							<c:if test="${vo.away_code eq '3'}">
								<%=away="넥센" %>
							</c:if>
							<c:if test="${vo.away_code eq '4'}">
								<%=away="LG" %>
							</c:if>
							<c:if test="${vo.away_code eq '5'}">
								<%=away="삼성" %>
							</c:if>
							<c:if test="${vo.away_code eq '6'}">
								<%=away="롯데" %>
							</c:if>
							<c:if test="${vo.away_code eq '7'}">
								<%=away="SK" %>
							</c:if>
							<c:if test="${vo.away_code eq '8'}">
								<%=away="기아" %>
							</c:if>
							<c:if test="${vo.away_code eq '9'}">
								<%=away="한화" %>
							</c:if>
							<c:if test="${vo.away_code eq '10'}">
								<%=away="KT" %>
							</c:if> --%>
							<tr>
								<!-- 팀명출력 오우석(2016.06.15)  -->
								<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="#000">${vo.teamName(vo.home_code) } : ${vo.teamName(vo.away_code) }</font></td>
								<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="#000">${vo.match_month}-${vo.match_day}</font></td>
								<!-- 해당경기가 판매중인지 마감 되었는지 확인 오우석(2016.06.15)-->
								<!-- 년월 까지 파악해야 되기 때문에 조건문을 choose로 수정 오우석(2016.07.04)-->
								<c:choose>
									<c:when test="${vo.match_day lt vo.findToday()}">
										<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="red"> 마감</font></td>
									</c:when>	
									<c:when test="${vo.match_day gt vo.findToday() and vo.match_month lt vo.findMonth() or vo.match_year lt vo.findYear()}">
									<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="red"> 마감</font></td>
									</c:when>
									<c:otherwise>
										<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="blue"> 판매중</font></td>
									</c:otherwise>
								</c:choose>   
							</tr>
							</c:forEach>
							<!-- 파라미터 네임 오류로 인한 변경 오우석(2016.06/13) -->
							<c:if test="${empty games }">
								<tr>
									<td bgcolor="#F2F7F9" colspan="3" height="70" align="center">등록된 게시물이 없습니다.</td>
								</tr>
							</c:if>
					</tbody>
				</table>	
			</div>
			<div style="text-align: center; margin-left: 18%; margin-top: 2px">
				<table width="556" border="0" cellspacing="0" cellpadding="0">
					<tr>
					  <td width="315" align="left">
                          ${pageCode }
					  </td>
					 </tr>
				</table>
			</div>
	</div>
	<div class="fclear"></div>
	
	<!-- Footer 영역 -->
	<jsp:include page="include/footer.jsp"/>

</body>
</html>