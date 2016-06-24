<!-- 
	/*
	제 목 : memEdit.jsp
	역 할 : 회원수정
	로 그 : 1. 회원정보 수정(장준수 2016/06/20)
	*/
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/basic.css"/>

<title>Insert title here</title>
<style type="text/css">


	/*  회원수정 css */
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


	.b_agre{
		width: 70px;
		height: 26px;
	
	}

	.b_noagre{
		width: 70px;
		height: 26px;
	
	}

	.btn1{
	
		display: inline-block;
		background: url("img/edit.PNG");
		text-indent: -9999px;
	}

	.btn2{
		
		display: inline-block;
		background: url("img/back.PNG");
		text-indent: -9999px;
	}
	
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
<script>

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
	
	function edit(){
		
		if(document.getElementById("password").value.trim() == ""){
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
		
	
</script>
</head>
<body>
	<div id="wrap">
	<jsp:include page="include/header.jsp"></jsp:include>
		
		<div id="contents_sub1">
			<h1 class="sub_title title01"></h1>
			<p class="title_src">회 원 수 정</p>
			 <p class="guide_txt">
				<span class="fr guide_txt"> <span class="req"></span>
					필수입력사항
				</span>
			</p> 
			<br />
		<form method="post" action="memedit.inc">
			<table class="table_type01" style="width: 900px">
				<colgroup>
					<col width="130px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>이름</th>
						<td>
							<label for="name" class="hidden">이름</label>
							${vo.name }
						</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>
							<label for="id" class="hidden">아이디</label>
							${vo.id }
								
						</td>
					</tr>

					<tr>
						<th><span class="req"></span>비밀번호</th>
						<td>
							<p class="guide_txt">비밀번호를 입력해 주세요.</p>
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
									name="address" id="address" class="join" value="${vo.address }" style="width: 350px;" />
							</p>
						</td>
					</tr>

					<tr>
						<th><span class="req"></span>전화번호</th>
						<td>
							<p class="guide_txt">전화번호을 입력해 주세요.</p>
							<p>
								<label for="phone" class="hidden">전화번호</label> <input
									type="text" name="phone" id="phone" value="${vo.phone }" class="join"
									style="width: 150px;" />
							</p>
						</td>
					</tr>
				</tbody>
			
			</table>
			<div class="btn_center">
					<p class="btn1 b_agre btn"><a onclick="edit()" style="cursor:pointer">회원수정</a></p>	
					<p class="btn2 b_noagre btn"><a onclick="javascript:location.href='main.inc'" style="cursor:pointer">취소</a></p>
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
	
	</div>
</body>
</html>