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
				$(this).snTriggers('detail');
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
		detail:function()
		{
			th=$(this);
			$("a.tel").on("click",function(e){
				e.preventDefault();
				$("#dst").val($(this).html());
				$("#src").val($(this).html());
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
