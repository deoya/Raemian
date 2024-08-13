
var html = new Vue({
	el : "#vueBox",
	data : {
		ad_ck : [],
		acc_ck : false,
		acc_num : "",
		idcheck : false
	},
	methods : {
		idck:function(){
			if(f.cid.value.length < 6){
				alert("아이디는 6글자 이상 입력해 주세요")
			}else {
				fetch(path+"/raemian_client/idcheck?cid="+f.cid.value).then(function(data){
					return data.text();
				}).then(function(data){
					if(data == "no"){
						alert("해당 아이디는 사용이 불가능 합니다")
					}
					else{
						alert("해당 아이디는 사용이 가능합니다")
						f.cid.readOnly = true
						html.idcheck = true
					}
					
				}).catch(function(error){
					alert("오류 발생 [번호 : 032]")
				})
			}			
		},
		insert : function(){
			this.ad_ck = []
			var i = 0;
			while(i <= 3){
				if(f.ad[i].checked){ this.ad_ck.push('Y')
				}else { this.ad_ck.push('N')}
				i++;
			}
			const etc_ck = /[^a-zA-Z0-9가-힣]/
			const em_ck = /[0-9a-z]+\@[0-9a-z]+\.[a-z]+/i;
			
			if(f.cname.value == "" || f.cid.value == "" ||f.cpwd.value == "" ||f.cadrr_n.value == "" ||f.cadrr_2.value == ""){
				alert("필수사항은 모두 채워주세요")
			}else if(etc_ck.test(f.cname.value)){
				alert("이름은 특수문자는 제외하고 입려하여 주세요")
			}else if(!this.idcheck) {
				alert("중복확인을 진행해주세요")
			}else if (f.cpwd.value.length < 8){
				alert("비밀번호는 8자 이상 입력해주세요")
			}else if (f.cpwd.value != f.cpwd_ck.value){
				alert("비밀번호가 서로 다릅니다")
			}else if(!this.acc_ck){
				alert("핸드폰 인증을 진행해 주세요")
			}else if(f.cemail.value != "" && !em_ck.test(f.cemail.value)){
				alert("이메일을 다시 확인하여 주세요")
			}else {
				f.cad.value = this.ad_ck
				f.action = path+"/raemian_client/insert"
				f.enctype="application/x-www-form-urlencoded"
				f.method = "post"
				f.submit();
			}
		},
		email :function(data){
			if(data.target.value == ''){
				f.ad[0].checked = false;
				f.ad[0].disabled = true;
			}else {
				f.ad[0].disabled = false;
			}
		},
		adress_post : function (){
			new daum.Postcode({
			        oncomplete: function(data) {
				            var addr = ''; // 주소 변수
			                var extraAddr = ''; // 참고항목 변수
			
			                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                    addr = data.roadAddress;
			                } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                    addr = data.jibunAddress;
			                }
			
			                if(data.userSelectedType === 'R'){
			                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                        extraAddr += data.bname;
			                    }
			                    if(data.buildingName !== '' && data.apartment === 'Y'){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    if(extraAddr !== ''){
			                        extraAddr = ' (' + extraAddr + ')';
			                    }
			                	f.cadrr_1.value = extraAddr;
			                
			                } else {
			                	f.cadrr_1.value = '';
			                }
				        		f.cadrr_n.value = data.zonecode;
				        		f.cadrr_1.value = addr;
				        }	
				}).open();
		},
		accreditation :function(){
			const num_ck= /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/
			if(num_ck.test(f.ctel.value)){
				
				fetch(path+"/raemian_client/tel_ck?ctel="+f.ctel.value).then(function(data){
					return data.text();
				}).then(function(data){
					alert("인증번호가 발송되었습니다")
					f.tel_save.value = f.ctel.value
					html.acc_num = data
					mb_btn1.style.display = "inline-block"
				}).catch(function(){
					alert("오류가 발생하였습니다 [번호 : 031]")
				})
			}else {
				alert("번호를 정확히 입력해주세요")
				f.ctel.value = ""
			}
		},
		accreditation_ck :function(){
			if(this.acc_ck_num != ""){
				if(f.acc_num_ck.value == this.acc_num){
					alert("본인 인증이 확인 되었습니다")
					f.ctel.value = f.tel_save.value
					f.ctel.readOnly = true
					f.acc_num_ck.readOnly = true
					mb_btn1.style.display = "none"
					this.acc_ck = true
					
				}else{
					alert("인증번호를 다시 입력하여 주세요")
				}
			}
		}
		
	}
})