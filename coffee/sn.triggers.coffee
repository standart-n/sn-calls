"use strict"
$ ->
	methods=
		init: ->
			if $("#bar").html()!=""
				$(this).snTriggers 'bar'
			if $("#controls").html()!=""
				$(this).snTriggers 'controls'
			if $("#table").html()!=""
				$(this).snTriggers 'sort'
				$(this).snTriggers 'detail'
			if $("#pagination").html()!=""
				$(this).snTriggers 'pagination'
			if $("#signin").html()!=""
				$(this).snTriggers 'signin'

		bar: ->
			$(this).snTriggers 'logout'
		controls: ->
			$(this).snTriggers 'submit'
			$(this).snTriggers 'cb'
			$(this).snTriggers 'limit'
			$(this).snTriggers 'filters'
		signin: ->
			th=$(this)
			$("#fSignin").on "submit",(e) ->
				e.preventDefault()
				th.snEvents href:'#signin'
		logout: ->
			th=$(this)
			$("#logout").on "click",(e) ->
				e.preventDefault()
				th.snEvents href:'#logout'
		submit: ->
			th=$(this)
			$("#fSubmit").on "submit",(e) ->
				e.preventDefault()
				$("#page").val '1'
				th.snEvents href:'#submit'
			$("#submit").on "click",(e) ->
				e.preventDefault()
				$("#page").val '1'
				th.snEvents href:'#submit'
		limit: ->
			th=$(this)
			sn=$(this).data 'sn'
			$(".limit a").on "click",(e) ->
				e.preventDefault()
				$(this)
					.addClass('active')
					.siblings()
					.removeClass('active')
				$('#limit').val $(this).data 'limit'
				$("#page").val '1'
				th.snEvents href:'#submit'
		cb: ->
			th=$(this)
			$(".cb").on "click",(e) ->
				e.preventDefault()
				if $(this).is(':checked')
					$('#'+$(this).data 'cb').val 'on'
				else 
					$('#'+$(this).data 'cb').val 'off'
				$("#page").val '1'
				th.snEvents href:"#submit"
		filters: ->
			th=$(this)
			sn=$(this).data 'sn'
			$(".filters li a").on "click",(e) ->
				e.preventDefault()
				if $(this).data('value') == 'on'
					$('i',this)
						.removeClass('icon-ok')
						.addClass('icon-none')
					$(this).data 'value','off'
					$('#'+$(this).data('cb')).val 'off'
				else
					$('i',this)
						.removeClass('icon-none')
						.addClass('icon-ok')
					$(this).data 'value','on'
					$('#'+$(this).data('cb')).val 'on'
				$("#page").val '1'
				th.snEvents href:"#submit"
		detail: ->
			th=$(this)
			$("a.tel").on "click",(e) ->
				e.preventDefault()
				$("#dst").val $(this).html()
				$("#src").val $(this).html()
				$("#page").val '1'
				th.snEvents href:"#submit"
		sort: ->
			th=$(this)
			$("a.sort").on "click",(e) ->
				e.preventDefault()
				$("#order").val $(this).data 'order'
				$("#grad").val $(this).data 'grad'
				$("#page").val '1'
				th.snEvents href:"#submit"
		pagination: ->
			th=$(this)
			$("a#prev").on "click",(e) ->
				e.preventDefault()
				$("#page").val ($("#page").val()*1)-1
				th.snEvents href:"#submit"
			$("a.list").on "click",(e) ->
				e.preventDefault()
				$("#page").val $(this).data "page"
				th.snEvents href:"#submit"
			$("a#next").on "click",(e) ->
				e.preventDefault()
				$("#page").val ($("#page").val()*1)+1
				th.snEvents href:"#submit"

	$.fn.snTriggers= (sn) ->
		sn={} if !sn
		if methods[sn]
			methods[sn].apply @,Array.prototype.slice.call arguments,1
		else 
			if typeof sn=='object' || !sn
				methods.init.apply @,arguments
			else 
				$.error 'Метод '+sn+' не существует'

