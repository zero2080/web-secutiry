<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="conPath" value="<%=request.getContextPath() %>"/>

<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="./meta.jsp"/>
<link href="${conPath }/css/boardDetail.css" rel="stylesheet" type="text/css"></link>
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
				<table>
					<tbody>
						<tr>
							<th>글제목</th>
							<td>
								<input type="text" style="width: 77%; height: 25px; margin-right: 10px;" id="title"/><label><input type="checkbox" style="width: 20px; height: 20px; margin: 5px; vertical-align: middle;" id="visible" /><span style="vertical-align:middle;">공개</span></label>
							</td>
						</tr>
						<tr>
							<th>글내용</th>
							<td>
								<textarea style="resize:none; width:90%; margin:10px 5%; min-height:300px;"></textarea>
							</td>
						</tr>
					</tbody>
				</table>
			</article>
			<input type="button" value="등록" style="float:right; margin: 0 30px; width: 100px; height: 30px; font-weight: 700; border: none; background-color: #3e3e3e; color: white; font-size: 1.1em;"/>
		</section>
	</div>
	<script src="${conPath }/js/write.js" type="text/javascript"></script>
</body>
</html>