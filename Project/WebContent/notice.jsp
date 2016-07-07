
	 
<!-- 		제 목 : Notice.jsp
		역 할 : 메인베너에서 공지사항 클릭시 보여지는 화면
		로 그 :  1.프로그램 최초 생성 (박상원 2016/06/22)
			 2.css수정 (박상원 06/29)
			 
			   -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항-프로야구 토토 승무패 페이지</title>
  <link type="text/css" rel="stylesheet" href="css/basic.css">  
  <link type="text/css" rel="stylesheet" href="css/text.css">    
</head>
<body>
	  <div id="wrap">
		<jsp:include page="include/header.jsp"></jsp:include>
		 <br/><br/>
		
		<jsp:include page="include/noticelist.jsp"></jsp:include>
		
	</div>	 
		
	

</body>
</html>
