<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="conPath" value="<%=request.getContextPath() %>"/>
<html lang="ko">
	<head>
		<meta charset="UTF-8"/>
		<link rel="apple-touch-icon" sizes="57x57" href="${conPath }/icon/apple-icon-57x57.png">
		<link rel="apple-touch-icon" sizes="60x60" href="${conPath }/icon/apple-icon-60x60.png">
		<link rel="apple-touch-icon" sizes="72x72" href="${conPath }/icon/apple-icon-72x72.png">
		<link rel="apple-touch-icon" sizes="76x76" href="${conPath }/icon/apple-icon-76x76.png">
		<link rel="apple-touch-icon" sizes="114x114" href="${conPath }/icon/apple-icon-114x114.png">
		<link rel="apple-touch-icon" sizes="120x120" href="${conPath }/icon/apple-icon-120x120.png">
		<link rel="apple-touch-icon" sizes="144x144" href="${conPath }/icon/apple-icon-144x144.png">
		<link rel="apple-touch-icon" sizes="152x152" href="${conPath }/icon/apple-icon-152x152.png">
		<link rel="apple-touch-icon" sizes="180x180" href="${conPath }/icon/apple-icon-180x180.png">
		<link rel="icon" type="image/png" sizes="192x192"  href="${conPath }/icon/android-icon-192x192.png">
		<link rel="icon" type="image/png" sizes="32x32" href="${conPath }/icon/favicon-32x32.png">
		<link rel="icon" type="image/png" sizes="96x96" href="${conPath }/icon/favicon-96x96.png">
		<link rel="icon" type="image/png" sizes="16x16" href="${conPath }/icon/favicon-16x16.png">
		<link rel="manifest" href="${conPath }/icon/manifest.json">
		<meta name="msapplication-TileColor" content="#ffffff">
		<meta name="msapplication-TileImage" content="${conPath }/icon/ms-icon-144x144.png">
		<meta name="theme-color" content="#ffffff">
		<meta name="description" content="보안 강좌 사이트"/>
		<title>웹 사이트 보안</title>
		<script src="${conPath }/js/login.js" type="text/javascript"></script>
	</head>
	<body>
		<div>
			<div>
				<label>아이디
					<input type="text" id="id"/>
				</label>
				<label>비밀번호
					<input type="password" id="pwd"/>
				</label>
				<input type="button" value="로그인" onClick="login()"/>
			</div>
		
		</div>
	</body>
</html>