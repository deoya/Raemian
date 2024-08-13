
var html = new Vue({
	el:"#vueBox",
	data:{
		first : "",
		appdata :""
	},
	methods:{
		appupdate :function(aidx, app){
			this.first = app
			
			if(this.appdata == this.first || this.appdata == "") {
				alert("변경할 사항이 없습니다")
			}else {
				if(aidx == '1' || aidx == '2'){
					alert("해당 계정은 퇴직처리 할 수 없습니다")
					location.reload()
				}else {
					fetch(path+"/raemian_admin/admin/appupdate?aidx="+aidx+"&approval="+this.appdata).then(function(data){
						return data.text();
					}).then(function(data){
						alert("변경이 완료 되었습니다")
						location.reload()
					}).catch(function(){
						alert("오류가 발생하였습니다 [번호:039]")
					})
				}
			}
		},
		app :function(data){
			this.appdata = data.target.value
		},
		all_list : function(){
			f.search_assign.value = "전체"
			f.search.value = ""
			f.submit()
		},
		left:function(){
			if(pg > 2){
				pg = Number(pg)-1
				location.href = path+'/raemian_admin/admin/config_main?page='+pg+"&search="+search+"&search_ch="+search_ch+"&search_assign="+search_assign
			}else if(pg == 2) {
				location.href = path+'/raemian_admin/admin/config_main?search='+search+"&search_ch="+search_ch+"&search_assign="+search_assign
			}
		},
		lleft:function(){
			location.href = path+'/raemian_admin/admin/config_main?search='+search+"&search_ch="+search_ch+"&search_assign="+search_assign
		},
		right:function(ea){
			if(pg == ""){
				pg = 1
			}
			if(pg < ea){
				pg = Number(pg)+1
				location.href = path+'/raemian_admin/admin/config_main?page='+pg+"&search="+search+"&search_ch="+search_ch+"&search_assign="+search_assign
			}
		},
		rright:function(ea){
			if(ea == 0){
				location.href = path+'/raemian_admin/admin/config_main?search='+search+"&search_ch="+search_ch+"&search_assign="+search_assign
			}else {
				location.href = path+'/raemian_admin/admin/config_main?page='+ea+"&search="+search+"&search_ch="+search_ch+"&search_assign="+search_assign
			}
		},
		gopage :function(data){
			location.href = path+'/raemian_admin/admin/config_main?page='+data+"&search="+search+"&search_ch="+search_ch+"&search_assign="+search_assign 
			
		}
		
		
	}
})