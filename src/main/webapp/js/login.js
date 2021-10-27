var conPath = '/';
var id = '';

if(location.href.indexOf('security')>0){
	conPath = '/security';
}

const login = ()=>{
	let id = document.getElementById('id').value;
	let password = document.getElementById('pwd').value;
	
	fetch(`${conPath}login`,{
		headers:new Headers({'Content-Type':'application/json'}),
		body:JSON.stringify({"memberId":id,"memberPassword":password}),
		method:"POST"
	}).then(res=>res.json())
	.then(data=>{
		if(data[0].memberId===id){
			console.log(data);
			sessionStorage.setItem("memberId",id);
			location.href=`${conPath}main`;
		}
	})
}
