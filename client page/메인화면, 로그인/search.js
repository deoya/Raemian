var html = new Vue({
	el:"#vueBox",
	data:{
		id_acc_ck : false,
		acc_num : "",
		idcheck : false
	},
	methods:{
		idSearch :function(){
			if(html.ck("id") == "ok"){
				f.submit();
			}
		},
		pwdSearch:function(){
			if(html.ck("pwd") == "ok"){
				f.submit();
			}
		},
		accreditation :function(){
			const num_ck= /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/
			if(num_ck.test(f.ctel.value)){
				fetch(path+"/raemian_client/tel_ck?ctel="+f.ctel.value).then(function(data){
					return data.text();
				}).then(function(data){
					alert("인증번호가 발송되었습니다")
					f.tel_save.value = f.ctel.value
					html.acc_num = data
					console.log(data)
					mb_btn1.style.display = "inline-block"
				}).catch(function(){
					alert("오류가 발생하였습니다 [번호 : 035]")
				})
			}else {
				alert("번호를 정확히 입력해주세요")
				f.ctel.value = ""
			}
		},
		accreditation_ck :function(){
			if(this.acc_ck_num != ""){
				if(f.acc_num_ck.value == this.acc_num){
					alert("본인 인증이 확인 되었습니다")
					f.ctel.value = f.tel_save.value
					f.ctel.readOnly = true
					f.acc_num_ck.readOnly = true
					mb_btn1.style.display = "none"
					this.acc_ck = true
					
				}else{
					alert("인증번호를 다시 입력하여 주세요")
				}
			}
		},
		idck:function(){
			if(f.cid.value.length < 6){
				alert("아이디는 6글자 이상 입력해 주세요")
			}else {
				fetch(path+"/raemian_client/idcheck?cid="+f.cid.value).then(function(data){
					return data.text();
				}).then(function(data){
					if(data == "no"){
						alert("확인이 완료 되었습니다")
						f.cid.readOnly = true
						html.idcheck = true
					}
					else{
						alert("해당 아이디는 존재하지 않습니다")
					}
				}).catch(function(error){
					alert("오류 발생 [번호 : 036]")
				})
			}		
		},
		ck:function(data){
		
			const etc_ck = /[^a-zA-Z0-9가-힣]/
			if(f.cname.value == ""){
				alert("빈칸을 채워주세요")
			}else if(etc_ck.test(f.cname.value)){
				alert("이름은 특수문자는 제외하고 입력하여 주세요")
			}else if(!this.acc_ck){
				alert("핸드폰 인증을 진행해 주세요")
			}else if(!this.idcheck && data == "pwd") {
				alert("아이디 확인을 진행해주세요")
			}else {
				f.cri.value = data
				f.action = path+"/raemian_client/searchResult"
				f.method = "post"
				f.enctype = "application/x-www-form-urlencoded"
				return "ok"
			}
			
		}
		
	}
})