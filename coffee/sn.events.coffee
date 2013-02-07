$ ->
	methods=
		init:(options) ->
			def=
				href:'none'
			$.extend true,def,options
			th=$(this)
			sn=$(this).data 'sn'
			href=def.href
			switch href.replace /(.*)#(.*)/,'$2'
				when "autoload"
					$("#dp1").datePicker()
					$("#dp2").datePicker()
					$(@).snEvents href:'#fbRequest'
					$(@).snPlayer()
				when "signin"
					$("#signin-error").hide()
					$(this).snAjax 'sendRequest',(action:'signin',debug:false)
				when "afterSignin"
					if sn.result
						if sn.result.response
							if sn.result.controls
								$('#controls').html sn.result.controls
							$("#signin").empty()
							$(@).snTriggers 'controls'
							$("#dp1").datePicker()
							$("#dp2").datePicker()
							$(this).snAjax 'sendRequest',(action:'submit',debug:false)
							$(@).snPlayer()
						else
							$("#inputLogin").val ''
							$("#inputPassword").val ''
							$("#signin-error").show()
				when "submit"
					$(this).snAjax 'sendRequest',(action:'submit',debug:false)
				when "afterSubmit"
					if sn.result
						if sn.result.table
							$("#table").html sn.result.table
							$(this).snTriggers 'sort'
							$(this).snTriggers 'detail'
							$(this).snPlayer 'onClickPlay'
						if sn.result.stat
							$("#stat").html sn.result.stat
						if sn.result.pagination
							$("#pagination").html sn.result.pagination
							$(@).snTriggers 'pagination'
						$(@).snEvents href:'#fbRequest'
				when "fbRequest"
					$(".no-fb").each ->
						if $(@).val() != ""
							th.snAjax 'fbRequest',(action:'phone',phone:$(this).val(),debug:false)
							$(this).removeCLass 'no-fb'
				when "afterFbRequest"
					if sn.result
						if sn.result.response
							if sn.result.response.hash
								$("."+sn.result.response.hash).html sn.result.response.caption
				when "close" then $(this).hide()


	$.fn.snEvents= (sn) ->
		sn={} if !sn
		if methods[sn]
			methods[sn].apply @,Array.prototype.slice.call arguments,1
		else 
			if typeof sn=='object' || !sn
				methods.init.apply @,arguments
			else 
				$.error 'Метод '+sn+' не существует'

