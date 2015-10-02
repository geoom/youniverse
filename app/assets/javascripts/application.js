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


(function($){
	$(function(){

		$('.button-collapse').sideNav();
		$('.modal-trigger').leanModal();


		mixpanel.identify("00000");
		mixpanel.people.set({
			"$email": "anonymous@email.com",    // only special properties need the $

			"$created": "2015-09-01 16:53:54",
			"$last_login": new Date(),         // properties can be dates...

			"gender": "Male"                    // feel free to define your own properties
		});
	});
})(jQuery);
