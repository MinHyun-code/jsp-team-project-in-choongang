function replaceToBr(tagName) {
	var tag = document.getElementsByClassName(tagName);
	for (var i = 0; i < tag.length; i++) {
		var str = tag[i].innerHTML;
		str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		tag[i].innerHTML = str;
	}
}