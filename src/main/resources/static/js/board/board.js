


const fileAddBtn = document.getElementById("fileAddBtn");
const files = document.getElementById("files");



files.addEventListener("click" , (e) => {
	let element = e.target;
	if(element.classList.contains("del")){
		element.parentElement.remove();
	}
});


fileAddBtn.addEventListener("click", () => {
	
	let count = document.getElementsByClassName("del").length;
	
	if(count > 4){
		
		alert("너무 많아 그만해");
		return;
		
	}
	
	
	
	
	let div = document.createElement("div");
	let input = document.createElement("input");
	
	input.setAttribute("type","file");
	input.name="attach";
	
	let button = document.createElement("button");
	button.type = "button";
	button.classList.add("del");
	button.innerText = "X";
	
	
	div.append(input);
	div.append(button);
	
	files.append(div);
	
});
