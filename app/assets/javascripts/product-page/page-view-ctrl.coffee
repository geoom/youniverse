
(->
	PageViewCtrl = ()->

		@name = 'my name'

		@sendMessage = ()->
			return 12

		return

	angular
	.module('productPage')
	.controller('PageViewCtrl', PageViewCtrl)
)()