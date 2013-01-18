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
