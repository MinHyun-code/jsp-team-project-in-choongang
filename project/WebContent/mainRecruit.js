/* mouserover event of recruit_recommend_division */
let recruit_recommend_division = new Array();
const recruit_recommend_division_NUMBER = 100;
const recruit_recommend_container = document.querySelector('#recruit_recommend_container');

let pxTopInitial = 0;
let pxTop = pxTopInitial;
let pxTopUnit = 192;
let pxLeftInitial = 44;
let pxLeft = pxLeftInitial;
let pxLeftUnit = 296;
let pxHeightMouseout = 146;
let pxHeightMouseover = 338;
let pxHeightMouseoutOfContainer = 945;
let pxHeightMouseoverOfContainer = pxHeightMouseoutOfContainer + (pxHeightMouseover - pxHeightMouseout);

for (let i = 0; i < recruit_recommend_division_NUMBER; i++) {
	let selector = '.recruit_recommend_division_' + i;
	recruit_recommend_division[i] = document.querySelector(selector);
	if (recruit_recommend_division[i] == null) break;
	recruit_recommend_division[i].style.position = 'absolute';
	if (i % 4 != 3) {
		recruit_recommend_division[i].style.top = pxTop + 'px';
		recruit_recommend_division[i].style.left = pxLeft + 'px';
		pxLeft += pxLeftUnit;
	} else if (i % 4 == 3) {
		recruit_recommend_division[i].style.top = pxTop + 'px';
		recruit_recommend_division[i].style.left = pxLeft + 'px';
		pxTop += pxTopUnit;
		pxLeft = pxLeftInitial;
	}
}

for (let i = 0; i < recruit_recommend_division_NUMBER; i++) {
	if (recruit_recommend_division[i + 4] == null) {
		if (recruit_recommend_division[i] != null) {
			recruit_recommend_division[i].addEventListener('mouseover', () => {
				recruit_recommend_division_style_mouseover(i);
//				recruit_recommend_container.style.height = pxHeightMouseoverOfContainer + 'px';
			});
			recruit_recommend_division[i].addEventListener('mouseout', () => {
				recruit_recommend_division_style_mouseout(i);
//				recruit_recommend_container.style.height = pxHeightMouseoutOfContainer + 'px';
			});
		} else break;
	} else {
		recruit_recommend_division[i].addEventListener('mouseover', () => {
			recruit_recommend_division_style_mouseover(i);
			recruit_recommend_division[i + 4].style.display = 'none';
		});
		recruit_recommend_division[i].addEventListener('mouseout', () => {
			recruit_recommend_division_style_mouseout(i);
			recruit_recommend_division[i + 4].style.display = 'block';
		});
	}

}

function recruit_recommend_division_style_mouseover(i) {
	recruit_recommend_division[i].style.height = pxHeightMouseover + 'px';
//	recruit_recommend_division[i].style.borderColor = 'rgb(22 98 192)';
	recruit_recommend_division[i].style.borderColor = 'rgb(19 72 137)';
	recruit_recommend_division[i].style.borderWidth = '2px';
	recruit_recommend_division[i].style.borderTopWidth = '5px';
	recruit_recommend_division[i].style.paddingLeft = '9px';
	recruit_recommend_division[i].style.paddingRight = '9px';

}

function recruit_recommend_division_style_mouseout(i) {
	recruit_recommend_division[i].style.height = pxHeightMouseout + 'px';
	recruit_recommend_division[i].style.borderColor = '#6686d5';
	recruit_recommend_division[i].style.borderWidth = '1px';
	recruit_recommend_division[i].style.borderTopWidth = '5px';
	recruit_recommend_division[i].style.paddingLeft = '10px';
	recruit_recommend_division[i].style.paddingRight = '10px';
}