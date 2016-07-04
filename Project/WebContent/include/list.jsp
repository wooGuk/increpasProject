<!-- 
	/*
	제 목 : list.jsp
	역 할 : list 페이지
	로 그 : 1. 자유게판(장준수 2016/06/23)
		   2. 자유게시판 css 대대적으로 수정 (장준수 2016/06/30)
	*/
 -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page
	import="java.util.List, mybatis.vo.FreeBoardVO, mybatis.vo.MemberVO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<!--주요내용시작 -->
	<div style="width: 100%; margin-top: 50px;">
	<div id="listdiv">
			<table id="listTable">
				<thead>
				<tr>
					<td class="t1" style="background: #5D5D5D; height: 45px; font-weight: bold;"><font color="#FFFFFF">번호</font></td>
					<td class="t2" style="background: #5D5D5D; height: 45px; font-weight: bold;"><font color="#FFFFFF">제목</font></td>
					<td class="t3" style="background: #5D5D5D; height: 45px; font-weight: bold;"><font color="#FFFFFF">아이디</font></td>
					<td class="t4" style="background: #5D5D5D; height: 45px; font-weight: bold;"><font color="#FFFFFF">날짜</font></td>
					<td class="t5" style="background: #5D5D5D; height: 45px; font-weight: bold;"><font color="#FFFFFF">조회수</font></td>
				</tr>
				</thead>
				<c:forEach var="list" items="${list }" varStatus="stat">
					<div id="a">
					<c:out value="${size = list }"></c:out>
					</div>
					<tr>
						<td class="a1">
							${rowTotal-((nowPage-1)*blockList+stat.index) }
						</td>
						<td class="a1">
							
							<a href="view.inc?seq=${list.seq }&nowPage=${nowPage}">${list.title }
							<c:if test="${size != null && size.anslist.size() > 0}">
							 [${size.anslist.size()}]
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
				<div id="boardmove">
				<div id="page">${pageCode }</div>
				<div id="write_btn">
				<c:if test="${vo != null }">
					<input type="button" value="글쓰기" onclick="javascript:location.href='writeForm.inc'"/>
				</c:if>
				</div>
				</div>
	</div>
	</div>
	<!--주요내용끝 -->
