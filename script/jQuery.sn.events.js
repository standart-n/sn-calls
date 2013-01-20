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
								$(this).snTriggers('sort');
								$(this).snPlayer('onClickPlay');
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
