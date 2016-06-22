<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page
	import="java.util.List, mybatis.vo.FreeBoardVO, mybatis.vo.MemberVO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<!-- <link href="css/text.css" rel="stylesheet" type="text/css"> -->
<style type="text/css">

div#contents_sub {
	margin-left: 350px;
}

	.t1{width: 5%;text-align: center; height: 30px; border-right:1px solid #ccc;}
	.t2{width: 40%;text-align: center; height: 30px; border-right:1px solid #ccc;}
	.t3{width: 10%;text-align: center; height: 30px; border-right:1px solid #ccc;}
	.t4{width: 30px;text-align: center; height: 30px; border-right:1px solid #ccc;}
	.t5{width: 30px;text-align: center; height: 30px;}

#writebtn {
	margin-left: 780px;
}

#listTable{
		border:0;
		width:900px;
		height: 150px;
		margin-top: 20px;
}

/* #listTable tr td{
	border-right:1px solid #ccc;
} */

</style>
</head>
<body topmargin=0 leftmargin=0 marginwidth="0" marginheight="0">
	<!--주요내용시작 -->
	<div id="contents_sub">
		<form name="ff2">
			<table id="listTable">
				<tr>
					<td class="t1" style="background: #5D5D5D;"><font color="#FFFFFF">번호</font></td>
					<td class="t2" style="background: #5D5D5D;"><font color="#FFFFFF">제목</font></td>
					<td class="t3" style="background: #5D5D5D;"><font color="#FFFFFF">아이디</font></td>
					<td class="t4" style="background: #5D5D5D;"><font color="#FFFFFF">날짜</font></td>
					<td class="t5" style="background: #5D5D5D;"><font color="#FFFFFF">조회수</font></td>
				</tr>
				<c:forEach var="list" items="${list }" varStatus="stat">
					<tr>
						<td style="background: #DBDBDB; text-align: center;">
							${rowTotal-((nowPage-1)*blockList+stat.index) }
						</td>
						<td style="background: #DBDBDB;" style="text-align:center">
						
							<%-- step값만큼 들여쓰기하는 반복문 --%> 
							<c:forEach begin="1" end="${list.step }">
								<c:out value="&nbsp;&nbsp;" escapeXml="false" />
							</c:forEach> <%-- step이 0이 아닌 경우엔 화살표 이미지 출력 --%> 
							
							<c:if test="${list.step > 0 }">
								<img src="img/arrow.JPG" />
							</c:if> 
							
							<a id="title1" href="view.inc?seq=${list.seq }&nowPage=${nowPage}"> ${list.title }</a>
						</td>
						<td style="background: #DBDBDB; text-align: center;">${list.id }</td>
						<td style="background: #DBDBDB; text-align: center;">${list.regdate }</td>
						<td style="background: #DBDBDB; text-align: center;">${list.hit }</td>
					</tr>
				</c:forEach>
				<c:if test="${empty list }">
					<tr>
						<td style="background: #F2F7F9; text-align: center" colspan="5"
							height="70">등록된 게시물이 없습니다.</td>
					</tr>
				</c:if>
				<tr>
					<td height="20" valign="middle">
					<img src="/img/sub_it/point_line.gif" width="556" height="3"></td>
				</tr>
				<tr>
					<td width="315" align="left">${pageCode }</td>
					<td width="241" align="right">
					<c:if test="${vo != null }">
					<img src="img/but_write.gif" width="56" height="21" id="writebtn" style="cursor: pointer"
						onClick="javascript:location.href='writeForm.inc'"></td>
					</c:if>	
				</tr>
			</table>
			
		</form>
	</div>
	<!--주요내용끝 -->
</body>
</html>
