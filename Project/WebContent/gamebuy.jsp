<!--
		/*
	제 목 : gamebuy.jsp
	역 할 : 구매페이지 
	로 그 : 1.프로그램 최초 생성(오우석 2016/06/21)
	*/ 
 -->
<%@page import="mybatis.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link type="text/css" rel="stylesheet" href="css/basic.css">
<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
<%
	MemberVO vo = (MemberVO)session.getAttribute("vo");
%>
<script type="text/javascript">
function trans(temp) {
	// id가 tab1,tab2,tab3 모두를 검색한다.
	var tab1 = document.getElementById("tab1");
	var tab2 = document.getElementById("tab2");
	var tab3 = document.getElementById("tab3");
	var tab3 = document.getElementById("tab4");
	var tab3 = document.getElementById("tab5");
	var t1 = document.getElementById("t1");
	var t2 = document.getElementById("t2");
	var t3 = document.getElementById("t3");
	var t4 = document.getElementById("t4");
	var t5 = document.getElementById("t5");
	
	//검색된 tab1,tab2,tab3 모두를 클래스
	if (temp == 1) {
		tab1.className = "tab_cont show";
		tab2.className = "tab_cont";
		tab3.className = "tab_cont";
		tab4.className = "tab_cont";
		tab5.className = "tab_cont";
		t1.className = "active";
		t2.className = "";
		t3.className = "";
		t4.className = "";
		t5.className = "";
	} else if (temp == 2) {
		tab1.className = "tab_cont";
		tab2.className = "tab_cont show";
		tab3.className = "tab_cont";
		tab4.className = "tab_cont";
		tab5.className = "tab_cont";
		t1.className = "";
		t2.className = "active";
		t3.className = "";
		t4.className = "";
		t5.className = "";
	} else if (temp == 3) {
		tab1.className = "tab_cont";
		tab2.className = "tab_cont";
		tab3.className = "tab_cont show";
		tab4.className = "tab_cont";
		tab5.className = "tab_cont";
		t1.className = "";
		t2.className = "";
		t3.className = "active";
		t4.className = "";
		t5.className = "";
	} else if (temp == 4) {
		tab1.className = "tab_cont";
		tab2.className = "tab_cont";
		tab3.className = "tab_cont";
		tab4.className = "tab_cont show";
		tab5.className = "tab_cont";
		t1.className = "";
		t2.className = "";
		t3.className = "";
		t4.className = "active";
		t5.className = "";
	}  else {
		tab1.className = "tab_cont";
		tab2.className = "tab_cont";
		tab3.className = "tab_cont";
		tab4.className = "tab_cont";
		tab5.className = "tab_cont show";
		t1.className = "";
		t2.className = "";
		t3.className = "";
		t4.className = "";
		t5.className = "active";
	}
}
function info_send(){
	hiddenWin();
	document.getElementById("f").submit();
}
function showWin(){
	if('${vo}' == null){
		alert("로그인이 필요합니다");
		location.href="mypageCheck.inc";
	}else{
		document.getElementById("bat_window").style.display = "block";
	}
}
function hiddenWin(){
	document.getElementById("bat_window").style.display = "none";
}
</script>
<style>
#basic_info {
	border: 1px double gray;
	padding: 5px;
}

#ad {
	border: 1px double gray;
}

#basic_info p{
	padding: 5px 8px;
}
#tab2 div {
	margin: 20px;
}

.center_table tr td {
	text-align: center;
}
#bat_window{
		width: 400px;
		height:100px;
		padding: 20px;
		border: 2px solid #00b3dc;
		/*절대위치에 놓기 위해 absolute적용*/
		position: absolute;
		top:300px;
		left: 500px;
		text-align: center;
		background-color: #dedede;
		/*초기값을 보이지 않게 설정*/
		display: none;	
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Header 영역 -->
	<%@include file="include/header.jsp"%>
	<div id="contents">
	<div class="center_side">
		<ul class="nav nav-tabs nav-justified">
			<li id="t1" role="presentation"><a href="javascript:trans(1)">게임구매방법</a></li>
			<li id="t2" role="presentation" class="active"><a
				href="javascript:trans(2)">기본정보</a></li>
			<li id="t3" role="presentation"><a href="javascript:trans(3)">맞대결전적</a></li>
			<li id="t4" role="presentation"><a href="javascript:trans(4)">팀정보</a></li>
			<li id="t5" role="presentation"><a href="javascript:trans(5)">분석글</a></li>
		</ul>
	</div>
	<div class="fclear"></div>
	<div class="tab_cont" id="tab1">첫번째 tab</div>
	<div class="tab_cont show" id="tab2">
		<div id="basic_info">
			<p>발매기간 하루 전까지 발매</p>
			<p>발 표 일 경기개최 당일 적중결과 발표</p>
			<p>환급기간 선택한 모든 대상경기의 발표일 익일부터 1년간</p>
		</div>

		<div style="padding-top: 20px">
			<table class="panel panel-default center_table" style="width: 100%">
				<thead class="panel-heading">
					<tr>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#00F">회 차</font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#00F">경기시간 ▼<br />경기장소
						</font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#00F">홈 vs 원정</font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#00F">선발투수</font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#00F">상금(율)</font></td>
					</tr>
				</thead>
				<tbody class="panel-bod">
					<tr>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#000">${game.match_code }</font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#000">${game.match_year }-${game.match_month }-${game.match_day }<br />${game.homeName(game.home_code) }구장</font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="#000">${game.teamName(game.home_code) } vs
								${game.teamName(game.away_code) }</font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font
							color="blue">${game.home_pitcher } vs ${game.away_pitcher }</font></td>
						<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="red"> 2배 </font></td>
					</tr>
					<tr>
						<td colspan="5">
							<button id="getBat" onclick="javascript:showWin()">배팅하기</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	</div>
	<div class="tab_cont" id="tab3">첫번째 tab</div>
	<div class="tab_cont" id="tab4">첫번째 tab</div>
	<div class="tab_cont" id="tab5">첫번째 tab</div>
	</div>
	<div id="bat_window">
		<form action="buy.inc" id="f" name="f" method="post">
		 	<input type="radio" name="result"  value="${game.home_code }"/>승
		 	<input type="radio" name="result"  value="11"/>무
		 	<input type="radio" name="result" value="${game.away_code }"/>패
		 	<br/>
		 	<label for="coin">배팅코인: </label>
		 	<input type="text" id="coin" name="coin"/>
		 	<button id="go" onclick="javascript:info_send()">배팅하기</button>
			<input name="match_code" type="hidden" value="${game.match_code }"/>
			<input name="id" type="hidden" value="${vo.id }"/>
		</form>
	</div>
	<!-- Footer 영역 -->
	<%@include file="include/footer.jsp"%>
	
</body>
</html>