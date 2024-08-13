
var html = new Vue({
	el:"#vueBox",
	data:{
	},
	methods:{
		del :function(event, fidx, pt, fname){
			event.stopPropagation();
			if(fidx != 1 && fidx != 2 &&fidx != 3 &&fidx != 4 && fidx != 5 && fidx != 6 && fidx != 7 && fidx != 8){
				if(confirm("해당 데이터를 삭제하시겠습니까?")){
					fetch(path+"/raemian_admin/info/delete?fidx="+fidx+"&path="+pt+"&fname="+fname).then(function(data){
						return data.text();
					}).then(function(data){
						alert(data)
						location.reload()
					}).catch(function(e){
						alert("삭제에 실패했습니다 [번호 : 009]")
					})
				}
			}else {
				alert("해당 데이터는 수정만 가능 합니다")
			}
		},
		left:function(){
			if(pg > 2){
				pg =	Number(pg)-1
				location.href = path+'/raemian_admin/info/info_main?page='+pg+"&search="+search
				f.submit();
			}else if(pg == 2) {
				location.href = path+'/raemian_admin/info/info_main?search='+search
			}
		},
		lleft:function(){
			location.href = path+'/raemian_admin/info/info_main?search='+search
		},
		right:function(ea){
			if(pg == ""){
				pg = 1
			}
			if(pg < ea){
				pg = Number(pg)+1
				location.href = path+'/raemian_admin/info/info_main?page='+pg+"&search="+search
			}
		},
		rright:function(ea){
			if(ea == 0){
				location.href = path+'/raemian_admin/info/info_main?search='+search
			}else{
				location.href = path+'/raemian_admin/info/info_main?page='+ea+"&search="+search
			}
		},
		gopage :function(data){
			location.href = path+'/raemian_admin/info/info_main?page='+data+"&search="+search
			
		}
		
	}
})