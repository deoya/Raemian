
var html = new Vue({
	el:"#vueBox",
	data:{
	},
	methods:{
		del :function(event, cidx){
				event.stopPropagation();
				if(cidx != 1){
					if(confirm("해당 고객을 삭제하시겠습니까?\n(등록된 예약이 있다면 취소처리됩니다)")){
						fetch(path+"/raemian_admin/customer/delete?cidx="+cidx).then(function(data){
							return data.text();
						}).then(function(data){
							alert(data)
							location.reload()
						}).catch(function(e){
							alert("삭제에 실패했습니다 [번호 : 013]")
						})
					}		
				}else {
					alert("해당 고객은 삭제할 수 없습니다")
				}
		},
		left:function(){
			if(pg > 2){
				pg = Number(pg)-1
				location.href = path+'/raemian_admin/customer/member_main?page='+pg+"&search="+search+"&search_ch="+search_ch
			}else if(pg == 2) {
				location.href = path+'/raemian_admin/customer/member_main?search='+search+"&search_ch="+search_ch
			}
		},
		lleft:function(){
			location.href = path+'/raemian_admin/customer/member_main?search='+search+"&search_ch="+search_ch
		},
		right:function(ea){
			if(pg == ""){
				pg = 1
			}
			if(pg < ea){
				pg = Number(pg)+1
				location.href = path+'/raemian_admin/customer/member_main?page='+pg+"&search="+search+"&search_ch="+search_ch
			}
		},
		rright:function(ea){
			if(ea == 0){
				location.href = path+'/raemian_admin/customer/member_main?search='+search+"&search_ch="+search_ch
			}else {
				location.href = path+'/raemian_admin/customer/member_main?page='+ea+"&search="+search+"&search_ch="+search_ch
			}
		},
		gopage :function(data){
			location.href = path+'/raemian_admin/customer/member_main?page='+data+"&search="+search+"&search_ch="+search_ch
			
		}
		
		
	}
})