(function($){

	var methods={
		init:function(options)
		{
			$(this).snPlayer('onClickPlay');
			$(this).snPlayer('onClickClose');
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
