<!-- 
	/*
	제 목 : main.jsp
	역 할 : main 페이지
	로 그 : 1. flag를 통해 정상로그인을 체크 (정성훈 2016/06/15)
			2. 콘텐츠영역 경기정보, 공지사항, 자유게시판 틀 생성 (정성훈 2016/06/15)
			3. 경기일정 보기란 로고띄우기 (정성훈 20160616)
			4. 마이페이지 이동시 로그인 유무 체크 (정성훈 20160616)
			5. 선발투수, 장소 추가 (정성훈 2016.06.21)
			6. 자유게시판, 공지사항 추가 (정성훈 2016.06.24)
			7. 공지사항 작성자 공통적으로 Admin 찍히게 수정 ( 박상원 2016/06/28)
	*/
 -->

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="mybatis.vo.MatchVO"%>
<%@page import="mybatis.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"
 uri="http://java.sun.com/jsp/jstl/core" %>
 <%
 	//로고 이미지 경로 저장
 	//팀코드, 경로
	Map<Integer, String> logo = new HashMap<Integer, String>();
	logo.put(1, "img/team/emblem_OB.png");
	logo.put(2, "img/team/emblem_NC.png");
	logo.put(3, "img/team/emblem_WO.png");
	logo.put(4, "img/team/emblem_LG.png");
	logo.put(5, "img/team/emblem_SS.png");
	logo.put(6, "img/team/emblem_LT.png");
	logo.put(7, "img/team/emblem_SK.png");
	logo.put(8, "img/team/emblem_HT.png");
	logo.put(9, "img/team/emblem_HH.png");
	logo.put(10, "img/team/emblem_KT.png");
	
 	MatchVO[] games = (MatchVO[])request.getAttribute("games");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
<style type="text/css">

/* 경기정보 table */
	#gameInfoTable{
		margin:auto;
		width: 70%;
	}
	
/* 공지사항 table */

/* 자유게시판 table */	

/* 공지사항, 자유게시판 공통 */

	.boardTitle td{
		font-size: 20px;
		font-weight: bold;
		padding: 10px 0px;
	}
	.subTitle td{
		font-size: 15px;
		font-weight: bold;
		padding: 5px 0px;
	}
		
/* 공통 */
	table a:HOVER {
		text-decoration: underline;
		color: #f00;
	}
	table td{
		text-align: center;
	}
	table thead td{
		background-color: #000;
		color: #fff;
	}
	
	#hide{
		display: none;
	}
</style>
</head>
<body>
	<div id="wrap">
		<!-- 상단영역시작 -->
		<jsp:include page="include/header.jsp"></jsp:include>
		<!-- 상단영역종료 -->
		
		<!-- 콘텐츠영역시작 -->
 		<div id="contents">
			<table id="gameInfoTable" class="table table-striped">
				<thead>
					<tr class="boardTitle">
						<td colspan="3">TODAY MATCH&nbsp;&nbsp;&nbsp;&nbsp;<a href="gameInfo.inc" style="color: #fff">더 보기</a></td>
					</tr>
				</thead>
				<tbody>
				<!-- 반복문 돌면서 경기일정 출력 -->
				<%
					for(int i=0; i<games.length; i++){
				%>
						<tr>
							<td>
								<img alt="" src="<%=logo.get(games[i].getHome_code()) %>">
								<b><%=games[i].teamName(games[i].getHome_code()) %></b>
								<b>(선발투수:<%=games[i].getHome_pitcher() %>)</b>
							</td>
							<td>
								<b>vs</b><br>
								<b>(<%=games[i].homeName(games[i].getHome_code()) %>)</b>
							</td>
							<td>
								<img alt="" src="<%=logo.get(games[i].getAway_code()) %>">
								<b><%=games[i].teamName(games[i].getAway_code()) %></b>
								<b>(선발투수:<%=games[i].getAway_pitcher() %>)</b>
							</td>
						</tr>
				<%
					}//for()
				%>		
				</tbody>
			</table>
			<div class="fl" style="width: 470px; margin-top: 20px;">
				<table id="noticeTable" class="table table-striped noticeFree">
					<thead>
						<tr class="boardTitle">
							<td colspan="3">공지사항&nbsp;&nbsp;&nbsp;&nbsp;<a href="notice.inc" style="color: #fff">더 보기</a></td>
						</tr>
						<tr class="subTitle">
							<td>작성자</td>
							<td>제목</td>
							<td>작성일</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="vo" items="${nList }">
							<tr>
								<td>Admin</td>
								<td><a href="noticeview.inc?seq=${vo.seq }&nowPage=<%=1%>">${vo.title }</a></td>
								<td style="font-size: 10px;">${vo.regdate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="fr" style="width: 470px; margin-top: 20px;">
				<table id="freeTable" class="table table-striped noticeFree">
					<thead>
						<tr class="boardTitle">
							<td colspan="3">자유게시판&nbsp;&nbsp;&nbsp;&nbsp;<a href="freeBoard.inc" style="color: #fff">더 보기</a></td>
						</tr>
						<tr class="subTitle">
							<td>작성자</td>
							<td>제목</td>
							<td>작성일</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="vo" items="${fList }">
							<tr>
								<div id="hide">							
								<c:out value="${size = vo }"></c:out>
								</div>
								<td>${vo.id }</td>
								<td><a href="view.inc?seq=${vo.seq }&nowPage=<%=1%>">${vo.title }
								<c:if test="${size != null && size.anslist.size() > 0}">
							 	[${size.anslist.size()}]
								</c:if></a></td>
								<td style="font-size: 10px;">${vo.regdate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="fclear"></div>
		</div>
		<!-- 콘텐츠영역종료 -->

		<!-- 하단영역시작 -->
		<jsp:include page="include/footer.jsp"></jsp:include>
		<!-- 하단영역종료 -->
	</div>
</body>
</html>