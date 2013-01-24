(function($){

	var methods={
		init:function(options)
		{
			if (!options) { options={}; }
			def={
				'content':{},
				'result':
				{
					'key':''
				}
			};
			$.extend(true,def,options);
			return this.each(function(){
				$(this).data('sn',def);
				$(this).snTriggers();
				if ($("#controls").html()!=="") {
					$(this).snEvents({'href':'#autoload'});
				}
			});
		}
	};		

	$.fn.sn=function(sn){
		if (!sn) { sn={}; }
		if ( methods[sn]) {
			return methods[sn].apply(this,Array.prototype.slice.call(arguments,1));
		} else if (typeof sn==='object' || !sn) {
			return methods.init.apply(this,arguments);
		} else {
			$.error('Метод '+sn+' не существует');
		}    
		
	};		
})(jQuery);
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
(function($){

	var methods={
		init:function(options)
		{
			$(this).snPlayer('onClickPlay');
			$(this).snPlayer('onClickClose');
			//$(this).snPlayer('onScrollWindow');
			//$(this).snPlayer('fixPlayer');
		},
		/*onScrollWindow:function()
		{
			var th=$(this);
			$(window).scroll(function(){
				th.snPlayer('fixPlayer');
			});
		},*/
		onClickClose:function()
		{
			$('#player-close').click(function(e){
				e.preventDefault();
				$("#player-wrap").hide();
			});
		},
		onClickPlay:function()
		{
			$('a.play').click(function(e){
				e.preventDefault();
				var id=$(this).data('id');
				var src=$(this).data('src');
				$("#player-wrap").show();
				$("#player").html('<audio/>').data('id',id);
				/*
				$(this).hide();
				$('a.pause').each(function(){
					if ($(this).data('id')==id) {
						$(this).show();
					}
				});
				*/
				audiojs.events.ready(function(){
					var a=audiojs.createAll({
						/*
						pause:function(){
							$('a.play').each(function(){
								if ($(this).data('id')==id) {
									$(this).show();
								}
							});
							$('a.pause').each(function(){
								if ($(this).data('id')==id) {
									$(this).hide();
								}
							});
						}
						*/
					});
					var audio=a[0];
					$('#player-close').click(function(e){
						e.preventDefault();
						audio.pause();
						$("#player").html('');
					});
					audio.load(src);
					audio.play();				
				});
				//$(this).addClass('playing').siblings().removeClass('playing');
			});
		},
		fixPlayer:function()
		{
			$('#player-wrap').css({'top':(window.pageYOffset+$(window).height()-36)+'px'});
		}
	};

	$.fn.snPlayer=function(sn){
		if (!sn) { sn={}; }
		if ( methods[sn]) {
			return methods[sn].apply(this,Array.prototype.slice.call(arguments,1));
		} else if (typeof sn==='object' || !sn) {
			return methods.init.apply(this,arguments);
		} else {
			$.error('Метод '+sn+' не существует');
		}
		
	};
})(jQuery);
(function($){

	var methods={
		init:function(options)
		{
			return this.each(function(){
				$(this).snConf('main');
			});
		},
		main:function()
		{
			var sn=$(this).data('sn');
			$.ajax({
				url:'sn-project/settings/main.json',
				async:false,
				dataType:"json",
				success:function(s){
					$.extend(true,sn,s);
					$(this).data('sn',sn);
				}
			});
		}
	};

	$.fn.snConf=function(sn){
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
(function($){

	var methods={
		init:function(options)
		{
			return this.each(function(){
				var def={
					'href':"none"
				};
				$.extend(true,def,options);
				var th=$(this);
				var sn=$(this).data('sn');
				var href=def.href;
				switch (href.replace(/(.*)#(.*)/,"$2")){
					case "autoload":
						$('#dp1').datepicker();
						$('#dp2').datepicker();
						$(this).snPlayer();
						$(this).snEvents({'href':'#fbRequest'});
					break;
					case "signin":
						$("#signin-error").hide();
						$(this).snAjax('sendRequest',{'action':'signin','debug':false});
					break;
					case "afterSignin":
						if (sn.result) {
							if (sn.result.response) {
								if (sn.result.controls) {
									$("#controls").html(sn.result.controls);
								}
								$("#signin").empty();
								$(this).snTriggers('controls');
								$(this).snEvents({'href':'#submit'});
							} else {
								$("#inputLogin").val('');
								$("#inputPassword").val('');
								$("#signin-error").show();
							}
						}
					break;
					case "submit":
						$(this).snAjax('sendRequest',{'action':'submit','debug':false});
					break;
					case "afterSubmit":
						if (sn.result) {
							if (sn.result.table) {
								$("#table").html(sn.result.table);
								$(this).snTriggers('sort');
								$(this).snPlayer('onClickPlay');
							}
							if (sn.result.stat) {
								$("#stat").html(sn.result.stat);
							}
							if (sn.result.pagination) {
								$("#pagination").html(sn.result.pagination);
								$(this).snTriggers('list');
							}
							$(this).snEvents({'href':'#fbRequest'});
						}
					break;
					case "fbRequest":
						$('.no-fb').each(function(){
							if ($(this).val()!=="") {
								th.snAjax('sendRequest',{'action':'fbRequest','phone':$(this).val(),'debug':false});
								$(this).removeClass("no-fb");
							}
						});
					break;
					case "afterFbRequest":
						if (sn.result) {
							if (sn.result.response) {
								if (sn.result.response.hash) {
									$("."+sn.result.response.hash).html(sn.result.response.caption);
								}
							}
						}
					break;					
					case "close":
						$(this).hide();
					break;
				}
			});
		}
	};

	$.fn.snEvents=function(sn){
		if (!sn) { sn={}; }
		if ( methods[sn]) {
			return methods[sn].apply(this,Array.prototype.slice.call(arguments,1));
		} else if (typeof sn==='object' || !sn) {
			return methods.init.apply(this,arguments);
		} else {
			$.error('Метод '+sn+' не существует');
		}		
	};		
})(jQuery);
(function($){

	var methods={
		init:function(options)
		{
			if ($("#controls").html()!=="")	{
				$(this).snTriggers('submit');
				$(this).snTriggers('cb');
				$(this).snTriggers('limit');
				$(this).snTriggers('filters');
			}
			if ($("#talbe").html()!=="") {
				$(this).snTriggers('sort');
			}
			if ($("#pagination").html()!=="")	{
				$(this).snTriggers('list');
			}
			if ($("#signin").html()!=="")	{
				$(this).snTriggers('signin');
			}
		},
		controls:function()
		{
			$(this).snTriggers('submit');
			$(this).snTriggers('cb');
			$(this).snTriggers('limit');
			$(this).snTriggers('filters');
		},
		signin:function()
		{
			th=$(this);
			$("#fSignin").on("submit",function(e){
				e.preventDefault();
				th.snEvents({'href':'#signin'});
			});
		},
		submit:function()
		{
			th=$(this);
			$("#fSubmit").on("submit",function(e){
				e.preventDefault();
				$("#page").val(1);
				th.snEvents({'href':'#submit'});
			});
			$("#submit").on("click",function(e){
				e.preventDefault();
				$("#page").val(1);
				th.snEvents({'href':'#submit'});
			});
		},
		cb:function()
		{
			th=$(this);
			$(".cb").on("click",function(e){
				e.preventDefault();
				if ($(this).is(':checked')) {
					$('#'+$(this).data('cb')).val('on');
				} else {
					$('#'+$(this).data('cb')).val('off');
				}				
				$("#page").val(1);
				th.snEvents({'href':'#submit'});
			});
		},
		limit:function()
		{
			th=$(this);
			sn=$(this).data('sn');
			$(".limit a").on("click",function(e){
				e.preventDefault();
				$(this).addClass("active").siblings().removeClass("active");
				$("#limit").val($(this).data("limit"));
				$("#page").val(1);
				th.snEvents({'href':'#submit'});
			});
		},
		filters:function()
		{
			th=$(this);
			$(".filters li a").on("click",function(e){
				e.preventDefault();
				if ($(this).data('value')=='on') {
					$('i',this).removeClass('icon-ok').addClass('icon-none');
					$(this).data('value','off');
					$('#'+$(this).data('cb')).val('off');
				} else {
					$('i',this).removeClass('icon-none').addClass('icon-ok');
					$(this).data('value','on');
					$('#'+$(this).data('cb')).val('on');
				}
				$("#page").val(1);
				th.snEvents({'href':'#submit'});
			});
		},
		sort:function()
		{
			th=$(this);
			$("a.sort").on("click",function(e){
				e.preventDefault();
				$("#order").val($(this).data("order"));
				$("#grad").val($(this).data("grad"));
				$("#page").val(1);
				th.snEvents({'href':'#submit'});
			});
		},
		list:function()
		{
			th=$(this);
			$("a#prev").on("click",function(e){
				e.preventDefault();
				$("#page").val(($("#page").val()*1)-1);
				th.snEvents({'href':'#submit'});
			});
			$("a.list").on("click",function(e){
				e.preventDefault();
				$("#page").val($(this).data("page"));
				th.snEvents({'href':'#submit'});
			});
			$("a#next").on("click",function(e){
				e.preventDefault();
				$("#page").val(($("#page").val()*1)+1);
				th.snEvents({'href':'#submit'});
			});
		}
	};

	$.fn.snTriggers=function(sn){
		if (!sn) { sn={}; }
		if ( methods[sn]) {
			return methods[sn].apply(this,Array.prototype.slice.call(arguments,1));
		} else if (typeof sn==='object' || !sn) {
			return methods.init.apply(this,arguments);
		} else {
			$.error('Метод '+sn+' не существует');
		}
		
	};
})(jQuery);
