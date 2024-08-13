
var html = new Vue({
	el:"#vueBox",
	data:{
	},
	methods:{
		left:function(){
			if(pg > 2){
				pg = Number(pg)-1
				location.href = path+'/raemian_client/various/notice?page='+pg+"&search="+search
			}else if(pg == 2) {
				location.href = path+'/raemian_client/various/notice?search='+search
			}
		},
		lleft:function(){
			location.href = path+'/raemian_client/various/notice?search='+search
		},
		right:function(ea){
			if(pg == ""){
				pg = 1
			}
			if(pg < ea){
				pg = Number(pg)+1
				location.href = path+'/raemian_client/various/notice?page='+pg+"&search="+search
			}
		},
		rright:function(ea){
			if(ea == 0){
				location.href = path+'/raemian_client/various/notice?search='+search
			}else{
				location.href = path+'/raemian_client/various/notice?page='+ea+"&search="+search 
			}
			
		},
		gopage :function(data){
			location.href = path+'/raemian_client/various/notice?page='+data+"&search="+search 
		}
		
	},
	computed : function(){
		location.reload()
	}
})