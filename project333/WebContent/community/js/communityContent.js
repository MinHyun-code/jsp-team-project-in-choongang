function funcReplyBox(a, widthValue){
	console.log(a);
	let c = document.getElementsByClassName('comment_reply_box_'+a);
	console.log(c);
	console.log(c[0]);
	c[0].style.width=widthValue;
	c[0].style.display='inline-block';
	
	let btn = document.getElementsByClassName('btn_reply_'+a);
	btn[0].style.display='none';
	
	let btn2 = document.getElementsByClassName('btn_reply2_'+a);
	btn2[0].style.display='inline-block';
}

$(()=>{
	replaceToBr('community_content');
})

