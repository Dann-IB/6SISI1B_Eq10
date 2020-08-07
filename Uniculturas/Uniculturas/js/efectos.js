$(document).ready(function(){

	$('.menu a').each(function(index, elemento){
		$(this).css({
			 'top': '-200px'
		}); 

		$(this).animate({
			top: '0'
		}, 1000 + (index * 1000));

	});

	if( $(window).width() > 800 ){
		$('header .textos').css({
			opacity: 0,
			marginTop: 0

		});

		$('header .textos').animate({
		opacity: 1,
		marginTop: '-52px'

		}, 3000);

	}


	$('#boton-acerca').on('click', function(e){
		e.preventDefault();
		$('html, body').animate({
			scrollTop: 680
		}, 1000);
	});





});
