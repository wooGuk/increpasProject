<!-- 
	/*
	제 목 : list.jsp
	역 할 : list 페이지
	로 그 : 1. 자유게판(장준수 2016/06/23)
	*/
 -->
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

div#listdiv {
	margin-left: 340px;
	
	display: inline-block;
}

	.t1{width: 5px;  text-align: center; height: 35px; border-right:1px solid #ccc;}
	.t2{width: 50px;  text-align: center; height: 35px; border-right:1px solid #ccc;}
	.t3{width: 10px;  text-align: center; height: 35px; border-right:1px solid #ccc;}
	.t4{width: 30px;  text-align: center; height: 35px; border-right:1px solid #ccc;}
	.t5{width: 8px;  text-align: center; height: 35px;}



#listTable{	
		border:0;
		width:700px;
		height: 400px;
		margin-top: 40px;
}

#listTable thead tr{
	height:10px;
}	

#page{
	
	display: inline-block;
}


#write_btn{
	margin-top: 5px;
	margin-left: 522px;
	display: inline-block;
}

div#write_btn input[type=button]{
	display: inline;
		width: 68px;
		height: 27px;
		margin: 10px auto;
		font-size: 15px;
		font-weight: bold;
		border: 1px solid #dcdcdc;
		margin-left: 10px;
}
	.a1{
		background: #F6F6F6; 
		text-align: center; 
		border-right:1px solid #FFFFFF; 
		border-bottom:1px solid #FFFFFF;
		height: 25px;
}
</style>
</head>
<body>
	<!--주요내용시작 -->
	<div id="listdiv">
			<table id="listTable">
				<thead>
				<tr>
					<td class="t1" style="background: #5D5D5D; height: 35px; font-weight: bold;"><font color="#FFFFFF">번호</font></td>
					<td class="t2" style="background: #5D5D5D; height: 35px; font-weight: bold;"><font color="#FFFFFF">제목</font></td>
					<td class="t3" style="background: #5D5D5D; height: 35px; font-weight: bold;"><font color="#FFFFFF">아이디</font></td>
					<td class="t4" style="background: #5D5D5D; height: 35px; font-weight: bold;"><font color="#FFFFFF">날짜</font></td>
					<td class="t5" style="background: #5D5D5D; height: 35px; font-weight: bold;"><font color="#FFFFFF">조회수</font></td>
				</tr>
				</thead>
				<c:forEach var="list" items="${list }" varStatus="stat">
					<tr>
						<td class="a1">
							${rowTotal-((nowPage-1)*blockList+stat.index) }
						</td>
						<td class="a1">
							<%--  step값만큼 들여쓰기하는 반복문 
							<c:forEach begin="1" end="${list.step }">
								<c:out value="&nbsp;&nbsp;" escapeXml="false" />
							</c:forEach> step이 0이 아닌 경우엔 화살표 이미지 출력 
							
							<c:if test="${list.step > 0 }">
								<img src="img/arrow.JPG" />
							</c:if>  --%>
							
							<a href="view.inc?seq=${list.seq }&nowPage=${nowPage}">${list.title }
							<c:if test="${size != null }">
							 [${size.size()}]
							</c:if>
							</a>
						</td>
						<td class="a1">${list.id }</td>
						<td class="a1">${list.regdate }</td>
						<td class="a1">${list.hit }</td>
					</tr>
				</c:forEach>
				<c:if test="${empty list }">
					<tr>
						<td style="background: #DBDBDB; text-align: center" colspan="5"
							height="70">등록된 게시물이 없습니다.</td>
					</tr>
				</c:if>
			</table>
				<div id="page">${pageCode }</div>
				<div id="write_btn">
				<c:if test="${vo != null }">
					<input type="button" value="글쓰기" onclick="javascript:location.href='writeForm.inc'"/>
				</c:if>
				</div>
	</div>
	<!--주요내용끝 -->
</body>
</html>
