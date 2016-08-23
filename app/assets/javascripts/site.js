var refreshRating = function(){ 
	$('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' }); //specified where the image assets are found
	$('.rated').raty( {path: '/assets',
		readOnly: true,
		score: function() {
			return $(this).attr('data-score');
		}
	});
};

$(document).on('turbolinks:load ajaxSuccess', function() {
	refreshRating();

	// jQuery for elevateZoom-JS
	$('.img-zoom').elevateZoom({
		zoomType: "lens",
		lensShape: "round",
		lensSize: 200, 
		lensFadeIn: 500,
		lensFadeOut: 500, 
		scrollZoom: true
	});
});