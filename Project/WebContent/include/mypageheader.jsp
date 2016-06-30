<%@page import="mybatis.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
	
	제 목 : mypageheader.jps
	역 할 : 마이페이지 상단부
	로 그 : 1.프로그램 최초 생성 (장준수 2016/06/16)
		  2. 122번째줄 팝업창 함수 추가하여 delmember.jsp 로 이동하는 소스 추가
		  3.마이페이지 링크 수정(mypage.inc -> mypageCheck.inc) (정성훈 2016.06.28)
		  3. 마이페이지 css 대대적으로 수정 (장준수 2016/06/30)
		  

 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
		open("","pop","width=450,height=240,top=200,left=300");
		 document.delform.action = "delmember.jsp"; // 클릭시 이동하는 페이지 
	     document.delform.target = "pop"; // 이 부분이 핵심! 열어놓은 빈 창(pop)을 form2가 날아갈 target으로 정한다.
	     document.delform.method = "post"; // post방식으로 보내기~!
	     document.delform.submit(); // 
	}
	
	function batcancel(code,id,coin){
		document.getElementById("pk").value = code;
		document.getElementById("id").value = id;
		document.getElementById("batcoin").value = coin;
		
	
		 var isDel = confirm("정말로 취소하시겠습니까?");
		  if(isDel){
			  document.getElementById("f").submit();
		   //f.submit();
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
				<li><a href="notice.inc"><span class="menu m01">공지사항</span></a></li>
				<li><a href="todaylist.inc"><span class="menu m02">경기구매</span></a></li>
				<li><a href="gameInfo.inc"><span class="menu m03">경기정보</span></a></li>
				<li><a href="mypageCheck.inc"><span class="menu m04">마이페이지</span></a></li>
				<li><a href="freeBoard.inc"><span class="menu m05">자유게시판</span></a></li>
			</ul>
		</div>
		
		<!-- 컨텐츠 영역 -->
		<div id="charge">
			<form action="charge.inc" method="post" id="c" name="c">
			<table id="chargetable">
				<tr>
					<td id="user">${vo.id } 님의 잔액 : </td><td id="user"><input type="text" id="usercoin" name="usercoin" 
										value="<c:out value="${vo.coin }"/>" readonly /></td>
					<td id="coin">코인충전 : </td><td id="coin"><input type="text" id="coin" name="coin" value="0" /></td>		
					<td><input type="button" value="충전" onclick="charge()" style="cursor:pointer"/></td>
				</tr>
			</table>	
				<input type="hidden"id="id1" name="id" value="<c:out value="${vo.id }"/>" />
				<input type="hidden" id="password" name="password" value="<c:out value="${vo.password }"/>" />
				<input type="hidden" id="name" name="name" value="<c:out value="${vo.name }"/>" />
			</form>
		</div>
		

		<!-- 회원관리 폼 -->
		 <div id="mem_left">
			<table id="mem_info">
				<thead>
					<tr>
						<th id="user_edit"> 회 원 관 리 </th>
					</tr>
					</thead>
				<tbody>
					<tr>
						<td id="edituser"><a href="memedit.inc"> 회 원 수 정 > </a></td>
					</tr>
					<tr>
						<td id="edituser"><a href="javascript:memdel()"> 회 원 탈 퇴 > </a></td>
					</tr>
				</tbody>
			</table>
		</div>
		 
		
		
		<div id="buy">
			<table id="buytable">
				<thead>
					<tr align="center">
						<td id="t1" style="background: #5D5D5D; height: 40px; font-weight: bold;"><font color="#FFFFFF">아이디</font></td>
						<td id="t2" style="background: #5D5D5D; height: 40px; font-weight: bold;"><font color="#FFFFFF">회차</font></td>
						<td id="t3" style="background: #5D5D5D; height: 40px; font-weight: bold;"><font color="#FFFFFF">예상결과 팀</font></td>
						<td id="t4" style="background: #5D5D5D; height: 40px; font-weight: bold;"><font color="#FFFFFF">실제결과 팀</font></td>
						<td id="t5" style="background: #5D5D5D; height: 40px; font-weight: bold;"><font color="#FFFFFF">베팅금액</font></td>
						<td id="t6" style="background: #5D5D5D; height: 40px; font-weight: bold;"><font color="#FFFFFF">수령금액</font></td>
						<td id="t7" style="background: #5D5D5D; height: 40px; font-weight: bold;"><font color="#FFFFFF">구매취소</font></td>
					</tr>
				</thead>
				<tbody>
				
			
				<c:forEach var="list" items="${batlist }" varStatus="stat">
					<tr align="center">
					 	<td id="bat">${list.id}</td>
						<td id="bat" >${list.match_code }</td>
						<td id="bat">${list.teamName(list.re_result) }</td>
						<td id="bat">${list.teamName(list.ac_result) }</td>
						<td id="bat">${list.bat_cost }</td> 
						<td id="bat">${list.bat_avg }</td>
						<c:if test="${list.bat_avg != null }">
						<td id="bat"></td>
						</c:if>
						<c:if test="${list.bat_avg == null }">
						<td id="bat"><input type="button" value="취소" onclick="batcancel(${list.bat_code},'${list.id }', ${list.bat_cost })"/></td>
						</c:if>
					</tr>
						
						
					</c:forEach>
					<form action="batcancel.inc" method="post" id="f">
						<input type="hidden" name="pk" id="pk"/>
						<input type="hidden" name="id" id="id"/>
						<input type="hidden" name="batcoin" id="batcoin"/>
					</form>
					<c:if test="${batlist == null}">
					<tr>
						<td style="background: #DBDBDB; text-align: center" colspan="7"
							height="70">구매하신 베팅이 없습니다.</td>
					</tr>
					</c:if>
				</tbody>
				
			</table>
			
			<div id="boardmove">
			<!-- 페이징기법 추가 (장준수 2016/06/29) -->
			<div id="page">${pageCode }</div>
			</div>
			
		</div>
	</c:if>
		
</body>
</html>
