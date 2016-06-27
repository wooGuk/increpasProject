
	
	
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
<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
<style>
	
	p{
		margin-top: 50px;
		font-size:  40px;
		text-align: center;
	
	}
	
	div#asd{
		/* display:inline-block;
		margin-left:auto;
		margin-right:auto;
		vertical-align: middle; */
		width:1500px;
		height:1000px;
		margin-top: 20px;
		border: 1px solid red;

		display: table-cell;
	}
	
	#form2{
		width:500px;
		height:50px;
		border: 3px solid black;
		  display:table-cell;  
		padding-bottom: 100px;
		text-align: center;
	}
	
	#form3{
		width:500px;
		height:50px;
		border: 3px solid black;
		  display:table-cell; 
		padding-bottom: 100px;
		margin-right:100px;
		text-align: center;
		
	}
	
	
	#form1,#form4{
		
		display:inline;
		
	}
	
	#form4{
		margin-left: 200px;
	}
	
	label{
		font-size: 20px;
	}
	
	input{
		margin-left: 20px;
	}
	
	a{
	margin-left: 200px;
		font-size: 30px;
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

	<p style="font-style: oblique;">아이디 / 패스워드 찾기</p>
	<div id=asd>
	
	<form id="form2" name="form2">
	<p><img src="img/idsearchtitle.PNG"></img></p>
	<p style="font-size: 16px; color: red; font-style: italic;">
	 
	아이디가 기억나지 않아 답답하셨나요?
	이름과 번호를 입력하시면, 찾을 수 있어요.</p>
	</br></br>
		<label for="name">이 름:</label>&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" name="name" name="name" size="25" placeholder="이름을 입력하세요."/>
		<br/>
		<label for="phone">폰번호:</label>
		<input type="text" name="phone" name="phone" size="25" placeholder="번호를 입력해주세요."/>
	</form>
	
	<form id="form3" name="form3">
	<p><img src="img/pwsearchtitle.PNG"></img></p>
	<p style="font-size: 16px; color: blue; font-style: italic;">
	 
	비밀번호가 기억나지 않아 답답하셨나요?
	아이디와 이름을 입력하시면, 찾을 수 있어요.</p>
	</br></br>
		<label for="id">아이디:</label>
		<input type="text" name="id" name="id" size="25" placeholder="아이디를 입력해주세요."/>
		<br/>
		<label for="id">이름:</label>
		<input type="text" name="name" name="name" size="25" placeholder="이름을 입력해주세요."/>
	</form>
	
	
	<form id="form1">
	<a href="javascript:idSearch();"><img src="img/idsearch.PNG"></img></a>
	</form>
	
	
	<form id="form4" >
	<a href="javascript:pwdSearch();"><img src="img/pwsearch.PNG"></img></a>
	</form>
	
	
	</div>
	<div id="wrap">
	<!-- 하단영역시작 -->
		<jsp:include page="include/footer.jsp"></jsp:include>
		<!-- 하단영역종료 -->
		</div>
</body>
</html>