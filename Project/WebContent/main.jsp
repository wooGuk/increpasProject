<!-- 
	/*
	제 목 : main.jsp
	역 할 : main 페이지
	로 그 : 1. flag를 통해 정상로그인을 체크 (정성훈 2016/06/15)
			2. 콘텐츠영역 경기정보, 공지사항, 자유게시판 틀 생성 (정성훈 2016/06/15)
			3. 경기일정 보기란 로고띄우기 (정성훈 20160616)
			4. 마이페이지 이동시 로그인 유무 체크 (정성훈 20160616)
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/basic.css">
<script type="text/javascript">

//로그인 체크(onload로 바로 실행)
function check() {
	/*
	 * flag == 1 아이디 오류
	 * flag == 2 비밀번호 오류
	 * flag == 3 정상로그인
	 * flag == 4 로그인 후 사용해야 하는 것들
	*/
	var flag = document.getElementById("loginCheck").value;
	if(flag == "1"){
		alert("아이디가 존재 하지 않습니다.");
	}
	else if(flag == "2"){
		alert("비밀번호가 일치 하지 않습니다.");
	}
	else if(flag == "4"){
		alert("로그인 후 사용해주세요.");
	}
}
</script>
</head>
<body onload="check()">
	<div id="wrap">
		<!-- 상단영역시작 -->
		<jsp:include page="include/header.jsp"></jsp:include>
		<!-- 상단영역종료 -->
		
		<!-- 콘텐츠영역시작 -->
 		<div id="contents">
 			<table id="contents_sub">
 				<tr>
 					<td colspan="2">
 						<div class="gameInfo">
 							<table class="gameInfoTable">
								<tbody>
								<!-- 반복문 돌면서 경기일정 출력 -->
								<%
									for(int i=0; i<games.length; i++){
								%>
										<tr>
											<td>
												<img alt="" src="<%=logo.get(games[i].getHome_code()) %>">
											</td>
											<td>vs</td>
											<td>
												<img alt="" src="<%=logo.get(games[i].getAway_code()) %>">
											</td>
										</tr>
								<%
									}//for()
								%>		
								</tbody>
							</table>
 						</div>
 					</td>
 				</tr>
 				<tr>
 					<td>
 						<div class="noticeBoard">
 							공지사항
 						</div>
 					</td>
 					<td>
 						<div class="freeBoard">
 							자유게시판
 						</div>
 					</td>
 				</tr>
 			</table>
		</div>
		<!-- 콘텐츠영역종료 -->

		<!-- 하단영역시작 -->
		<jsp:include page="include/footer.jsp"></jsp:include>
		<!-- 하단영역종료 -->
	</div>
	
	<!-- 로그인을 체크 할 flag 숨김 -->
	<input type="hidden" id=loginCheck value="${flag }">
	
</body>
</html>