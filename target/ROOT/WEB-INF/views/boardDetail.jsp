<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="conPath" value="<%=request.getContextPath() %>"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="./meta.jsp"/>
</head>
<body>
	<nav>
		<span><span id="myId"></span>님 어서오세요.</span>
		<span><a href="${conPath }/message">메세지함</a>&nbsp; &nbsp;<a href="${conPath }/main">게시판</a></span>
	</nav>
	<article>
		<section>
			<p class="board-title">${detail.title }</p>
		</section>
		<section>
			${detail.content }
		</section>
	</article>
	
	
	<script src="${conPath }/js/boardDetail.js" type="text/javascript"></script>
</body>
</html>