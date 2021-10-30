<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="conPath" value="<%=request.getContextPath() %>"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="./meta.jsp"/>
	<link href="${conPath }/css/board.css" rel="stylesheet" type="text/css"></link>
</head>
<body>
	<div id="root">
		<jsp:include page="./sideGnb.jsp"/>
        <section>
        	<nav>
				<span><span id="myId"></span>님 어서오세요.</span>
				<span>
					<a href="javascript:logout()">로그아웃</a>
				</span>
			</nav>
			<article>
				<section>
					<table>
						<colgroup>
							<col style="width:7%"/>
							<col style="width:50%"/>
							<col style="width:11%"/>
							<col style="width:12%"/>
							<col style="width:20%"/>
						</colgroup>
						<thead>
							<tr>
								<th><p>글번호</p></th>
								<th><p>글제목</p></th>
								<th><p>공개</p></th>
								<th><p>작성자</p></th>
								<th><p>작성일</p></th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
					<article>
						<section id="pageNation">
							<ul>
								<li id="prevPage" onClick="prevPage()">이전</li>
								<li id="currentPage">1<li>
								<li id="nextPage" onclick="nextPage()">다음</li>
							</ul>
						</section>
					</article>
				</section>
				<section>
					<a href="${conPath }/board/write" >글쓰기</a>
				</section>
			</article>
        </section>
	</div>
	
	<script src="${conPath }/js/home.js" type="text/javascript"></script>
</body>
</html>
