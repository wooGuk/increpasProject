
	
	
<!-- 	제 목 : search.jsp
	역 할 : 아이디비번찾는 페이지
	로 그 : 1.최초 개발(서버에 데이터들값 찾아지는거 확인) 
					( css수정중)
	(박상원 2016/06/14)
			
			 -->
	


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/basic.css">
<style>
	#search{
		border: 1px solid red;

		margin-left: 200px;
		margin-top: 50px;
	}
	
	#searchid{
		display: inline-block;
	}
	
	#searchpassword{
		display: inline-block;
		padding-left: 50px;
	} 
	
	#searchid input[type=text],#searchpassword input[type=text]{
		width: 200px;
		height: 20px;
	}
	
	#idsearh{
		display: inline-block;
		border: 1px solid red;
		padding-right: 300px;
		
	}
	
	#passwordserach{
		display: inline-block;
		border: 1px solid red;
	}
	#searchmove{
		display: inline-block;
		border: 1px solid red;
		margin-left: 600px;
	}
	#ph_tr{
		margin-top: 15px;
	}
	
</style>

<script type="text/javascript">
			
	function idSearch(){
		open("","pop","width=450,height=240,top=200,left=300");
		 document.form2.action = "idsearch.inc"; // 'search.inc' 를 form2이 실행될 action 으로 지정한다.
	     document.form2.target = "pop"; // 이 부분이 핵심! 열어놓은 빈 창(pop)을 form2가 날아갈 target으로 정한다.
	     document.form2.method = "post"; // search.inc에 submit할 방식을 post 방식으로 지정한다.
	     document.form2.submit(); // search.inc에 쏜다.
	}

	function pwdSearch(){
		open("","pop","width=450,height=240,top=200,left=300");
		 document.form3.action = "pwsearch.inc"; // 'search.inc' 를 form3이 실행될 action 으로 지정한다.
	     document.form3.target = "pop"; // 이 부분이 핵심! 열어놓은 빈 창(pop)을 form3가 날아갈 target으로 정한다.
	     document.form3.method = "post"; // search.inc에 submit할 방식을 post 방식으로 지정한다.
	     document.form3.submit(); // search.inc에 쏜다.
	}
	
</script>
</head>
<body>
	<div id="wrap">
	<!-- 하단영역시작 -->
		<jsp:include page="include/header.jsp"></jsp:include>
		
	<div id="search">
	<div id="searchid">
	<form id="form2" name="form2">
		<table>
<p><img src="img/idsearchtitle.PNG"></img></p>
	<p style="font-size: 16px; color: red; font-style: italic;">
	 
	아이디가 기억나지 않아 답답하셨나요?
	이름과 번호를 입력하시면, 찾을 수 있어요.</p>
	<br/><br/>
		<tr>
			<td>이 름:</td><td><input type="text" name="name" name="name" size="25" placeholder="이름을 입력하세요."/></td>
			
		</tr>
		
		<tr >
		 
			<td>전화번호:&nbsp;&nbsp;&nbsp;</td><td><input type="text" name="phone" name="phone" size="25" placeholder="번호를 입력해주세요."/></td>
		</tr>
		</table>
	</form>
	</div>
	
	<div id="searchpassword">
	<form id="form3" name="form3">
	<table>
	<p><img src="img/pwsearchtitle.PNG"></img></p>
	<p style="font-size: 16px; color: blue; font-style: italic;">
	 
	비밀번호가 기억나지 않아 답답하셨나요?
	아이디와 이름을 입력하시면, 찾을 수 있어요.</p>
	</br></br>
		<tr>
			<td>이름:</td><td><input type="text" name="name" name="name" size="25" placeholder="이름을 입력하세요."/></td>
		</tr>
		<tr>
			<td>아이디:</td><td><input type="text" name="id" name="id" size="25" placeholder="아이디를 입력해주세요."/></td>
		</tr>
		
	</table>	
	</form>
	</div>
	</div>
	
	<div id="searchmove">
	<form id="idsearh">
	<a href="javascript:idSearch();"><img src="img/idsearch.PNG"></img></a>
	</form>
	
	
	<form id="passwordserach" >
	<a href="javascript:pwdSearch();"><img src="img/pwsearch.PNG"></img></a>
	</form>
	</div>
	
	
		<jsp:include page="include/footer.jsp"></jsp:include>
		<!-- 하단영역종료 -->
	</div>
</body>
</html>