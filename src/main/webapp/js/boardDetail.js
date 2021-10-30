var replWindow = undefined;

const msgPop = (elem)=>{
	
	if(id === elem.dataset.toId){
		alert('내가 쓴 글입니다.');
		return;
	}else{
		replWindow = window.open('','메세지보내기','width=200,height=300,toolbar=no');
								
		replWindow.document.body.innerText='';
		
		let toId = document.createElement('p');
			toId.innerText=elem.dataset.toId;
		let textArea = document.createElement('textarea');
			textArea.style.width='100%';
			textArea.style.height='75%';
			textArea.style.resize='none';
		let btn = document.createElement('input');
			btn.type='button';
			btn.value='보내기';
			btn.style.width='50%';
			btn.style.height='35px';
			btn.addEventListener('click',()=>sendMessage(elem.dataset.toId,textArea.value));
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
