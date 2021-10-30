
var pageNo = 0;
var totalPageCount = 0;

const prevPage = ()=>{
	if(pageNo===1){
		return;
	}else{
	
		pageNo--;
		
		fetch(`${conPath}/board/list?pageNo=${pageNo}&pageSize=10&memberId=${id}`,{
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
						
						if(datum.visible || id===datum.memberId){
							writer.innerText=datum.memberId;
							tr.addEventListener('click',()=>detail(datum.id));
						}else{
							writer.innerText=datum.memberId.substring(0,3)+'***';
							tr.addEventListener('click',()=>alert('비공개 글입니다'));
						}
						
						createDate.innerText=datum.createdAt;
						
						title.innerText = datum.title;
						
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
		fetch(`${conPath}/board/list?pageNo=${pageNo}&pageSize=10&memberId=${id}`,{
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
						
						if(datum.visible || id===datum.memberId){
							writer.innerText=datum.memberId;
							tr.addEventListener('click',()=>detail(datum.id));
						}else{
							writer.innerText=datum.memberId.substring(0,3)+'***';
							tr.addEventListener('click',()=>alert('비공개 글입니다'));
						}
						
						createDate.innerText=datum.createdAt;
						
						title.innerText = datum.title;
						
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

const detail = (num)=>{
	location.href=`${conPath}/board/detail?id=${num}`;
}

nextPage();