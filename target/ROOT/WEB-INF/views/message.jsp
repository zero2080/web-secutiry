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
	<section>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>보낸 사람</th>
					<th>내용</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				
			</tbody>
		</table>
	</section>
</body>
</html>