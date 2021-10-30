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
					<colgroup>
						<col style="width:50%;"/>
						<col style="width:20%;"/>
						<col style="width:30%;"/>
					</colgroup>
					<tbody>
						<tr>
							<td>
								${detail.title }
							</td>
							<td>
								<span>작성자</span> <span>${detail.memberId }</span>
							</td>
							<td>
								<span>작성일</span> <span>${detail.createdAt }</span>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<div>
									${detail.content }
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</article>
			<a href="javascript:history.back()">목록</a>
		</section>
	</div>
	<script src="${conPath }/js/boardDetail.js" type="text/javascript"></script>
</body>
</html>