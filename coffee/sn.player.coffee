$ ->
	methods=
		init: ->
			$(this).snPlayer 'onClickPlay'
			$(this).snPlayer 'onClickclose'

		onClickclose: ->
			$("#player-close").on "click",(e) ->
				e.prevEventDefault()
				$("#player-wrap").hide()

		onClickPlay: ->
			$("a.play").on "click",(e) ->
				# do e.prevEventDefault
				id=$(this).data 'id'
				src=$(this).data 'src'
				$("#player-wrap").show()
				$("#player")
					.html('<audio/>')
					.data('id',id)
				audiojs.events.ready ->
					a=audiojs.createAll()
					audio=a[0]
					$("#player-close").on "click",(e) ->
						# do e.prevEventDefault
						audio.pause()
						$("#player").html ''
					audio.load src
					audio.play()

	
	$.fn.snPlayer= (sn) ->
		sn={} if !sn
		if methods[sn]
			methods[sn].apply @,Array.prototype.slice.call arguments,1
		else 
			if typeof sn=='object' || !sn
				methods.init.apply @,arguments
			else 
				$.error 'Метод '+sn+' не существует'

