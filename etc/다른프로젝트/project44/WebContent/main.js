$(() => {
	$('.community_info_2_subject,.community_info_2_content').hover(() => {
		communityCloseContent('.community_info_1_content');
		communityOpenContent('.community_info_2_content');
	}, () => {
		communityCloseContent('.community_info_2_content');
		communityOpenContent('.community_info_1_content');
	})

	$('.community_info_3_subject,.community_info_3_content').hover(() => {
		communityCloseContent('.community_info_1_content');
		communityOpenContent('.community_info_3_content');
	}, () => {
		communityCloseContent('.community_info_3_content');
		communityOpenContent('.community_info_1_content');
	})

	$('.community_info_4_subject,.community_info_4_content').hover(() => {
		communityCloseContent('.community_info_1_content');
		communityOpenContent('.community_info_4_content');
	}, () => {
		communityCloseContent('.community_info_4_content');
		communityOpenContent('.community_info_1_content');
	})

})

function communityCloseContent(tagName) {
	$(tagName).css('display', 'none');
	$(tagName+'_triangle').html('▲');
}

function communityOpenContent(tagName) {
	$(tagName).css('display', 'table-row');
	$(tagName+'_triangle').html('▼');
	
}