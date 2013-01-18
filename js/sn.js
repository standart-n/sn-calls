(function($){

	var methods={
		init:function(options)
		{
			if (!options) { options={}; }
			def={
				'bonus':
				{
					'inputText':'Введите номер карты'
				},
				'content':{},
				'result':{}
			};
			$.extend(true,def,options);
			return this.each(function(){
				$(this).data('sn',def);
				$(this).snTriggers();
				$(this).snEvents({'href':'#autoload'});
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
				'date2':$('#date2').val()
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
					date2:def.date2
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
					$("#loading").hide();
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
			//$(this).snPlayer('onScrollWindow');
			//$(this).snPlayer('fixPlayer');
		},
		onScrollWindow:function()
		{
			var th=$(this);
			$(window).scroll(function(){
				th.snPlayer('fixPlayer');
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
				var sn=$(this).data('sn');
				var href=def.href;
				switch (href.replace(/(.*)#(.*)/,"$2")){
					case "autoload":
						$('#dp1').datepicker();
						$('#dp2').datepicker();
						$(this).snPlayer();
					break;
					case "submit":
						$(this).snAjax('sendRequest',{'action':'submit','debug':false});
					break;
					case "afterSubmit":
						if (sn.result) {
							$(this).snPlayer('onClickPlay');
							if (sn.result.table) {
								$("#table").html(sn.result.table);
							}
							if (sn.result.stat) {
								$("#stat").html(sn.result.stat);
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
			$(this).snTriggers('eventLinks');
		},
		eventLinks:function()
		{
			th=$(this);
			sn=$(this).data('sn');
			$("a.event").on("click",function(){
				th.snEvents({'href':$(this).attr("href")});
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
