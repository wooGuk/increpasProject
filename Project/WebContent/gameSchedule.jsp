<!-- 

	/*
	제 목 : gameSchedule.jsp
	역 할 : 모든 게임 일정 불러오기
	로 그 : 1.최초 개발(레이아웃까지 잡음)(데이터테스트 필요함) (오우석 2016/06/13)
			2.왼쪽 탭 링크연결 (오우석 2016/06/13)
			3.파라미터 네임 오류로 인한 변경 list - > games (오우석 2016.06/13)
	*/
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/basic.css">
<style type="text/css">
div .left_side{
	
	display:inline-block;
	border: 1px solid black;
}
div .center_side{
	
	display:inline-block;
	border: 1px solid red;
}

</style>

</head>
<body>
	<!-- Header 영역 -->
	<%@include file="include/header.jsp"%>
	
	<!-- 컨텐츠 영억 -->
	<div id="contents">
		<div class="fl">
			<%@include file="include/lefter.jsp" %>
			
			<div class="center_side">
				<table id="center_info">
					<thead>
						<tr>
							<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="#FFFFFF">게임명</font></td>
							<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="#FFFFFF">게임일정</font></td>
							<td height="20" align="center" bgcolor="#669AB3" width="56"><font color="#FFFFFF">상태</font></td>
						</tr>
					</thead>
					<tbody>
						<!-- 여기를 반복문으로 돌려야 됨 -->
							<!-- 파라미터 네임 오류로 인한 변경 오우석(2016.06/13) -->
							<c:forEach var="vo" items="${games }" varStatus="stat">
							<tr>
							
								<td>프로야구</td>
								<td>${vo.day}</td>
								<td> 마감/안마감</td>
								   
							</tr>
							</c:forEach>
							<!-- 파라미터 네임 오류로 인한 변경 오우석(2016.06/13) -->
							<c:if test="${empty games }">
								<tr>
									<td bgcolor="#F2F7F9" colspan="5" height="70" align="center">등록된
										게시물이 없습니다.</td>
								</tr>
							</c:if>
					</tbody>
				</table>	
			</div>
			<div>
				<table width="556" border="0" cellspacing="0" cellpadding="0">
					<tr>
					  <td width="315" align="left">
                          ${pageCode }
					  </td>
					 </tr>
				</table>
			</div>
		</div>
	</div>
	
	<!-- Footer 영역 -->
	<%@include file="include/footer.jsp"%>

</body>
</html>