<!-- 
	제 목 : detailGame.jsp
	역 할 : 상세보기 뷰 
	로 그 : 1.프로그램 최초 생성, tab 레이아웃 구현 오우석(2016/06/16)
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="css/basic.css">
<title>Insert title here</title>
<style type="text/css">
.fl{
	width: 100%;
}
</style>
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