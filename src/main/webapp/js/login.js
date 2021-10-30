var conPath = '';
var id = '';

if(location.href.indexOf('/security')>0){
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
			res.json().then(data=>{
				alert(`${data.message}(${res.status})`);
			});
		}
	})
}

const join = ()=>{
	let joinWrapper = document.createElement('div');
	
	let joinForm = document.createElement('div');
	
	let idLabel = document.createElement('label');
	let pwdLabel = document.createElement('label');
	
	let idImg = document.createElement('img');
		idImg.src=`${conPath}/img/id_icon.png`
	
	let pwdImg = document.createElement('img');
		pwdImg.src=`${conPath}/img/pw_icon.png`;
		
	let idField = document.createElement('input');
		idField.type='text';
		idField.placeholder='아이디를 입력하세요';
		
	let pwdField = document.createElement('input');
		pwdField.type='password';
		pwdField.placeholder='비밀번호를 입력하세요';
	let pwdInfo = document.createElement('p');
		pwdInfo.innerText="영어,숫자 가능 / 특수문자,한글 불가\n 최소 4글자 / 최대 12글자";
	
	let joinBtn = document.createElement('input');
		joinBtn.type='button';
		joinBtn.value='JOIN'
		
	let closeBtn = document.createElement('input');
		closeBtn.type='button';
		closeBtn.value='CLOSE';
	
	joinWrapper.appendChild(joinForm);
	joinForm.appendChild(idLabel);
	joinForm.appendChild(pwdLabel);
	joinForm.appendChild(pwdInfo);
	idLabel.appendChild(idImg);
	idLabel.appendChild(idField);
	pwdLabel.appendChild(pwdImg);
	pwdLabel.appendChild(pwdField);
	joinForm.appendChild(joinBtn);
	joinForm.appendChild(closeBtn);
	
	//스타일
	joinWrapper.className='join-wrapper';
	joinForm.style.width=0;
	joinForm.style.height=0;
	
	
	//이벤트
	
	//아이디 벨리데이션
	idField.addEventListener('keyup',()=>{
		let id = idField.value.replace(/[^a-z,^A-Z,^0-9]/g,'').replaceAll('^','').replaceAll(' ','');
		idField.value=id.substring(0,24);
	});
	//패스워드 벨리데이션
	pwdField.addEventListener('keyup',()=>{
		let pwd = pwdField.value.replace(/[^a-z,^A-Z,^0-9]/g,'').replaceAll('^','').replaceAll(' ','');
		pwdField.value=pwd.substring(0,12);
	});
	
	//가입버튼
	joinBtn.addEventListener('click',()=>{
		let member = {};
		member.memberId=idField.value;
		member.memberPassword=pwdField.value;
		if(validation(member)){
			fetch(`${conPath}/join`,{
				headers:new Headers({'content-type':'application/json'}),
				method:'POST',
				body:JSON.stringify(member)
			}).then(res=>{
				if(res.ok){
					alert(`${member.memberId}님 가입이 완료되었습니다`);
					joinForm.style.width=0;
					joinForm.style.height=0;
					setTimeout(()=>joinWrapper.remove(),300);
				}else{
					res.json().then(data=>{
						alert(`${data.message}(${res.status})`);
					});
				}
			})
		}
		
	});
	
	//닫기 버튼
	closeBtn.addEventListener('click',()=>{
		joinForm.style.width=0;
		joinForm.style.height=0;
		setTimeout(()=>joinWrapper.remove(),300);
	});
	
	
	document.body.appendChild(joinWrapper);
	
	setTimeout(()=>{
		joinForm.style.width='500px';
		joinForm.style.height='400px';
	},10);
	//location.href=`${conPath}/join`
}
const enter = (e)=>{
	if(e.keyCode===13){
		login()
	}
}

const validation = (member)=>{
	if(member.memberId!==null && member.memberId.length<4){
		alert('아이디는 8글자 이상을 입력해주세요');
		return false;
	}else if(member.memberPassword !==null && member.memberPassword.length<4){
		alert('비밀번호는 4글자 이상이어야 합니다.');
		return false;
	}
	return true;
}