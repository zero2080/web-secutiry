let conPath = location.href.substring(location.href.indexOf(location.host)+location.host.length,location.href.length);
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
			sessionStorage.setItem("memberId",id);
			location.href=`${conPath}main`;
		}
	})
}
