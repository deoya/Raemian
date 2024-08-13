var html = new Vue({
	el : "#vueBox",
	data : {
	},
	methods : {
		insert : function(){
			if(f.date.value == "" || f.time.value == "시간선택" || !f.rpersonnel[0].checked && !f.rpersonnel[1].checked) {
				alert("빈값을 모두 채워주세요")
			}else {
				f.action = path+"/raemian_client/reservation/insert"
				f.enctype="application/x-www-form-urlencoded"
				f.method = "post"
				f.submit();
			}
		},
		dateck : function(){
			var selectedDate = new Date(f.date.value);
			var today = new Date();
			if(selectedDate <= today){
				alert("예약은 다음날 이후로만 선택이 가능합니다")
				f.date.value = ""
			}
		},
		count : function (data){
			if(data == "no"){
				location.href = path+"/raemian_client/reservation/reservation_cancel"
			}
		}
	},
	mounted: function () {
			if(f.cid.value == ""){
				alert("로그인 후 이용해주시기 바랍니다")
				location.href = path+"/raemian_client/userlogin"
			}else {
				fetch(path+"/raemian_client/reservation/ck?cidx="+f.cidx.value).then(function(data){
					return data.text();
				}).then(function(data){
					html.count(data)
				}).catch(function(e){
					alert("오류가 발생하였습니다 [번호 : 024]")
					location.href = path+"/raemian_client/index"
				})
			}
	
	/*
		setTimeout(function() {
			if(f.cid.value == ""){
				alert("로그인 후 이용해주시기 바랍니다")
				location.href = path+"/raemian_client/userlogin"
			}else {
				fetch(path+"/raemian_client/reservation/ck?cidx="+f.cidx.value).then(function(data){
					return data.text();
				}).then(function(data){
					html.count(data)
				}).catch(function(e){
					alert("오류가 발생하였습니다 [번호 : 024]")
					location.href = path+"/raemian_client/index"
				})
			}
		
		}, 500); */
	}
})