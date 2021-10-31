

var pageNo = 0;
var totalPageCount = 0;
var msgWindow = undefined;
var replWindow = undefined;
const prevPage = ()=>{
	if(pageNo===1){
		return;
	}else{
	
		pageNo--;
		
		fetch(`${conPath}/message/list?pageNo=${pageNo}&pageSize=10&memberId=${id}`,{
			headers:new Headers({'Content-Type':'application/json'}),
			method:'GET'
		}).then(res=>{
			if(res.ok){
				res.json().then(data=>{
					console.log(data);
					document.querySelector('table>tbody').innerText='';
					data.list.forEach(datum=>{
						let tr = document.createElement('tr');
						let num = document.createElement('td');
						let fromId = document.createElement('td');
						let content = document.createElement('td');
						let reply = document.createElement('td');
						let replBtn = document.createElement('input');
						let createDate = document.createElement('td');
						
						tr.appendChild(num);
						tr.appendChild(fromId);
						tr.appendChild(content);
						tr.appendChild(reply);
						tr.appendChild(createDate);
						
						num.innerText=datum.id;
						fromId.innerText=datum.fromId;
						content.innerText=datum.content;
						reply.appendChild(replBtn);
						replBtn.type='button';
						replBtn.value='답장';
						replBtn.addEventListener('click',()=>{
							replWindow = window.open('','답장','width=200,height=300,toolbar=no');
							
							replWindow.document.body.innerText='';
							
							let toId = document.createElement('p');
								toId.innerText=datum.fromId;
							let textArea = document.createElement('textarea');
								textArea.style.width='100%';
								textArea.style.height='75%';
								textArea.style.resize='none';
							let btn = document.createElement('input');
								btn.type='button';
								btn.value='보내기';
								btn.style.width='50%';
								btn.style.height='35px';
								btn.addEventListener('click',()=>sendMessage(datum.fromId,textArea.value));
							let clsBtn = document.createElement('input');
								clsBtn.type='button';
								clsBtn.value='닫기';
								clsBtn.style.width='50%';
								clsBtn.style.height='35px';
								clsBtn.addEventListener('click',()=>replWindow.close());
							replWindow.document.body.appendChild(toId);
							replWindow.document.body.appendChild(textArea);
							replWindow.document.body.appendChild(btn);
							replWindow.document.body.appendChild(clsBtn);
						});
						createDate.innerText=datum.createdAt;
						
						
						tr.addEventListener('click',(e)=>{
							detail({event:e,datum:datum});					
						});
						
						document.querySelector('table>tbody').appendChild(tr);
					});
					totalPageCount = data.totalPageCount;
					document.getElementById('currentPage').innerText=pageNo;
				});
			}else{
				alert(`${res.status}`);
			}
		});
	}
}

const nextPage = ()=>{
	if(pageNo > 0 && pageNo>=totalPageCount){
		return;	
	}else{
		pageNo++;
		fetch(`${conPath}/message/list?pageNo=${pageNo}&pageSize=10&memberId=${id}`,{
			headers:new Headers({'Content-Type':'application/json'}),
			method:'GET'
		}).then(res=>{
			if(res.ok){
				res.json().then(data=>{
					console.log(data);
					document.querySelector('table>tbody').innerText='';
					data.list.forEach(datum=>{
						let tr = document.createElement('tr');
						let num = document.createElement('td');
						let fromId = document.createElement('td');
						let content = document.createElement('td');
						let reply = document.createElement('td');
						let replBtn = document.createElement('input');
						let createDate = document.createElement('td');
						
						tr.appendChild(num);
						tr.appendChild(fromId);
						tr.appendChild(content);
						tr.appendChild(reply);
						tr.appendChild(createDate);
						
						num.innerText=datum.id;
						fromId.innerText=datum.fromId;
						content.innerText=datum.content;
						reply.appendChild(replBtn);
						replBtn.type='button';
						replBtn.value='답장';
						replBtn.addEventListener('click',()=>{
							replWindow = window.open('','답장','width=200,height=300,toolbar=no');
							
							replWindow.document.body.innerText='';
							
							let toId = document.createElement('p');
								toId.innerText=datum.fromId;
							let textArea = document.createElement('textarea');
								textArea.style.width='100%';
								textArea.style.height='75%';
								textArea.style.resize='none';
							let btn = document.createElement('input');
								btn.type='button';
								btn.value='보내기';
								btn.style.width='50%';
								btn.style.height='35px';
								btn.addEventListener('click',()=>sendMessage(datum.fromId,textArea.value));
							let clsBtn = document.createElement('input');
								clsBtn.type='button';
								clsBtn.value='닫기';
								clsBtn.style.width='50%';
								clsBtn.style.height='35px';
								clsBtn.addEventListener('click',()=>replWindow.close());
							replWindow.document.body.appendChild(toId);
							replWindow.document.body.appendChild(textArea);
							replWindow.document.body.appendChild(btn);
							replWindow.document.body.appendChild(clsBtn);
						});
						createDate.innerText=datum.createdAt;
						
						tr.addEventListener('click',(e)=>{
							detail({event:e,datum:datum});						
						});

						document.querySelector('table>tbody').appendChild(tr);
					});
					totalPageCount = data.totalPageCount;
					document.getElementById('currentPage').innerText=pageNo;
				});
			}else{
				alert(`${res.status}`);
			}
		});
	}
}

const sendMessage = (toId,content)=>{
	fetch(`${conPath}/message`,{
		headers:new Headers({'content-type':'application/json'}),
		method:'POST',
		body:JSON.stringify({toId:toId,content:content,fromId:id})
	}).then(function (res){
		if(res.ok){
			alert('메세지를 보냈습니다.');
			replWindow.close();
		}else{
			alert(`메세지 전송에 실패했습니다(${res.status})`);
		}
		
	});
}

const detail = ({event,datum})=>{

	if(event.target.value==='답장'){
		return;
	}
	
	let {fromId,content} = datum;
	
	msgWindow = window.open('','message','width=200, height=300, toolbar=no');
	msgWindow.document.body.innerHTML=`<p style="border-bottom:1px solid black;">보낸 사람 : ${fromId}</p><p style="width:100%;word-break:break-all;">${content}</p>`;
}

nextPage();