<!-- 
	/*
	제 목 : edit.jsp
	역 할 : edit 페이지
	로 그 : 1. 자유게시판 글 수정(장준수 2016/06/23)
	*/
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Insert title here</title>
<style type="text/css">
#edittable{
		border:0;
		width:710px;
		height: 50px;
		margin: auto;
		margin-top: 60px;
		margin-bottom: 30px;
		border: 1px solid red;
	}
	
	#edittable {border:none; border-top:2px solid #ddd;}
	#edittable th {border-bottom:1px solid #ccc; border-left:1px solid #ccc; 
	border-right:1px solid #ccc; padding:10px 0 10px 25px; font-weight:bold; background:#efefef; font-size: 15px}
	#edittable td {border-bottom:1px solid #ddd; padding:10px; font-weight: bold;}
	
	#title{margin: -9px; width: 575px;}
	#content{margin: -9px;}
	#upload{margin-left: -9px; width: 380px;}
	
	#move{
		display: inline-block;
	
	}
	
	#btnmove{
		margin: 0 auto;
		width: 700px;
		padding-left: 550px;
	}
	
	div#move input[type=button]{
		display: inline;
		width: 70px;
		height: 27px;
		margin: 10px auto;
		font-size: 15px;
		font-weight: bold;
		border: 1px solid #dcdcdc;
		margin-left: 10px;
	}
	
	#idcolor{
		color: #000000;
	}
	
	#edit{
		margin:0 auto;
	}
	
</style>
<script type="text/javascript">
	function check(ff){
		//유효성 검사
		
		ff.submit();
	}
</script>
</head>
<body>
<div id="wrap">
		<jsp:include page="include/header.jsp"></jsp:include>
	
		<div id="edit">
		<form action="edit.inc" method="post" enctype="multipart/form-data">
			<input type="hidden" id="id" name="id" value=${vo.id } /> 
			<input type="hidden" id="password" name="password" value=${vo.password } />
			<input type="hidden" name="seq" value="${vo1.seq }"/>
			<input type="hidden" name="nowPage" value="${nowPage }"/>
			<input type="hidden" name="groups" value="${vo1.groups }"/>
			<input type="hidden" name="step" value="${vo1.step }"/>
			<input type="hidden" name="lev" value="${vo1.lev }"/>

			<table id="edittable">
				<colgroup>
					<col width="130px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>아이디</th>
						<td>
							<label for="name" class="hidden">아이디</label>
							<h3 id="idcolor">${vo.id }</h3>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
							<label for="title" class="hidden">제목</label>
							<input type="text" name="title" id="title" class="join" value="${vo1.title }"/>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td id="area">
							 <label for="content" class="hidden">내용</label>
							 <textarea rows="25" cols="70" name="content" id="content" class="join">${vo1.content }</textarea>
	
						</td>
					</tr>

					<tr>
						<th>첨부파일</th>
						<td>
							 <label for="file" class="hidden">첨부파일</label>
							 <input type="file" name="upload" id="upload" class="join"/>
							 <c:if test="${vo1.uploadFileName != '' }">
							 	(${vo1.uploadFileName })
							</c:if>
						</td>
					</tr>
				</tbody>
			</table>
			<div id="btnmove">
			<div id="move">
				<input type="button" onclick="check(this.form)" value="보내기" />
				<input type="button" value="취소" onclick="javascript:location.href='freeBoard.inc'" />
			</div>
			</div>
		</form>
	</div>
</div>
<%@include file="include/footer.jsp"%>
</body>
</html>

