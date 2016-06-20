<!-- 
	
	제 목 : join.jps
	역 할 : 회원가입
	로 그 : 1.프로그램 최초 생성 (장준수 2016/06/08)
	
		 
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/basic.css"/>
<style type="text/css">
	label#box{
		display: inline-block;
		font-size: 11px;
		font-weight: bold;
	}
	
	.success{
		color: #00f;
	}
	
	.fail{
		color: #f00;
	}
	
	
	
	div#contents_sub1{
		width: 900px;
		height: auto;
		margin: auto;
		padding-top: 30px;
	}
	
	.btn_center{
		text-align: center;
		margin: 30px;
	}



	.b_agree{
		width: 117px;
		height: 27px;
	
	}

	.b_noagree{
		width: 117px;
		height: 27px;
	
	}


	.btn1{
	
		display: inline-block;
		background: url("img/a.PNG");
		text-indent: -9999px;
	}

	.btn2{
		
		display: inline-block;
		background: url("img/b.PNG");
		text-indent: -9999px;
	}
	
	 /* .btn{
		display: inline-block;
		background: url("../img/btn.png") no-repeat;
		text-indent: -9999px;
	} 
	 */
	.btn a{
		display: block;
		width: 100%;
		height: 100%;
	} 
	h1.title01{
	height: 30px;
	background-position: 0 0;
	
	}
	
	p.title_src{
	font-size: 15px;
	font-weight: bold;
	color: #222;
	padding-top: 10px;
	padding-left: 5px;
	padding-bottom: 40px;
}
	


</style>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
	function reg(){
		/* var id = document.getElementById("id").value.trim();
		var pwd = document.getElementById("pwd").value.trim();
		var pwd2 = document.getElementById("pwd2").value.trim();
		var phone = document.getElementById("phone").value.trim();
		var name = document.getElementById("name").value.trim();
		var address = document.getElementById("address").value.trim(); */
		
		/* alert("가입을 축하합니다.")
		document.forms[0].submit(); */
	/* 	}else{
			alert("하나도 빠짐없이 기입하셔야 합니다.");
		}*/
		
		if(document.getElementById("name").value.trim() == ""){
			alert("이름를 입력하세요.");
			return;
		}else if(document.getElementById("id").value.trim() == ""){
			alert("아이디를 입력하세요.");
			return;
		}else if(document.getElementById("password").value.trim() == ""){
			alert("비밀번호를 입력하세요.");
			return;
		}else if(document.getElementById("phone").value.trim() == ""){
			alert("핸드폰번호를 입력하세요.");
			return;
		}else if(document.getElementById("address").value.trim() == ""){
			alert("주소를 입력하세요.");
			return;
		}else if(document.getElementById("password").value.trim() != document.getElementById("password2").value.trim()){
			alert("비밀번호가 서로 다름니다.");
			return;
		}else
			document.forms[0].submit();
		
	} 
	
	// 비밀번호, 비밀번호확인 20116/06/10 장준수 
	$(function(){
		  $('#password').keyup(function(){
		   $('font[name=check]').text('');
		  }); 

		  $('#password2').keyup(function(){
		   if($('#password').val()!=$('#password2').val()){
		    $('font[name=check]').text('');
		    $('font[name=check]').css("color","red");
		    $('font[name=check]').html("비밀번호가 다름니다.");
		   }else{
		    $('font[name=check]').text('');
		    $('font[name=check]').css("color","blue");
		    $('font[name=check]').html("비밀번호가 맞습니다.");
		   }
		  }); 
		 });
	
	
	// 2016/06/13 이름
	function idcheck(){
		
		var s_id = document.getElementById("id").value;
		//alert(s_id);
		
		if(s_id.length >= 1){
			// 파라미터 작업
			var param = "id="+encodeURIComponent(s_id);
			
			// 서버요청
			sendRequest("idCheck.inc", param, res, "post", true);
		}else
			document.getElementById("box").innerHTML = "";
		
	}
	
	function res(){
		
		if(xhr.readyState == 4 && xhr.status == 200){			
			var v = document.getElementById("box");
			v.innerHTML = xhr.responseText;
			
		}	
	}
	
</script>
</head>
<body>
	<div id="wrap">
		<!-- 상단영역 -->
		<div id="header">
			<!-- 상단 좌측 로고, 클릭 시 main페이지로 이동  -->
			<h1 class="fl"><a href="main.inc"><img alt="logo" src="img/logo.png"></a></h1>
		
			
			<ul class="gnb">
				<li><a href=""><span class="menu m01">공지사항</span></a></li>
				<li><a href="todaylist.inc"><span class="menu m02">경기구매</span></a></li>
				<li><a href=""><span class="menu m03">경기정보</span></a></li>
				<li><a href="mypageCheck.inc"><span class="menu m04">마이페이지</span></a></li>
				<li><a href=""><span class="menu m05">자유게시판</span></a></li>
			</ul>
		</div>
		<!-- 상단영역 끝 -->
		
		<!-- 콘텐츠영역 -->
		<div id="contents_sub1">
			<h1 class="sub_title title01"></h1>
			<p class="title_src">스포츠 토토 회원가입</p>
			 <p class="guide_txt">
				기본회원정보를 입력해 주세요 <span class="fr guide_txt"> <span class="req"></span>
					필수입력사항
				</span>
			</p> 
			<br />
		<form method="post" action="reg_ok.inc">
			<table class="table_type01" style="width: 900px">
				<colgroup>
					<col width="130px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th><span class="req"></span>이름</th>
						<td>
							<p class="guide_txt">이름을 입력해 주세요.</p>
							<p>
								<label for="name" class="hidden">이름</label> <input type="text"
									name="name" id="name" class="join" />
							</p>
						</td>
					</tr>
					<tr>
						<th><span class="req"></span> 아이디</th>
						<td>
							<p class="guide_txt">6~12자리의 영문, 숫자(혼용가능)를 입력해 주세요.</p>
							<!-- <p class="n"> -->
								
								 <label for="id" class="hidden">아이디</label>
								 <input type="text" name="id" id="id" class="join" onkeyup="idcheck()"/>
								 <label id="box"></label>
								
								
								  <!-- <span class="btn b_bdcheck">
									<a onclick="idcheck()" style="cursor:pointer">중복확인</a>
									중복확인 수정 장준수2016/06/09
								</span> -->
						<!-- 	</p> -->
						</td>
					</tr>

					<tr>
						<th><span class="req"></span>비밀번호</th>
						<td>
							<p class="guide_txt">안전을 위해 10개 이상의 문자조합(영문 대소문자 + 숫자 또는
								기호(!, ~ , @ , #))를 입력해주세요.</p>
							<p>
								<label for="password" class="hidden">비밀번호</label> <input
									type="password" name="password" id="password" class="join" />
							</p>
						</td>
					</tr>

					<tr>
						<th><span class="req"></span>비밀번호 확인</th>
						<td>
							<p class="guide_txt">입력하신 비밀번호 확인을 위해 다시한번 입력해주세요.</p>
							<p>
								<label for="password2" class="hidden">비밀번호 확인</label> 
								<input type="password" name="password2" id="password2" class="join" />
									<font name="check" size="2" color="blue"></font>
							</p>
						</td>
					</tr>

					<tr>
						<th><span class="req"></span>주소</th>
						<td>
							<p class="guide_txt">주소를 입력해 주세요.</p>
							<p>
								<label for="address" class="hidden">주소</label> <input type="text"
									name="address" id="address" class="join" style="width: 350px;" />
							</p>
						</td>
					</tr>

					<tr>
						<th><span class="req"></span>전화번호</th>
						<td>
							<p class="guide_txt">전화번호을 입력해 주세요.</p>
							<p>
								<label for="phone" class="hidden">전화번호</label> <input
									type="text" name="phone" id="phone" class="join"
									style="width: 150px;" />
							</p>
						</td>
					</tr>
				</tbody>
			
			</table>
			<div class="btn_center">
					<p class="btn1 b_agree btn"><a onclick="reg()" style="cursor:pointer">가입하기</a></p>	
					<p class="btn2 b_noagree btn"><a onclick="javascript:location.href='main.inc'" style="cursor:pointer">취소</a></p>
			</div>
			</form>
		</div>
		<!-- 콘텐츠영역 끝 -->
		<!-- 하단영역 -->
		<div id="footer">
			<div class="footer_area">
				<ul class="foot_guide">
					<li><a href="">개인정보취급방침</a></li>
					<li><a href="">웹회원 이용약관</a></li>
					<li><a href="">책임한계와 법적고지</a></li>
					<li><a href="">이메일 무단수집 거부</a></li>
				</ul>
				<address>adsasd</address>
				<p class="copyright">asdasdas</p>
			</div>
		</div>
		<!-- 하단영역 끝 -->
	</div>
	
	<!-- <form name="f">
		<input type="hidden" id="s_id" name="ss" onkeyup="idcheck()"/>
	</form> -->

</body>
</html>