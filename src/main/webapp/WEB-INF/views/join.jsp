<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="conPath" value="<%=request.getContextPath() %>"/>

<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="./meta.jsp"/>
<script>
	function join(){
		let id = document.getElementById('id').value;
		let pwd = document.getElementById('password').value;
		
		fetch('${conPath}/join',{
			headers:new Headers({'content-type':'application/json'}),
			method:'POST',
			body:JSON.stringify({memberId:id,memberPassword:pwd})
		}).then(res=>res.ok).then((bool)=>{
			if(bool===true){
				location.href='${conPath}'
			}else{
				alert('오류가 발생했습니다');
			}
		})
	}
	
	function passwordCng(obj){
		console.log(obj.value);
	}
</script>
</head>
<body>
	<div>
		<div>
			<img src="${conPath }/img/join.png"/>
		</div>
		<article>
			<section>
				<label>아이디<input type="text" id="id"/></label>
				<label>비밀번호<input type="password" onkeyup="passwordCng(this)" id="password"/></label>
				
			</section>
			<section>
				<input type="button" id="join" value="JOIN"/>
			</section>
		</article>
	</div>
</body>
</html>