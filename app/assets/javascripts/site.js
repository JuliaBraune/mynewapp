$(document).on('turbolinks:load', function(){ 
	$('rating').raty( { path: '/assets', scoreName: 'comment[rating]' }); //specified where the image assets are found
	$('.rated').raty( {path: '/assets',
		readOnly: true,
		score: function() {
			return $(this).attr('data-score');
		}
	});
});