<!-- 
	/*
	제 목 : header.jsp
	역 할 : 페이지 상단부
	로 그 : 1. 로그인이 되어있을때 테이블처리 (정성훈 2016/06/10)
			2. 로고클릭시 메인페이지로 이동 (정성훈 2016/06/10)
			3. 회원가입 페이지로 이동 (정성훈 2016/06/10)
	*/
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	//로그인 클릭시
	function login() {
		var f = document.getElementById("loginForm");
		if (document.getElementById("id").value.trim() == "") {
			alert("아이디를 입력 하세요.");
			return;
		} else if (document.getElementById("password").value.trim() == "") {
			alert("비밀번호를 입력 하세요.");
			return;
		} else {
			f.action = "login.inc";
			f.method = "post";
			f.submit();
		}
	}
</script>

<div id="header">
	<!-- 상단 좌측 로고, 클릭 시 main페이지로 이동  -->
	<h1 class="fl"><a href="main.inc"><img alt="logo" src="img/logo.png"></a></h1>
	
	<div class="fr">
		<!-- 로그인 전, 로그인 화면 보여주기-->
		<c:if test="${vo == null }">
			<form id="loginForm">
				<table id="loginTable">
					<caption>로그인 테이블</caption>
					<tbody>
						<tr>
							<td><label for="id">ID:</label></td>
							<td><input type="text" id="id" name="id"></td>
							<td rowspan="2"><a href="javascript:login()"><img alt="로그인" src="img/login.png" title="로그인"></a></td>
						</tr>
						<tr>
							<td><label for="pwd">PASSWORD:</label></td>
							<td><input type="password" id="password" name="password"></td>
						</tr>
						<tr>
							<td><a href="go_join.inc">회원가입</a></td>
							<td><a href="">아이디/비밀번호 찾기</a></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</form>
		</c:if>
		
		<!-- 로그인 후, 개인 정보 화면 보여주기-->
 		<c:if test="${vo != null }">
	 		<table id="loginTable">
				<caption>MY 테이블</caption>
				<tbody>
					<tr>
						<td colspan="2"><b>${vo.id }</b>님! 반갑습니다.</td>
						<td rowspan="2"><a href="logout.inc"><img alt="로그아웃" src="img/logout.png" title="로그아웃"></a></td>
					</tr>
					<tr>
						<td>잔액:</td>
						<td><b>${vo.coin }</b>원</td>
					</tr>
				</tbody>
			</table>
		</c:if>
	</div>
	
	<!-- 메뉴들 -->
	<ul class="gnb">
		<li><a href=""><span class="menu m01">공지사항</span></a></li>
		<li><a href="todaylist.inc"><span class="menu m02">경기구매</span></a></li>
		<li><a href=""><span class="menu m03">경기정보</span></a></li>
		<li><a href=""><span class="menu m04">마이페이지</span></a></li>
		<li><a href=""><span class="menu m05">자유게시판</span></a></li>
	</ul>
</div>
 
