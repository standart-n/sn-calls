(function($){

	var methods={
		init:function(options)
		{
			return this.each(function(){

			});
		},
		sendRequest:function(options)
		{
			if (!options) { options={}; }
			var def={
				'type':'json',
				'debug':false,
				'action':'submit',
				'src':$('#src').val(),
				'dst':$('#dst').val(),
				'date1':$('#date1').val(),
				'date2':$('#date2').val(),
				'page':$('#page').val(),
				'limit':$('#limit').val(),
				'order':$('#order').val(),
				'grad':$('#grad').val(),
				'login':$('#inputLogin').val(),
				'password':$('#inputPassword').val(),
				'phone':'',
				'show_short_calls':$('#show_short_calls').val(),
				'show_answered':$('#show_answered').val(),
				'show_no_answer':$('#show_no_answer').val(),
				'show_busy':$('#show_busy').val(),
				'show_failed':$('#show_failed').val(),
				'show_hangup':$('#show_hangup').val(),
				'show_playback':$('#show_playback').val(),
				'show_dial':$('#show_dial').val(),
				'show_wait':$('#show_wait').val()
			};
			$.extend(true,def,options);
			if (def.debug) { def.type='text'; }
			var sn=$(this).data('sn');
			$.ajax({
				url:'index.php',
				type:'POST',
				data:{
					action:def.action,
					src:def.src,
					dst:def.dst,
					date1:def.date1,
					date2:def.date2,
					page:def.page,
					limit:def.limit,
					order:def.order,
					grad:def.grad,
					login:def.login,
					password:def.password,
					phone:def.phone,
					show_short_calls:def.show_short_calls,
					show_answered:def.show_answered,
					show_no_answer:def.show_no_answer,
					show_busy:def.show_busy,
					show_failed:def.show_failed,
					show_hangup:def.show_hangup,
					show_playback:def.show_playback,
					show_dial:def.show_dial,
					show_wait:def.show_wait,
					key:sn.result.key
				},
				dataType:def.type,
				timeout:10000,
				beforeSend:function(){
					$("#loading").show();
				},
				success:function(s){
					if (typeof s==='object') { 
						$.extend(true,sn.result,s); 
					} else { 
						if (def.debug) { alert(s); }
						sn.result=s;
					}
					$(this).data('sn',sn);
					if (typeof sn.result==='object') {
						if (sn.result.alert) { alert(sn.result.alert); }
						if (sn.result.callback) { $(this).snEvents({'href':'#'+sn.result.callback}); }
					}
					$("#loading").hide();
				},
				error:function(XMLHttpRequest,textStatus,error){ 
					//$("#loading").hide();
					//alert(textStatus);
				}
			});
		}
	};		

	$.fn.snAjax=function(sn){
		if (!sn) { sn={}; }
		if (methods[sn]) {
			return methods[sn].apply(this,Array.prototype.slice.call(arguments,1));
		} else if (typeof sn==='object' || !sn) {
			return methods.init.apply(this,arguments);
		} else {
			$.error('Метод '+sn+' не существует');
		}    
		
	};		
})(jQuery);
