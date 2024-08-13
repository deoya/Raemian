

window.onload = function(){ 
	var ck = CKEDITOR.replace("incontent",{
		height:395
	});
}

var html = new Vue({
	el:"#vueBox",
	data:{
		maxSize :  2097152, //2MB
		msg : "",
		filecked : "yes",
	},
	methods:{
		fileajax : function(data){
			if(data.target.files.length > 3){
				alert("파일은 총 3개까지 업로드가 가능합니다")
				f.ajaxfile.value = "";
			}else {
				if(data.target.files[0] == undefined){ // 파일 없앴을 시 리셋
					document.getElementById("fileul").innerHTML = "";
				}
				// 파일 확장자 제한
				var regex = new RegExp("(.*?)\.(exe|sh|zip|alz|pdf)$");
				if(data.target.files[0] != null) {
					if(data.target.files[0].size > this.maxSize){
						this.msg = "파일은 2MB 이하만 등록이 가능합니다"
						this.filecked = "no"
					}
					else if(regex.test(data.target.files[0].name)){
						this.msg = "해당 파일은 등록이 불가능 합니다"
						this.filecked = "no"
					}else {
						this.filecked = "yes"
						
						fetch(path+"/raemian_admin/notice/fileajax",{
							method:'post',
							body: new FormData(document.getElementById('f')) 
						}).then(function(file){
							return file.json()
						}).then(function(file){
							//jsp에 추가
							var i = 0;
							var s = "";
							while(i < file.length){
								if(file[i]["filetype"] ==  "I"){
									s += "<li>"
									  + "<img src='http://deoya.cdn1.cafe24.com/"+file[i]["uploadPath"]+"s_"+file[i]["uuid"]+file[i]["nfile"]+"'>"
									  + "<input type='hidden' name='uploadPaths' value='"+file[i]["uploadPath"]+"'>"
									  + "<input type='hidden' name='uuids' value='"+file[i]["uuid"]+"'>"
									  + "<input type='hidden' name='files' value='"+file[i]["nfile"]+"'>"
									  + "<input type='hidden' name='types' value='"+file[i]["filetype"]+"'>"
									  + "</li>"
								}else {
									s += "<li><img src='/r/resources/img/attach.png'></li>"
								}
								i++;
							}
							
							document.getElementById("fileul").innerHTML = s;
							
						}).catch(function(e){
							alert("오류가 발생했습니다. 다음에 다시 시도하여주세요 [번호 : 044]")
						})
					}	
				}
			}
		},
		insert:function(){
			var ck = CKEDITOR.instances.incontent.getData();
			if(f.ntitle.value == "" || ck == ""){
				alert("내용을 채워주세요")
			}else if(this.filecked == "no"){
				alert(this.msg)
			}else {
				f.action=path+"/raemian_admin/notice/insert"
				f.method="post"
				f.enctype="multipart/form-data"
				f.submit();
				
			}
		}
	}
})