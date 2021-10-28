/**
 * 
 */

	document.querySelector('input[type=button]').addEventListener('click',(e)=>{
		let title = document.getElementById('title').value;
		let content = document.querySelector('textarea').value;
		let visible = document.getElementById('visible').checked;
		
		let board = {title:title,content:content,visible:visible,memberId:id}
		
		fetch(`${conPath}/board`,{
			headers:new Headers({'content-type':'application/json'}),
			method:'POST',
			body:JSON.stringify(board)
		}).then(res=>{
			console.log(res);
		});
		
	});

