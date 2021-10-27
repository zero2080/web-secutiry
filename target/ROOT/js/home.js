
fetch(`${conPath}/board/list`,{
	headers:new Headers({'Content-Type':'application/json'}),
	method:'GET'
}).then(res=>res.json()).then(data=>{
	data.forEach(datum=>{
		let tr = document.createElement('tr');
		let num = document.createElement('td');
		let title = document.createElement('td');
		let visible = document.createElement('td');
		let writer = document.createElement('td');
		let createDate = document.createElement('td');
		
		tr.appendChild(num);
		tr.appendChild(title);
		tr.appendChild(visible);
		tr.appendChild(writer);
		tr.appendChild(createDate);
		
		num.innerText=datum.id;
		
		visible.innerText=datum.visible?'공개':'비공개';
		
		if(id===datum.memberId){
			writer.innerText=datum.memberId;
		}else{
			writer.innerText=datum.memberId.substring(0,3)+'***';
		}
		
		createDate.innerText=datum.createdAt;
		
		if(id===datum.memberId || datum.visible){
			title.innerText = datum.title;
			tr.addEventListener('click',()=>detail(datum.id));	
		}else{
			title.innerText = '비공개 글입니다.';
		}
		document.querySelector('table>tbody').appendChild(tr);
	})
});

const detail = (num)=>{
	location.href=`${conPath}/board/detail?id=${num}`;
}