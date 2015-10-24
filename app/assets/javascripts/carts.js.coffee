# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(window).load ->
	$('#add-to-cart-button').click (e) ->
		e.preventDefault()
		$this = $(this)

		url = $this.data('url')

		size = $("select[name='item-size']").val()
		sex = $("input[name='item-sex']").val()
		item_id = $("input[name='item-id']").val()
		price = $("input[name='item-price']").val()

		debugger

		if is_valid_data(item_id, size, sex, price)

			data =
				"size": size
				"sex": sex
				"item_id": item_id
				"price": price


			$.ajax url: url, data: data, type: 'put', success: (data) ->
				$('.cart-count').html(data)


	is_valid_data = (id, size, sex, price) ->
		if id is ''
			alert('You must to select a model')
			return false
		if not size? or typeof size is 'undefined'
			alert('You must to select a size')
			return false
		if sex is ''
			alert('data is invalid: sex is missing')
			return false
		if price is ''
			alert('data is invalid: price is missing')
			return false
		return true

