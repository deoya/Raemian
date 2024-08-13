
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