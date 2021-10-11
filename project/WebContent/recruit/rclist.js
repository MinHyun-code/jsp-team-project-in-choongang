/* mouserover event of ct */
let ct = new Array();
const ct_NUMBER = 100;
const recruit_recommend_container = document.querySelector('#recruit_recommend_container');

let pxTopInitial = 0;
let pxTop = pxTopInitial;
let pxTopUnit = 188;
let pxLeftInitial = 44;
let pxLeft = pxLeftInitial;
let pxLeftUnit = 352;


for (let i = 0; i < ct_NUMBER; i++) {
	let selector = '.ct_' + i;
	ct[i] = document.querySelector(selector);
	if (ct[i] == null) break;
	ct[i].style.position = 'absolute';
	if (i % 4 != 3) {
		ct[i].style.top = pxTop + 'px';
		ct[i].style.left = pxLeft + 'px';
		pxLeft += pxLeftUnit;
	} else if (i % 4 == 3) {
		ct[i].style.top = pxTop + 'px';
		ct[i].style.left = pxLeft + 'px';
		pxTop += pxTopUnit;
		pxLeft = pxLeftInitial;
	}
}

