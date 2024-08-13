var html = new Vue({
	el:"#vueBox",
	data:{
	
	},
	methods:{
		
		goupdate:function(){
		
			if(f.cpwd.value.length < 8){
				alert("비밀번호는 8자 이상 입력해주세요")
			}else if(f.cpwd.value != f.cpwd_ck.value){
				alert("비밀번호가 서로 다릅니다")
			}else {
				f.action = path+"/raemian_client/pwdupdate"
				f.method = "post"
				f.enctype = "application/x-www-form-urlencoded"
				f.submit()
			}
			
		}
		
		
	}
})