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
								$('#dp1').datepicker();
								$('#dp2').datepicker();
								$(this).snPlayer();
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
								$(this).snTriggers('detail');
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
