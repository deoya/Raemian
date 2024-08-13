
var html = new Vue({
	el:"#vueBox",
	data:{
		maxSize : 10485760, // 10MB
		msg : "",
		filecked : "zero",
		currentUrl : window.location.href.substring(46) // 만약 수정이었을 경우 체크용
	},
	methods:{
		fileck:function(data){
			var imageExtensions = /\.(jpg|jpeg|png|gif)$/i;
			
			if(data.target.files[0] != null) {
				if(data.target.files[0].size > this.maxSize){
					this.msg = "파일은 10MB 이하만 등록이 가능합니다"
					this.filecked = "no"
				}
				else if(!imageExtensions.test(data.target.files[0].name)){
					this.msg = "이미지 파일만 등록이 가능합니다"
					this.filecked = "no"
				}else {
					this.filecked = "yes"
				}	
			}else {
				this.filecked = "zero"
			}
		},
		insert:function(){
			console.log(this.filecked)
			var urlck = /\d/;
			var number = /^-?\d*\.?\d+$/;
			var number2 = /^[0-9]+$/;
			console.log(!number.test(f.ftype.value))
			// 만약 수정이었을 경우 파일 첨부 안하면 이전 파일 유지인것임으로 확인
			if(urlck.test(this.currentUrl)){
				this.filecked = "yes"
			}
			
			if(f.ftype.value == "" || f.household.value == "" || f.houseShared.value == "" || f.etcShared.value == "" || f.contractArea.value == "" || f.foutputOrder.value == ""){
				alert("빈칸을 모두 채워주세요")
			}else if(!number.test(f.ftype.value) ||!number.test(f.household.value) ||!number.test(f.houseShared.value) ||!number.test(f.etcShared.value) ||!number.test(f.contractArea.value) ||!number.test( f.foutputOrder.value) ){
				alert("숫자만 입력해주세요")
			}else if(!number2.test( f.foutputOrder.value)){
				alert("출력순서는 정수로만 입력해주세요")
			}else if(this.filecked == "no") {
				alert(this.msg)
			}else if (this.filecked == "zero"){
				alert("이미지는 필수입니다")
			}else {
			f.method="post"
			f.enctype="multipart/form-data"
			f.action=path+"/raemian_admin/info/insert"
			f.submit();
			}
		},
		countck : function(){
			fetch(path+"/raemian_admin/info/usecount").then(function(data){
				return data.text();
			}).then(function(data){
				html.ck_end(data)
			}).catch(function(error){
				alert("오류 발생 [번호 : 022]")
			})
		},
		ck_end :function(data){
			if(data == "no") {
				alert("사용할 수 있는 데이터는 4개까지만 가능합니다")
				document.querySelector('input[type="radio"][value="X"]').checked = true ;
			}
		}
	}
})