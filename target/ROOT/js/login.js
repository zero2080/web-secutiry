var conPath = location.href.substring(location.href.indexOf(location.host)+location.host.length,location.href.length);
var id = '';
if(conPath.indexOf('/') !== conPath.lastIndexOf('/')){
	conPath = conPath.substring(0,conPath.lastIndexOf('/'));		
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
