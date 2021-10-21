<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="conPath" value="<%=request.getContextPath() %>"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="./meta.jsp"/>
	<style>
		body{
			max-width:1024px;
			margin:0 auto;
		}
		body>nav{
			height:80px;
			width:100%;
			display:flex;
			justify-content: space-between;
		    align-items: center;
		}
		section>table{
			width:100%;
		    border-collapse: collapse;
		}
		table>thead{
			height:40px
		}
		table>tbody>tr{
			cursor:pointer;
		}
		table>tbody>tr>td{
			text-align:center;
		}
	</style>
</head>
<body>
	<nav>
		<span><span id="myId"></span>님 어서오세요.</span>
		<span><a href="${conPath }/message">메세지함</a>&nbsp; &nbsp;<a href="${conPath }/board">게시판</a></span>
	</nav>
	<article>
		<section>
			<table border=1>
				<colgroup>
					<col style="width:7%"/>
					<col style="width:50%"/>
					<col style="width:11%"/>
					<col style="width:12%"/>
					<col style="width:20%"/>
				</colgroup>
				<thead>
					<tr>
						<th>글번호</th>
						<th>글제목</th>
						<th>공개</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
			<article>
				<section>
					
				</section>
			</article>
		</section>
	</article>
	<script src="${conPath }/js/home.js" type="text/javascript"></script>
</body>
</html>
