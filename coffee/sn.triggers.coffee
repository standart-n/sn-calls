$ ->
	methods=
		init: ->
			if $("#controls").html()!=""
				$(this).snTriggers 'controls'
			if $("#table").html()!=""
				$(this).snTriggers 'sort'
				$(this).snTriggers 'detail'
			if $("#pagination").html()!=""
				$(this).snTriggers 'pagination'
			if $("#signin").html()!=""
				$(this).snTriggers 'signin'
		controls: ->
			$(this).snTriggers 'submit'
			$(this).snTriggers 'cb'
			$(this).snTriggers 'limit'
			$(this).snTriggers 'filters'
		signin: ->
			th=$(this)
			$("#fSignin").on "submit",(e) ->
				do e.preventDefault
				th.snEvents href:'#signin'
		submit: ->
			th=$(this)
			$("#fSubmit").on "submit",(e) ->
				do e.preventDefault
				$("page").val 1
				th.snEvents href:'#submit'
			$("#submit").on "click",(e) ->
				do e.preventDefault
				$("page").val 1
				th.snEvents href:'#submit'
		cb: ->
			th=$(this)
			$(".cb").on "click",(e) ->
				do e.preventDefault
				if $(this).is(':checked')
					$('#'+$(this).data 'cb').val 'on'
				else 
					$('#'+$(this).data 'cb').val 'off'
				$("#page").val 1
				th.snEvents href:"#submit"
		limit: ->
			th=$(this)
			sn=$(this).data 'sn'
			$(".filters li a").on "click",(e) ->
				do e.preventDefault
				if $(this).data 'value' == 'on'
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
				$("#page").val 1
				th.snEvents href:"#submit"
		detail: ->
			th=$(this)
			$("a.tel").on "click",(e) ->
				do e.preventDefault
				$("#dst").val do $(this).html
				$("#src").val do $(this).html
				$("#page").val 1
				th.snEvents href:"#submit"
		sort: ->
			th=$(this)
			$("a.sort").on "click",(e) ->
				do e.preventDefault
				$("#order").val $(this).val 'order'
				$("#grad").val $(this).val 'grad'
				$("#page").val 1
				th.snEvents href:"#submit"
		pagination: ->
			th=$(this)
			$("a#prev").on "click",(e) ->
				do e.preventDefault
				$("#page").val $("#page").val()*1-1
				th.snAjax 'sendRequest'
						action:'signin'
						debug:false
			$("a.list").on "click",(e) ->
				do e.preventDefault
				$("#page").val $(this).data "page"
				th.snAjax 'sendRequest'
						action:'signin'
						debug:false
			$("a#next").on "click",(e) ->
				do e.preventDefault
				$("#page").val $("#page").val()*1+1
				th.snAjax 'sendRequest'
						action:'signin'
						debug:false

	$.fn.snTriggers= (sn) ->
		sn={} if !sn
		if methods[sn]
			methods[sn].apply @,Array.prototype.slice.call arguments,1
		else 
			if typeof sn=='object' || !sn
				methods.init.apply @,arguments
			else 
				$.error 'Метод '+sn+' не существует'

