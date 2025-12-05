/**
 * 
 */

const list = document.getElementById("list");
let num = list.getAttribute("data-product-num");
const commentAdd = document.getElementById("commentAdd");
const contents = document.getElementById("contents");
const close = document.getElementById("close");
const pageLink = document.getElementsByClassName("page-link");
commentList(1);

list.addEventListener("click", (e) => {
	let t = e.target;
	if(t.classList.contains("page-link")){
		let p = t.getAttribute("data-pager-num")
		commentList(p);
	}
})

function commentList(page) {
	
fetch(`./commentList?productNum=${num}&page=${page}`)
  .then(r => r.text())
  .then(r => {
		list.innerHTML = r;
	

  })
  .catch(e => console.log(e))
	
	
}

	
  
  
  
commentAdd.addEventListener("click" , () => {
	
	const param = new URLSearchParams();
	param.append("productNum" , num);
	param.append("boardContents" , contents.value);
	fetch("commentAdd", {
		method: "post",
		body: param 
	})
	.then(r => r.json())
	.then(r => {
		if(r==1){
			commentList(1);
		}
	})
	.catch(e => console.log(e))
	.finally(() => {
		contents.value = "";
		close.click();
	})
	
})