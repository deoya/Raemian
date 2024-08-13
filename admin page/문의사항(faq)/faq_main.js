
var html = new Vue({
	el:"#vueBox",
	data:{
		prevClickedId: null
	},
	methods:{
		viewAnswer :function(data){
			console.log(data)
			var id = document.getElementById("answer_"+data)
            if (this.prevClickedId !== null) {
                var prevId = document.getElementById("answer_" + this.prevClickedId);
                prevId.style.display = "none";
            }
            if (id.style.display === "none") {
                id.style.display = "flex";
            } else {
                id.style.display = "none";
            }
            this.prevClickedId = data;
		},
		delete1 :function(fqidx){
			if(confirm("해당 데이터를 삭제하시겠습니까?")){
				fetch(path+"/raemian_admin/faq/delete?fqidx="+fqidx).then(function(data){
					return data.text();
				}).then(function(data){
					alert(data)
					location.reload()
				}).catch(function(e){
					alert("삭제에 실패했습니다 [번호 : 020]")
				})
			}
		},
		del :function(event, fqidx, aidx, login_aidx,auth){
				event.stopPropagation();
				if(auth == "ROLE_ADMIN"){
					if(aidx == login_aidx){
						html.delete1(fqidx)
					}else {
						alert("슈퍼 계정 혹은 글 작성자만 삭제가 가능합니다")
					}
				}
				else if(auth == "ROLE_S_ADMIN"){
					html.delete1(fqidx)
				}
		},
		left:function(){
			if(pg > 2){
				pg = Number(pg)-1
				location.href = path+'/raemian_admin/faq/faq_main?page='+pg+"&search="+search
			}else if(pg == 2) {
				location.href = path+'/raemian_admin/faq/faq_main?search='+search
			}
		},
		lleft:function(){
			location.href = path+'/raemian_admin/faq/faq_main?search='+search
		},
		right:function(ea){
			if(pg == ""){
				pg = 1
			}
			if(pg < ea){
				pg = Number(pg)+1
				location.href = path+'/raemian_admin/faq/faq_main?page='+pg+"&search="+search
			}
		},
		rright:function(ea){
			if(ea == 0){
				location.href = path+'/raemian_admin/faq/faq_main?search='+search
			}else{
				location.href = path+'/raemian_admin/faq/faq_main?page='+ea+"&search="+search
			}
			
		},
		gopage :function(data){
			location.href = path+'/raemian_admin/faq/faq_main?page='+data+"&search="+search
			
		}
			
	},
	mounted: function() {
            document.addEventListener("click", function(event) {
                var target = event.target;
                var faqBox = document.getElementById("vueBox");
                
                if (!faqBox.contains(target)) {
                    var id = document.getElementById("answer_" + html.prevClickedId);
                    if (id) {
                        id.style.display = "none";
                        html.prevClickedId = null;
                    }
                }
            });
        }
})