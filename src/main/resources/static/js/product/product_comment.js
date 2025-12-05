/**
 * 
 */

const list = document.getElementById("list");
let num = list.getAttribute("data-product-num");

fetch(`./commentList?productNum=${num}`)
  .then(r => r.text())
  .then(r => {
	list.innerHTML=r;
  })
  .catch(e => console.log(e))