/* carousel in left */
const carouselSlide = document.querySelector(".slide_list");
const carouselContents = document.querySelectorAll(".slide_item");

const prevBtn = document.querySelector(".prevBtn");
const nextBtn = document.querySelector(".nextBtn");

let moveBtn = new Array();
for (let i = 0; i < 5; i++) {
	let selector = '.moveBtn_' + i;
	moveBtn[i] = document.querySelector(selector);
}

const playBtn = document.querySelector(".playBtn");
const intervalTime = 3500;
const playBtnValueInPlay =
	'<svg width="6px" height="6px" viewBox="0 0 6 6" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="btn">'
	+ '	<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">'
	+ '		<g transform="translate(-615.000000, -536.000000)" fill="white" fill-rule="nonzero">'
	+ '     	<g transform="translate(330.000000, 192.000000)">'
	+ '         	<g transform="translate(229.000000, 344.000000)">'
	+ '             	<g transform="translate(56.000000, 0.000000)">'
	+ '                 	<rect x="0" y="0" width="1.5" height="6"></rect>'
	+ '                 	<rect x="4.5" y="0" width="1.5" height="6"></rect>'
	+ '              	</g>'
	+ '           	</g>'
	+ '       	</g>'
	+ '   	</g>'
	+ '	</g>'
	+ '	</svg>';
const playBtnValueInStop =
	'<svg width="6px" height="8px" viewBox="0 0 6 8" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns: xlink="http://www.w3.org/1999/xlink" class="btn">'
	+ '	<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">'
	+ '		<g transform="translate(-615.000000, -535.000000)" fill="white">'
	+ '			<g transform="translate(330.000000, 192.000000)">'
	+ '				<g transform="translate(229.000000, 343.000000)">'
	+ '					<g transform="translate(56.000000, 0.000000)">'
	+ '						<polygon points="0 5.69266856e-14 0 8 6 4"></polygon>'
	+ '					</g>'
	+ '				</g>'
	+ '			</g>'
	+ '		</g>'
	+ '	</g>'
	+ '</svg>';
let isPlayed = 1;

//counter
let counter = 1;
const size = carouselContents[0].clientWidth-1;

carouselSlide.style.transform = "translateX(" + -size * counter + "px)";


//Button Listeners
nextBtn.addEventListener("click", () => {
	if (counter >= carouselContents.length - 1) return;
	carouselSlide.style.transition = "transform 0.3s ease-in-out";
	counter++;
	carouselSlide.style.transform = "translateX(" + -size * counter + "px)";
	for (let j = 0; j < 5; j++) {
		if (counter - 1 == j) moveBtn[j].style.background = 'white';
		else moveBtn[j].style.background = 'transparent';
		if (counter == 6 ) moveBtn[0].style.background = 'white';
	}
});

//prevBtn.addEventListener("click", () => {
//	if (counter <= 0) return;
//	carouselSlide.style.transition = "transform 0.3s ease-in-out";
//	counter--;
//	carouselSlide.style.transform = "translateX(" + -size * counter + "px)";
//});

//pager
for (let i = 0; i < 5; i++) {
	let counterNumber = i + 1;
	moveBtn[i].addEventListener("click", () => {
		if (counter <= 0) return;
		carouselSlide.style.transition = "transform 0.3s ease-in-out";
		counter = counterNumber;
		carouselSlide.style.transform = "translateX(" + -size * counter + "px)";
		for (let j = 0; j < 5; j++) {
			if (i == j) moveBtn[j].style.background = 'white';
			else moveBtn[j].style.background = 'transparent';
		}
	});
}


carouselSlide.addEventListener("transitionend", function() {
	if (carouselContents[counter].id === "lastClone") {
		carouselSlide.style.transition = "none";
		counter = carouselContents.length - 2;
		carouselSlide.style.transform = "translateX(" + -size * counter + "px)";
	}
	if (carouselContents[counter].id === "firstClone") {
		carouselSlide.style.transition = "none";
		counter = carouselContents.length - counter;
		carouselSlide.style.transform = "translateX(" + -size * counter + "px)";
	}
});

//auto
let timer = setInterval(() => nextBtn.click(), intervalTime);

playBtn.addEventListener("click", () => {
	if (isPlayed == 1) {
		clearInterval(timer);
		playBtn.innerHTML = playBtnValueInStop;
		playBtn.style.marginTop = '-31.6px';
		isPlayed = 0;
	} else if (isPlayed == 0) {
		timer = setInterval(() => nextBtn.click(), intervalTime);
		playBtn.innerHTML = playBtnValueInPlay;
		isPlayed = 1;
		playBtn.style.marginTop = '-32.6px';
	}

});







/* carousel in center */
const carouselSlide_center = document.querySelector(".slide_list_center");
const carouselContents_center = document.querySelectorAll(".slide_item_center");

const prevBtn_center = document.querySelector(".prevBtn_center");
const nextBtn_center = document.querySelector(".nextBtn_center");

//counter
let counter_center = 1;
const size_center = carouselContents_center[0].clientWidth;

carouselSlide_center.style.transform = "translateX(" + -size_center * counter_center + "px)";


//Button Listeners
nextBtn_center.addEventListener("click", () => {
	if (counter_center >= carouselContents_center.length - 1) return;
	carouselSlide_center.style.transition = "transform 0.3s ease-in-out";
	counter_center++;
	carouselSlide_center.style.transform = "translateX(" + -size_center * counter_center + "px)";
});

prevBtn_center.addEventListener("click", () => {
	if (counter_center <= 0) return;
	carouselSlide_center.style.transition = "transform 0.3s ease-in-out";
	counter_center--;
	carouselSlide_center.style.transform = "translateX(" + -size_center * counter_center + "px)";
});
console.log(carouselContents_center.length);

carouselSlide_center.addEventListener("transitionend", function() {
	if (carouselContents_center[counter_center].id === "lastClone_center") {
		carouselSlide_center.style.transition = "none";
		counter_center = carouselContents_center.length - 2;
		carouselSlide_center.style.transform = "translateX(" + -size_center * counter_center + "px)";
	}
	if (carouselContents_center[counter_center].id === "firstClone_center") {
		carouselSlide_center.style.transition = "none";
		counter_center = carouselContents_center.length - counter_center;
		carouselSlide_center.style.transform = "translateX(" + -size_center * counter_center + "px)";
	}
});