<%@page import="mybatis.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
	
	제 목 : mypageheader.jps
	역 할 : 마이페이지 상단부
	로 그 : 1.프로그램 최초 생성 (장준수 2016/06/16)
		  2. 122번째줄 팝업창 함수 추가하여 delmember.jsp 로 이동하는 소스 추가
		  3.마이페이지 링크 수정(mypage.inc -> mypageCheck.inc) (정성훈 2016.06.28)
		  3. 마이페이지 css 대대적으로 수정 (장준수 2016/06/30)
		  

 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/basic.css">
<title>Insert title here</title>
</head>
<body>
	
	<c:if test="${vo != null }">
		<div id="header">
			<h1 class="fl">
				<a href="main.inc"><img alt="logo" src="img/logo.png"></a>
			</h1>
			<div class="fr">
				<form id="mypaheform">
					<table id="mypagetable">
						<caption>MY 테이블</caption>
						<tbody>
							<tr>
								<td colspan="2"><b>${vo.id }</b>님의 MYPAGE</td>
								<td rowspan="2"><a href="logout.inc"><img alt="로그아웃" src="img/logout.png" title="로그아웃"></a></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>

		<ul class="gnb">
			<li><a href="notice.inc"><span class="menu m01">공지사항</span></a></li>
			<li><a href="todaylist.inc"><span class="menu m02">경기구매</span></a></li>
			<li><a href="gameInfo.inc"><span class="menu m03">경기정보</span></a></li>
			<li><a href="mypageCheck.inc"><span class="menu m04">마이페이지</span></a></li>
			<li><a href="freeBoard.inc"><span class="menu m05">자유게시판</span></a></li>
		</ul>
		</div>
	</c:if>
</body>
</html>
