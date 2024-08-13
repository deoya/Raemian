window.onload = function(){
	var ck = CKEDITOR.replace("incontent",{
		height:395
	});
}


var html = new Vue({
	el:"#vueBox",
	data:{
	},
	methods:{
		
		insert:function(){
			var ck = CKEDITOR.instances.incontent.getData();
			if(f.fqtitle.value == "" || ck == ""){
				alert("내용을 채워주세요")
			}else {
				f.action=path+"/raemian_admin/faq/insert"
				f.method="post"
				f.enctype="application/x-www-form-urlencoded"
				f.submit();
				
			}
			
		}
	}
})