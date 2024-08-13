
var html = new Vue({
	el : "#vueBox",
	data:{
		idcheck : false
	},
	methods:{
		idck:function(){
		
			if(f.aid.value.length < 5){
				alert("아이디는 5글자 이상 입력해 주세요")
			}else {
				fetch(path+"/idcheck?aid="+f.aid.value).then(function(data){
					return data.text();
				}).then(function(data){
					if(data == "no"){
						alert("해당 아이디는 사용이 불가능 합니다")
					}
					else{
						alert("해당 아이디는 사용이 가능합니다")
						f.aid.readOnly = true
						html.idcheck = true
					}
				}).catch(function(error){
					alert("오류 발생 [번호 : 001]")
				})
			}			
		},
		insert:function(){
			
			const etc_ck = /[^a-zA-Z0-9가-힣]/
			const num_ck= /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/
			const em_ck = /[0-9a-z]+\@[0-9a-z]+\.[a-z]+/i;
			
			if(f.assign.value == "" || f.ateam.value == ""|| f.aname.value == ""|| f.aposition.value == ""|| f.aid.value == "" || f.apwd.value == ""|| f.aemail.value == ""|| f.atell[1].value == ""|| f.atell[2].value == ""){
				alert("모든 칸을 입력하여 주세요")
			}else if(etc_ck.test(f.aname.value)){
				alert("이름은 특수문자는 제외하고 입려하여 주세요")
			}else if(!this.idcheck){
				alert("아이디 중복체크를 진행해 주세요")
			}else if(f.apwd.value.length < 5){
				alert("패스워드는 5글자 이상 입력하여 주세요")
			}else if(f.apwd.value != f.apwd_ck.value){
				alert("패스워드를 다시 확인하여 주세요")				
			}else if(!em_ck.test(f.aemail.value)){
				alert("이메일을 다시 확인하여 주세요")
			}else if(num_ck.test(f.atell[1].value) || num_ck.test(f.atell[2].value) || f.atell[1].value.length < 3 || f.atell[2].value.length != 4 ){
				alert("핸드폰 번호를 다시 확인하여 주세요")
			}else {
				f.method = "POST"
				f.enctype="application/x-www-form-urlencoded"
				f.action = path+"/memberInsert"
				f.submit();
			}
		},
		
	}
	

})