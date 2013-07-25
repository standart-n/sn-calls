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
					if $("#controls").html() != ""
						$("#dp1").datepicker()
						$("#dp2").datepicker()
					if $("#table").html() != ""
						$(@).snEvents href:'#fbRequest'
						$(@).snPlayer()
				when "ajaxloader"
					if $("#signin").html() == "" && $("#controls").html() == ""
						$(this).snAjax 'sendRequest',(action:'ajaxloader',debug:false)
				when "afterAjaxloader"
					if sn.result
						if sn.result.signin
							$("#signin").html sn.result.signin
						if sn.result.controls
							$("#controls").html sn.result.controls
						if sn.result.table
							$("#table").html sn.result.table
						if sn.result.stat
							$("#stat").html sn.result.stat
						if sn.result.pagination
							$("#pagination").html sn.result.pagination
						$(@).snTriggers()
						$(@).snEvents href:'#autoload'
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
							$("#dp1").datepicker()
							$("#dp2").datepicker()
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
							$(@).snEvents href:'#fbRequest'
						if sn.result.stat
							$("#stat").html sn.result.stat
						if sn.result.pagination
							$("#pagination").html sn.result.pagination
							$(@).snTriggers 'pagination'
				when "fbRequest"
					$(".no-fb").each ->
						if $(@).val() != ""
							th.snAjax 'sendRequest',(action:'fbRequest',phone:$(this).val(),debug:false)
							$(this).removeClass 'no-fb'
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


