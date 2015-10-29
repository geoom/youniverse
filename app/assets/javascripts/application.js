// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize-sprockets
//= require carts

(function ($) {
	$(function () {

		$('.button-collapse').sideNav();
		$('.modal-trigger').leanModal();

		mixpanel.identify("00000");
		mixpanel.people.set({
			"$email": "anonymous@email.com",
			"$created": "2015-09-01 16:53:54",
			"$last_login": new Date(),
			"gender": "Male"
		});

		$(".image").click(function () {
			var image = $(this).attr("rel");

			var item_id = $(this).attr("id");
			var sex = $(this).attr("sex");
			var price = $(this).attr("price");

			var menSizeOptions = "<label>Select size for men</label><select name='item-size' class='browser-default'><option value='' disabled selected>Choose your option</option><option value='s'>S</option><option value='m'>M</option><option value='l'>L</option><option value='xl'>XL</option></select>";
			var womanSizeOptions = "<label>Select size for woman</label><select name='item-size' class='browser-default'><option value='' disabled selected>Choose your option</option><option value='s'>S</option><option value='m'>M</option><option value='l'>L</option><option value='xl'>XL</option></select>";
			var unisexSizeOptions = "<label>Select size for unisex</label><select name='item-size' class='browser-default'><option value='' disabled selected>Choose your option</option><option value='xs'>XS</option><option value='s'>S</option><option value='m'>M</option><option value='l'>L</option><option value='xl'>XL</option></select>";


			$('#image').hide();
			$('#image').fadeIn('slow');
			$('#image').html('<img src="' + image + '" width="500" />');

			$('.model-options').find('.thumb.selected').removeClass('selected');

			var image_thumb = $(this).find('.thumb');
			image_thumb.addClass('selected');


			if(sex != undefined){
				if(sex == 'm'){
					$('.size-options').html(menSizeOptions);
				}else if(sex == 'f'){
					$('.size-options').html(womanSizeOptions);
				}else if(sex == 'u'){
					$('.size-options').html(unisexSizeOptions);
				}
				$("input[name='item-sex']").val(sex);
			}else{
				$('.size-options').html('<p><strong>Select a model below</strong></p>');
				$("input[name='item-sex']").removeAttr('value');
			}


			if(item_id != undefined){
				$("input[name='item-id']").val(item_id);
			}else{
				$("input[name='item-id']").removeAttr('value');
			}


			if(price != undefined){
				$("input[name='item-price']").val(price);
				$('.item-price').html('<p><strong>$ '+ price +' </strong></p>');
			}else{
				$("input[name='item-price']").removeAttr('value');
				$('.item-price').html('');

			}

			return false;
		});

	});
})(jQuery);
