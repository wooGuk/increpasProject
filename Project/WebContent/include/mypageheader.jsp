<%@page import="mybatis.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
	
	제 목 : mypageheader.jps
	역 할 : 마이페이지 상단부
	로 그 : 1.프로그램 최초 생성 (장준수 2016/06/16)


 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

	div#aaa{
		margin-left: 200px;
		margin-right: 150px;
		margin-top: 30px;
		display: inline-block;
	}

	#bbb{
		border:0;
		width:500px;
		height: 150px;
		margin-top: 20px;
	}

	#bbb tbody tr td{
		font-size:9pt;
		color:green;	
		text-align: center;
		margin-top: 20px;
		}

	#bbb thead tr th{
		font-size:9pt;
		font-weight:bold;
		color:black; 
		background-color:#A3D4F7;
		text-align: center;
		
	}

	.t1{width:30%}
	.t2{width:30%}
	.t3{width:70%}
	.t4{width:20%}
	
	.fff{
		font-size: 19px;
	}
	
	
	
	/* 회원관리 */
	div .left_side{
		display:inline-block;
		padding-left: 200px;
		margin-bottom: 100px;
	}
	
	#left_info{
		border:0;
		width:100px;
		height: 100px;
				
	}

	#left_info tbody tr td{
		font-size:12pt;
		color:green;
		text-align: center;
		font-weight: bold;
		background-color: #D8D8D8;
		}

	#left_info thead tr th{
		font-size:12pt;
		font-weight:bold;
		color:black; 
		background-color:#AEAEAE;
		text-align: center;
		
	}
	
	.hh{
		padding-bottom: 10px;
		padding: 5px;
	} 
	
</style>
 <script type="text/javascript">

	function charge(evt){
		
		var number = /[^0-9]/; //숫자만 허용
		
		var coin = document.c.coin.value; 
		var coin = document.getElementById("coincheck");
		var usercoin = document.c.usercoin.value;
		var id = document.c.id1.value;
		var name = document.c.name.value;
		var password = document.c.password.value;
		
		 if ( document.c.coin.value.search(number)!=-1 || document.c.coin.value.length == 0 ){
		        alert("숫자만 입력하실 수 있습니다!");
		        document.c.coin.focus();
		        return;
		   }else{
		
		alert("충전완료!!");
		document.c.submit();
	   }
	}
	
	function memdel(){
		var isDel = confirm("정말로 탈퇴하시겠습니까?");
		  if(isDel){
			  f.action = "memdel.inc";
			  f.method = "post";
			  f.submit();
		  }
		  else{
		   return;
		  }
		 }
</script> 
</head>
<body>

	<c:if test="${vo != null }">
		<div id="header">
			<h1 class="fl">
				<a href="main.inc"><img alt="logo" src="img/logo.png"></a>
			</h1>
			<div class="fr">
				<form id="mypaheform">
					<table id="mypagetable">
						<caption>MY 테이블</caption>
						<tbody>
							<tr>
								<td colspan="2"><b>${vo.id }</b>님의 MYPAGE</td>
								<td rowspan="2"><a href="logout.inc"><img alt="로그아웃" src="img/logout.png" title="로그아웃"></a></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>

			<ul class="gnb">
				<li><a href=""><span class="menu m01">공지사항</span></a></li>
				<li><a href="todaylist.inc"><span class="menu m02">경기구매</span></a></li>
				<li><a href=""><span class="menu m03">경기정보</span></a></li>
				<li><a href="mypage.inc"><span class="menu m04">마이페이지</span></a></li>
				<li><a href="freeBoard.inc"><span class="menu m05">자유게시판</span></a></li>
			</ul>
		</div>
		
		<!-- 컨텐츠 영역 -->
		<div id="mmm">
			<form action="charge.inc" method="post" id="c" name="c">
				${vo.id }님의 잔액 : <input type="text" id="usercoin" name="usercoin" 
											value="<c:out value="${vo.coin }"/>" readonly />
				<label for="coin">코인충전 :</label>
				<input type="text" id="coin" name="coin" value="0" />
				<input type="button" value="충전" onclick="charge()" />
				<input type="hidden"id="id1" name="id" value="<c:out value="${vo.id }"/>" />
				<input type="hidden" id="password" name="password" value="<c:out value="${vo.password }"/>" />
				<input type="hidden" id="name" name="name" value="<c:out value="${vo.name }"/>" />
			</form>
		
		</div>
		
		<!-- 회원관리 폼 -->
		<div class="left_side">
	<table id="left_info">
		<thead>
			<tr>
				<th class="hh">회원관리</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="hh"><a href="memedit.inc">회원수정</a></td>
			</tr>	
			<tr>
				<td class="hh"><a onclick="memdel()" style="cursor:pointer">회원탈퇴</a></td>
			</tr>
		</tbody>
	</table>
	</div>
	
	
		<div id="aaa">
			<table id="bbb">
				<thead>
					<tr align="center">
						<th class="t1">경기날짜</th>
						<th class="t2">경기시간</th>
						<th class="t3">HOME팀 VS AWAY팀</th>
						<th class="t4">베당율</th>
					</tr>
					<tr>
						<td class="line" colspan="4"></td>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
						<td>2016/06/15</td>
						<td>22:00</td>
						<td>리버풀 : 리버풀2군</td>
						<td>3.11 : 7.12</td>
					</tr>

					<tr>
						<td>2016/06/15</td>
						<td>22:00</td>
						<td>리버풀 : 리버풀2군</td>
						<td>3.11 : 7.12</td>
					</tr>

					<tr>
						<td>2016/06/15</td>
						<td>22:00</td>
						<td>리버풀 : 리버풀2군</td>
						<td>3.11 : 7.12</td>
					</tr>

					<tr>
						<td colspan="4" class="line"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</c:if>

</body>
</html>
