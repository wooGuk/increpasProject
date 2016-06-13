<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    
<script type="text/javascript">

 function login(){
	 var f = document.getElementById("loginForm");
	 f.action = "login2.inc";
	 f.method = "post";
	 f.submit();
 }
</script>    
    
<div id="header">
	<!-- 로고클릭시 메인페이지로 이동 (정성훈 2016/06/10)  -->
	<h1 class="fl"><a href="main.inc"><img alt="logo" src="img/logo.png"></a></h1>
	
	<c:if test="${vo != null}">
	</c:if>
	
	<div class="fr">
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
						<!-- 회원가입 페이지로 이동 (정성훈 2016/06/10)  -->
						<td><a href="go_join.inc">회원가입</a></td>
						<td><a href="">아이디/비밀번호 찾기</a></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</form>
		
		<!-- 로그인 세션처리 나중에 필요함 -->
		<!-- 로그인이 되어있을때 테이블처리 (정성훈 2016/06/10)  -->
<!-- 		<table id="loginTable">
			<caption>MY 테이블</caption>
			<tbody>
				<tr>
					<td colspan="2">님! 반갑습니다.</td>
					<td rowspan="2"><a href=""><img alt="로그아웃" src="img/logout.png" title="로그아웃"></a></td>
				</tr>
				<tr>
					<td>잔액:</td>
					<td>???원</td>
				</tr>
			</tbody>
		</table> -->
	</div>
	
	<ul class="gnb">
		<li><a href=""><span class="menu m01">공지사항</span></a></li>
		<li><a href="todaylist.inc"><span class="menu m02">경기구매</span></a></li>
		<li><a href=""><span class="menu m03">경기정보</span></a></li>
		<li><a href=""><span class="menu m04">마이페이지</span></a></li>
		<li><a href=""><span class="menu m05">자유게시판</span></a></li>
	</ul>
</div>
 
