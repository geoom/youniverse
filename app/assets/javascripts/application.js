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
//= require angular
//= require angular-route
//= require angular-resource
//= require angular-rails-templates
//= require_tree ./../templates

//= require product-page/product-page.module
//= require product-page/page-view-ctrl

//= require ynvrs/dist/js/ynvrs.js
//= require carts
//
//$(document).on('ready page:load', function() {
//	angular.bootstrap(document.body, ['app'])
//});


//angular.module('app', [
//	'ngRoute',
//	'productPage']);
//
//angular.module('app').config(['$routeProvider', '$locationProvider', '$httpProvider',
//	function ($routeProvider, $locationProvider, $httpProvider) {
////		$routeProvider.otherwise({redirectTo:'/404'});
//		$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
////		$locationProvider.html5Mode({
////			enabled: true
////		});
//	}]);

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

			var menSizeOptions = "<label>Elige tamaño (hombre)</label><select name='item-size' class='browser-default'><option value='' disabled selected>Escoge tu opción</option><option value='s'>S</option><option value='m'>M</option><option value='l'>L</option><option value='xl'>XL</option></select>";
			var womanSizeOptions = "<label>Elige tamaño (mujer)</label><select name='item-size' class='browser-default'><option value='' disabled selected>Escoge tu opción</option><option value='s'>S</option><option value='m'>M</option><option value='l'>L</option><option value='xl'>XL</option></select>";
			var unisexSizeOptions = "<label>Elige tamaño (unisex)</label><select name='item-size' class='browser-default'><option value='' disabled selected>Escoge tu opción</option><option value='xs'>XS</option><option value='s'>S</option><option value='m'>M</option><option value='l'>L</option><option value='xl'>XL</option></select>";


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
				$('.size-options').html('<p><strong>Selecciona un modelo abajo</strong></p>');
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
