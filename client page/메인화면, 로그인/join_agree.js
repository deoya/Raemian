var html = new Vue({
	el : "#vueBox",
	data : {
	},
	methods : {
		all : function(data){
			if(data.target.checked){
				ck1.checked = true
				ck2.checked = true
			}else {
				ck1.checked = false
				ck2.checked = false
			}
		},
		ck :function(){
			if(ck1.checked && ck2.checked){
				all_agree.checked = true
			}else {
				all_agree.checked = false
			}
		},
		next : function(){
			if(all_agree.checked == true){
				f.ck.value = "ok"
				f.action = path+"/raemian_client/join_member"
				f.method ="post"
				f.enctype="application/x-www-form-urlencoded"
				f.submit();
				
			}else {
				alert("모든 약관에 동의하셔야 가능합니다")
			}
			
		}
	},
	mounted : function(){
		fetch(path+'/resources/agreement/agree1.txt').then(function(data){
			return data.text();
		}).then(function(data){
			agree1.innerHTML = "<pre>"+data+"</pre>"
		}).catch(function(){
			alert("오류가 발생했습니다 [번호 : 033]")
			location.href = path+"/raemian_client/index"
		})
		
		fetch(path+'/resources/agreement/agree2.txt').then(function(data){
			return data.text();
		}).then(function(data){
			agree2.innerHTML = "<pre>"+data+"</pre>"
		}).catch(function(){
			alert("오류가 발생했습니다 [번호 : 034]")
			location.href = path+"/raemian_client/index"
		})
      
	}
})