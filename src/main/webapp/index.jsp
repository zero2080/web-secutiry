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
		<title>웹 사이트 보안</title>
		<script src="${conPath }/js/login.js" type="text/javascript"></script>
		<style>
		* {
		    padding:0;
		    margin:0;
		}
		html,body {
		    width:100%;
		    height:100%;
		}
		#wrap{
		    width:100%;
		    height:100%;
		    overflow:hidden;
		}
		#form_wrap{
		    width:500px;
		    height:400px;
		    margin:150px auto 0;
		    padding : 20px 0 40px;
		    border-radius: 20px;
		    box-shadow:none;
		    text-align: center;
		    transition: 1s;
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		}
		#form_wrap:hover {
		    box-shadow: 0 0 5px 5px #e5e5e5ee;
		}
		
		#logo{
		    margin:10%;
		    width:19%;
		}
		label {
	    	display: flex;
		    align-items: center;
		}
		
		label>img {
		    width:30px;
		    vertical-align: middle;
		}
		
		input[type=text],input[type=password] {
		    border-top:none;
		    border-left:none;
		    border-right:none;
		    border-bottom:2px solid gray;
		    font-size:1.2em;
		    padding:2% 1% 1%;
		    vertical-align: middle;
		}
		
		input[type=button] {
		    width: 280px;
		    height: 50px;
		    font-size: 1.2em;
		    font-weight: bold;
		    letter-spacing: 3px;
		    background-color: skyblue;
		    color: white;
		    border: none;
		    margin-bottom:10px;
		}
		</style>
	</head>
	<body>
		 <div id ="wrap">
	        <div id="form_wrap">
	            <img id="logo" src ="${conPath }/icon/apple-icon-180x180.png" alt="우편함 아이콘"/>
                <label>
                    <img src="${conPath}/img/id_icon.png" alt="아이디 아이콘"/>
                    <input type="text" id="id" placeholder="아이디"/>
                </label>
                <br/>
                <label>
                    <img src="${conPath}/img/pw_icon.png" alt="비밀번호 아이콘"/>
                    <input type="password" id="pwd" placeholder="비밀번호"/>
                </label>
                <br/>
                <input type="button" onClick="login()" value="LOGIN"/>
                <input type="button" onClick="join()" value="JOIN US"/>
	        </div>
	    </div>
	</body>
</html>