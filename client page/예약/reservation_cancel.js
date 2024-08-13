var html = new Vue({
	el : "#vueBox",
	data :{
	},
	methods:{
		del:function(){
			if(confirm("사전방문 예약 취소하시겠습니까?\n해당 데이터는 복구 되지 않습니다")){
				f.method="post"
				f.action=path+"/raemian_client/reservation/delete"
				f.enctype="application/x-www-form-urlencoded"
				f.submit();
			}
		},
		count : function (data){
			if(data == "yes"){
				alert("예약된 내용이 없습니다")
				location.href = path+"/raemian_client/reservation/reservation_in"
			}else {
				fetch(path+"/raemian_client/reservation/idxck?idx="+f.idx.value).then(function(data){
					return data.json();
				}).then(function(data){
					reservedate.textContent = data["reservedate"]
					reservetime.textContent = data["reservetime"]
					rpersonnel.textContent = data["rpersonnel"] + "명"
				}).catch(function(){
					alert("오류가 발생하였습니다 [번호 : 025]")
					location.href = path+"/raemian_client/index"
				})
		
			}
		}
	},
	mounted : function(){
		fetch(path+"/raemian_client/reservation/ck?cidx="+f.idx.value).then(function(data){
			return data.text();
		}).then(function(data){
			html.count(data)
		}).catch(function(e){
			alert("오류가 발생하였습니다 [번호 : 027]")
			location.href = path+"/raemian_client/index"
		})
	}
	
	
	
})