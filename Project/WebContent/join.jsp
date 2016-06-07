<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/sub02.css"/>
<style type="text/css">

	[type=button]{
		width: 50px;
	}
</style>
<script type="text/javascript">

	function reg(){
	 	/* var id = document.getElementById("s_id").value.trim();
		var pw = document.getElementById("s_pw").value.trim();
		var name = document.getElementById("s_name").value.trim();
		var address = document.getElementById("s_add").value.trim();
		var phone = document.getElementById("s_phone").value.trim(); */
	
		
		document.forms[0].submit();
	}
	

</script>
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<!-- 상단영역 -->
		<div id="header">
			<h1>인크레파스 토토</h1>
			<ul class="gnb">
				<li><a href=""><span class="menu m01">게임구매</span></a></li>
				<li><a href=""><span class="menu m02">경기정보</span></a></li>
				<li><a href=""><span class="menu m03">마이페이지</span></a></li>
				<li><a href=""><span class="menu m04">?</span></a></li>
				<li><a href=""><span class="menu m05">?</span></a></li>
			</ul>
		</div>
		<!-- 상단영역 끝 -->
		<!-- 콘텐츠영역 -->
		<div id="contents_sub">
			<h1 class="sub_title title01">스포츠 토토</h1>
			<p class="title_src">스포츠 토토</p>
			<p class="guide_txt">
				기본회원정보를 입력해 주세요 <span class="fr guide_txt"> <span class="req"></span>
					필수입력사항
				</span>
			</p>
			<br />
			<form action="reg_ok.inc" method="post">
			<input type="hidden" id="reg_ok" name="reg_ok" />
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
								<label for="s_name" class="hidden">이름</label> <input type="text"
									name="s_name" id="s_name" class="join" />
							</p>
						</td>
					</tr>
					<tr>
						<th><span class="req"></span> 아이디</th>
						<td>
							<p class="guide_txt">6~12자리의 영문, 숫자(혼용가능)를 입력해 주세요.</p>
							<p>
								<label for="s_id" class="hidden">아이디</label>
								 <input type="text" name="s_id" id="s_id" class="join" />
								  <span class="btn b_bdcheck">
									<a href="javascript:location.href=">중복확인</a>
								</span>
							</p>
						</td>
					</tr>

					<tr>
						<th><span class="req"></span>비밀번호</th>
						<td>
							<p class="guide_txt">안전을 위해 10개 이상의 문자조합(영문 대소문자 + 숫자 또는
								기호(!, ~ , @ , #))를 입력해주세요.</p>
							<p>
								<label for="s_pw" class="hidden">비밀번호</label> <input
									type="password" name="s_pw" id="s_pw" class="join" />
							</p>
						</td>
					</tr>

					<tr>
						<th><span class="req"></span>비밀번호 확인</th>
						<td>
							<p class="guide_txt">입력하신 비밀번호 확인을 위해 다시한번 입력해주세요.</p>
							<p>
								<label for="s_pw2" class="hidden">비밀번호 확인</label> <input
									type="password" name="s_pw2" id="s_pw2" class="join" />
							</p>
						</td>
					</tr>

					<tr>
						<th><span class="req"></span>주소</th>
						<td>
							<p class="guide_txt">주소를 입력해 주세요.</p>
							<p>
								<label for="s_address" class="hidden">주소</label> <input type="text"
									name="s_address" id="s_address" class="join" style="width: 350px;" />
							</p>
						</td>
					</tr>

					<tr>
						<th><span class="req"></span>전화번호</th>
						<td>
							<p class="guide_txt">전화번호을 입력해 주세요.</p>
							<p>
								<label for="s_phone" class="hidden">전화번호</label> <input
									type="text" name="s_phone" id="s_phone" class="join"
									style="width: 150px;" />
							</p>
						</td>
					</tr>
				</tbody>
			</table>
			</form>
			<br/>
			<br/>
			<div class="btn_center">
					<p class="btn1 b_agree btn"><a onclick="reg()" style="cursor:pointer">가입하기</a></p>	
					<p class="btn2 b_noagree btn"><a href="dd" >취소</a></p>
			</div>
			

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
</body>
</html>