<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="conPath" value="<%=request.getContextPath() %>"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="./meta.jsp"/>
	<link href="${conPath }/css/messageList.css" rel="stylesheet" type="text/css"></link>
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
							<col style="width:15%"/>
							<col style="width:60%"/>
							<col style="width:6%"/>
							<col style="width:12%"/>
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>보낸 사람</th>
								<th>내용</th>
								<th>답장</th>
								<th>날짜</th>
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
			</article>
        </section>
	</div>
	<script src="${conPath }/js/messageList.js" type="text/javascript"></script>
</body>
</html>