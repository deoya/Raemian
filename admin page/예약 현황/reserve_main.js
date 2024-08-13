
var html = new Vue({
	el:"#vueBox",
	data:{
	},
	methods:{
		del :function(event, ridx){
			event.stopPropagation();
			if(confirm("사전예약 회원 취소 하시겠습니까? 데이터는 복구 되지 않습니다")){
				fetch(path+"/raemian_admin/reserve/delete?ridx="+ridx).then(function(data){
					return data.text();
				}).then(function(data){
					alert(data)
					location.reload()
				}).catch(function(e){
					alert("삭제에 실패했습니다 [번호 : 040]")
				})
			}
		},
		left:function(){
			if(pg > 2){
				pg = Number(pg)-1
				location.href = path+'/raemian_admin/reserve/reserve_main?page='+pg+"&search="+search+"&search_ch="+search_ch
			}else if(pg == 2) {
				location.href = path+'/raemian_admin/reserve/reserve_main?search='+search+"&search_ch="+search_ch
			}
		},
		lleft:function(){
			location.href = path+'/raemian_admin/reserve/reserve_main?search='+search+"&search_ch="+search_ch
		},
		right:function(ea){
			if(pg == ""){
				pg = 1
			}
			if(pg < ea){
				pg = Number(pg)+1
				location.href = path+'/raemian_admin/reserve/reserve_main?page='+pg+"&search="+search+"&search_ch="+search_ch
			}
		},
		rright:function(ea){
			if(ea == 0){
				location.href = path+'/raemian_admin/reserve/reserve_main?search='+search+"&search_ch="+search_ch
			}else {
				location.href = path+'/raemian_admin/reserve/reserve_main?page='+ea+"&search="+search+"&search_ch="+search_ch
			}
		},
		gopage :function(data){
			location.href = path+'/raemian_admin/reserve/reserve_main?page='+data+"&search="+search+"&search_ch="+search_ch 
			
		}
		
		
	}
})