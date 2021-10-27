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
			<table>
				<thead>
					<tr>
						<th>글제목</th>
						<td>
							<input type="text" id="title"/><label><input type="checkbox" id="visible" />공개</label>
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>글내용</th>
						<td>
							<textarea></textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</section>
		   <input type="button" value="등록"/>
	</article>
	<script src="${conPath }/js/write.js" type="text/javascript"></script>
</body>
</html>