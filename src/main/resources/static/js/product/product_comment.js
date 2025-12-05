/**
 * 
 */

const list = document.getElementById("list");
let num = list.getAttribute("data-product-num");

fetch(`./commentList?productNum=${num}`)
  .then(r => r.json())
  .then(r => {
		list.innerHTML = "";
    r.forEach(element => {
		const wrapper = document.createElement("div");
		wrapper.classList.add("comment-bubble");

		wrapper.innerHTML = `
		  <div class="bubble-user">${element.username}</div>
		  <div class="bubble-box">
		    <span class="bubble-text">${element.boardContents}</span>
		  </div>
		  <div class="bubble-date">${element.boardDate}</div>
		`;

		list.append(wrapper);
    });
	

  })
  .catch(e => console.log(e))