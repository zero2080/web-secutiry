var conPath = '';
var id = '';

if(location.href.indexOf('security')>0){
	conPath = '/security';
}

const login = ()=>{
	let id = document.getElementById('id').value;
	let password = document.getElementById('pwd').value;
	
	fetch(`${conPath}/login`,{
		headers:new Headers({'Content-Type':'application/json'}),
		body:JSON.stringify({"memberId":id,"memberPassword":password}),
		method:"POST"
	}).then(res=>{
		if(res.ok){
			sessionStorage.setItem('memberId',id);
			location.href=`${conPath}/main`;
		}else{
			alert('로그인 정보를 확인해 주세요');
		}
	})
}

const join = ()=>{
	location.href=`${conPath}/join`
}