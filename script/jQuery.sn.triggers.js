(function($){

	var methods={
		init:function(options)
		{
			$(this).snTriggers('eventLinks');
			$(this).snTriggers('cb');
			$(this).snTriggers('limit');
			$(this).snTriggers('filters');
			$(this).snTriggers('sort');
		},
		eventLinks:function()
		{
			th=$(this);
			sn=$(this).data('sn');
			$("a.event").on("click",function(){
				th.snEvents({'href':$(this).attr("href")});
			});
		},
		cb:function()
		{
			th=$(this);
			sn=$(this).data('sn');
			$(".cb").on("click",function(){
				if ($(this).is(':checked')) {
					$('#'+$(this).data('cb')).val('on');
				} else {
					$('#'+$(this).data('cb')).val('off');
				}				
				th.snEvents({'href':'#submit'});
			});
		},
		limit:function()
		{
			th=$(this);
			sn=$(this).data('sn');
			$(".limit a").on("click",function(){
				$(this).addClass("active").siblings().removeClass("active");
				$("#limit").val($(this).data("limit"));
				th.snEvents({'href':'#submit'});
			});
		},
		filters:function()
		{
			th=$(this);
			sn=$(this).data('sn');
			$(".filters li a").on("click",function(){
				if ($(this).data('value')=='on') {
					$('i',this).removeClass('icon-ok').addClass('icon-none');
					$(this).data('value','off');
					$('#'+$(this).data('cb')).val('off');
				} else {
					$('i',this).removeClass('icon-none').addClass('icon-ok');
					$(this).data('value','on');
					$('#'+$(this).data('cb')).val('on');
				}
				th.snEvents({'href':'#submit'});
			});
		},
		sort:function()
		{
			th=$(this);
			sn=$(this).data('sn');
			$("a.sort").on("click",function(){
				$("#order").val($(this).data("order"));
				$("#grad").val($(this).data("grad"));
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
