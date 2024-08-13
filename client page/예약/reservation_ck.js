var html = new Vue({
	el : "#vueBox",
	data :{
	},
	methods:{
	
		update:function(){
			if(confirm("사전 예약을 변경 하시겠습니까? \n변경은 한번만 가능합니다")){
				f.method="post"
				f.action=path+"/raemian_client/reservation/update"
				f.enctype="application/x-www-form-urlencoded"
				f.submit();
			}
		},
		count : function (data){
			if(data == "yes"){
				alert("예약된 내용이 없습니다")
				location.href = path+"/raemian_client/reservation/reservation_in"
			}else {
				fetch(path+"/raemian_client/reservation/idxck?idx="+f.cidx.value).then(function(data){
					return data.json();
				}).then(function(data){
					f.date.value = data["reservedate"]
					f.time.value = data["reservetime"]
					if(data["rpersonnel"] == 1){
						f.rpersonnel[0].checked = true
					}else {
						f.rpersonnel[1].checked = true
					}
					
					if(data["updatecnt"] != 1){
						btn.style.display = "block";
					}else  {
						alert("더이상 변경이 불가능 합니다")
						location.href = path+"/raemian_client/reservation/reservation_cancel"
					}
				}).catch(function(e){
					alert("오류가 발생하였습니다 [번호 : 029]")
					location.href = path+"/raemian_client/index"
				})
		
			}
		}
	},
	mounted : function(){
		console.log(f.cidx.value)
		fetch(path+"/raemian_client/reservation/ck?cidx="+f.cidx.value).then(function(data){
			return data.text();
		}).then(function(data){
			html.count(data)
		}).catch(function(e){
			alert("오류가 발생하였습니다 [번호 : 028]")
			location.href = path+"/raemian_client/index"
		})
	}
	
	
	
})