(function($){

	var methods={
		init:function(options)
		{
			$(this).snPlayer('onClickTrack');
		},
		onClickTrack:function()
		{
			$('a.track').click(function(e){
				e.preventDefault();
				$("#player-wrap").show();
				$("#player").html('<audio/>');
				var src=$(this).data('src');
				audiojs.events.ready(function(){
					var a=audiojs.createAll();
					var audio=a[0];
					audio.load(src);
					audio.play();				
				});
				$(this).addClass('playing').siblings().removeClass('playing');
			});
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
