
var html = new Vue({
	el:"#vueBox",
	data:{
	},
	methods:{
		delete1 :function(nidx){
			if(confirm("해당 데이터를 삭제하시겠습니까?")){
				fetch(path+"/raemian_admin/notice/delete?nidx="+nidx).then(function(data){
					return data.text();
				}).then(function(data){
					alert(data)
					location.reload()
				}).catch(function(e){
					alert("삭제에 실패했습니다 [번호 : 013]")
				})
			}
		},
		del :function(event, nidx, aidx, login_aidx,auth){
				event.stopPropagation();
				if(auth == "ROLE_ADMIN"){
					if(aidx == login_aidx){
						html.delete1(nidx)
					}else {
						alert("슈퍼 계정 혹은 글 작성자만 삭제가 가능합니다")
					}
				}
				else if(auth == "ROLE_S_ADMIN"){
					html.delete1(nidx)
				}
		},
		delete2 : function(nidx,nfile,filetype, pt){
			if(confirm("해당 데이터를 삭제하시겠습니까?")){
					
					fetch(path+"/raemian_admin/notice/delete?nidx="+nidx+"&nfile="+nfile+"&filetype="+filetype+"&path="+pt).then(function(data){
						return data.text();
					}).then(function(data){
						alert(data)
						location.reload()
					}).catch(function(e){
						alert("삭제에 실패했습니다 [번호 : 013]")
					})
				}
		},
		del_file :function(event, nidx,filetype, uuid, nfile, pt, aidx, login_aidx,auth){
				event.stopPropagation();
				console.log(nfile, filetype)
				
				if(auth == "ROLE_ADMIN"){
					if(aidx == login_aidx){
						html.delete2(nidx,uuid+nfile,filetype, pt)
					}else {
						alert("슈퍼 계정 혹은 글 작성자만 삭제가 가능합니다")
					}
				}
				else if(auth == "ROLE_S_ADMIN"){
					html.delete2(nidx,uuid+nfile,filetype, pt)
				}
				
				
		},
		left:function(){
			if(pg > 2){
				pg = Number(pg)-1
				location.href = path+'/raemian_admin/notice/notice_main?page='+pg+"&search="+search
			}else if(pg == 2) {
				location.href = path+'/raemian_admin/notice/notice_main?search='+search
			}
		},
		lleft:function(){
			location.href = path+'/raemian_admin/notice/notice_main?search='+search
		},
		right:function(ea){
			if(pg == ""){
				pg = 1
			}
			if(pg < ea){
				pg = Number(pg)+1
				location.href = path+'/raemian_admin/notice/notice_main?page='+pg+"&search="+search
			}
		},
		rright:function(ea){
			if(ea == 0){
				location.href = path+'/raemian_admin/notice/notice_main'
			}else{
				location.href = path+'/raemian_admin/notice/notice_main?page='+ea+"&search="+search
			}
			
		},
		gopage :function(data){
			location.href=path+'/raemian_admin/notice/notice_main?page='+data+"&search="+search
			
		}
		
	}
})