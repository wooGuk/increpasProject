<!-- 
	제 목 : detailGame.jsp
	역 할 : 상세보기 뷰 
	로 그 : 1.프로그램 최초 생성, tab 레이아웃 구현 오우석(2016/06/16)
			2.나머지 tab을  위한 style추가 오우석(2016/06/29)
			3.callplay, res2메소드 추가(AJAX활용), 선수 P_IDX값 넘기기, 선수정보 테이블 레이아웃변경 오우석(2016/07/06)
 -->
<%@page import="mybatis.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="css/basic.css">
<%
	MemberVO vo = (MemberVO)session.getAttribute("vo");
%>
<title>Insert title here</title>
<style type="text/css">
.fl{
	width: 100%;
}
</style>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript">

	function trans(temp) {
		// id가 tab1,tab2,tab3 모두를 검색한다.
		var tab1 = document.getElementById("tab1");
		var tab2 = document.getElementById("tab2");
		var tab3 = document.getElementById("tab3");
		var tab4 = document.getElementById("tab4");
		var t1 = document.getElementById("ta1");
		var t2 = document.getElementById("ta2");
		var t3 = document.getElementById("ta3");
		var t4 = document.getElementById("ta4");
		
		//검색된 tab1,tab2,tab3 모두를 클래스
		if (temp == 1) {
			tab1.className = "tab_cont show";
			tab2.className = "tab_cont";
			tab3.className = "tab_cont";
			tab4.className = "tab_cont";
			t1.className = "active";
			t2.className = "";
			t3.className = "";
			t4.className = "";
		} else if (temp == 2) {
			tab1.className = "tab_cont";
			tab2.className = "tab_cont show";
			tab3.className = "tab_cont";
			tab4.className = "tab_cont";
			t1.className = "";
			t2.className = "active";
			t3.className = "";
			t4.className = "";
		} else if (temp == 3) {
			tab1.className = "tab_cont";
			tab2.className = "tab_cont";
			tab3.className = "tab_cont show";
			tab4.className = "tab_cont";
			t1.className = "";
			t2.className = "";
			t3.className = "active";
			t4.className = "";
		} else if (temp == 4) {
			tab1.className = "tab_cont";
			tab2.className = "tab_cont";
			tab3.className = "tab_cont";
			tab4.className = "tab_cont show";
			t1.className = "";
			t2.className = "";
			t3.className = "";
			t4.className = "active";
		}
	}
	//Ajax활용을 위한 선수불러오기메소드 추가 오우석(2016/07/05)
	function callPlayer(p_idx){
		var index = p_idx;
		var param = "index="+index;
		sendRequest("viewPlayerInfo.inc", param, res2, "post", true);
	}
	//Ajax callback시 호출되는 함수 오우석(2016/07/05)
	function res2() {
		if(xhr.readyState==4 && xhr.status==200){
			//현재문서에서 아이디가 view인
			//객체를 검색한다.
			var v =document.getElementById("player_intro");
			v.innerHTML = xhr.responseText;
		}
	}
</script>
</head>
<body>
	<!-- Header 영역 -->
	<%@include file="include/header.jsp"%>
	<!-- 컨텐츠 영억 -->
	<div id="contents">
		<!-- tab 레이아웃 구현 오우석(2016/06/16) -->
		<%@include file="include/tab.jsp"%>	
	</div>
	<!-- Footer 영역 -->
	<%@include file="include/footer.jsp"%>
</body>
</html>