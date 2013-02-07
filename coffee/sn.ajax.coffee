$ ->
	methods= 
		init:(options) ->
		sendRequest:(options) ->
			options={} if !options
			def=
				type:'json'
				debug:false
				action:'submit'
				login:$('#inputLogin').val()
				password:$('#inputPassword').val()
				page:$('#page').val()
				id:''
				message:''
				src:$('#src').val()
				dst:$('#dst').val()
				date1:$('#date1').val()
				date2:$('#date2').val()
				limit:$('#limit').val()
				order:$('#order').val()
				grad:$('#grad').val()
				phone:''
				show_short_calls:$('#show_short_calls').val()
				show_answered:$('#show_answered').val()
				show_no_answer:$('#show_no_answer').val()
				show_busy:$('#show_busy').val()
				show_failed:$('#show_failed').val()
				show_hangup:$('#show_hangup').val()
				show_playback:$('#show_playback').val()
				show_dial:$('#show_dial').val()
				show_wait:$('#show_wait').val()
			$.extend true,def,options
			def.type='text' if def.debug
			sn=$(@).data('sn');
			$.ajax 
				url:'index.php'
				type:'POST'
				data:
					action:def.action
					page:def.page
					login:def.login
					password:def.password
					id:def.id
					message:def.message
					src:def.src
					dst:def.dst
					date1:def.date1
					date2:def.date2
					limit:def.limit
					order:def.order
					grad:def.grad
					phone:def.phone
					show_short_calls:def.show_short_calls
					show_answered:def.show_answered
					show_no_answer:def.show_no_answer
					show_busy:def.show_busy
					show_failed:def.show_failed
					show_hangup:def.show_hangup
					show_playback:def.show_playback
					show_dial:def.show_dial
					show_wait:def.show_wait
					key:sn.result.key
				dataType:def.type
				timeout:10000
				beforeSend: ->
					$("#loading").show()
				success: (s) ->
					if typeof s=='object'
						$.extend true,sn.result,s
					else 
						alert s if def.debug
						sn.result=s
					$(@).data('sn',sn)
					if typeof sn.result=='object'
						alert sn.result.alert if sn.result.alert
						$(@).snEvents href:'#'+sn.result.callback if sn.result.callback
					$("#loading").hide()
				error: (XMLHttpRequest,textStatus,error) ->
				
	$.fn.snAjax= (sn) ->
		sn={} if !sn
		if methods[sn] 
			methods[sn].apply @,Array.prototype.slice.call arguments,1
		else 
			if typeof sn=='object' || !sn
				methods.init.apply @,arguments
			else 
				$.error 'Метод '+sn+' не существует'



