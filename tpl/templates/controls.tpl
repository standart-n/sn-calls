
<div class="container-fluid">
	<div class="row-fluid">
	
			<div class="span12">
				<div class="well well-small">
					<form id="fSubmit" class="form-inline">
						<div class="input-append">
							<input id="src" type="text" class="input-medium" placeholder="От кого" value="{$controls.src}">
							<span class="add-on"><i class="icon-user"></i></span>
						</div>
						<div class="input-append">
							<input id="dst" type="text" class="input-medium" placeholder="Кому" value="{$controls.dst}">
							<span class="add-on"><i class="icon-user"></i></span>
						</div>
				  	
				  		<div class="input-append date" id="dp1" data-date="{$controls.date1}" data-date-format="dd-mm-yyyy">
							<input id="date1" class="input-small" size="16" type="text" value="{$controls.date1}">
							<span class="add-on"><i class="icon-th"></i></span>
						</div>
						<div class="input-append date" id="dp2" data-date="{$controls.date2}" data-date-format="dd-mm-yyyy">
							<input id="date2" class="input-small" size="16" type="text" value="{$controls.date2}">
							<span class="add-on"><i class="icon-th"></i></span>
						</div>
						<div class="hidden">
							<input type="submit">
						</div>
					</form>
					<!--
					<form class="form-inline">
						<label class="checkbox">
							<input id="cb_short_calls" data-cb="show_short_calls" class="cb" type="checkbox" checked>Показывать короткие звонки
							<input id="show_short_calls" type="hidden" value="on">
						</label>
					</form>
					-->

					<form class="form-inline">
						<label class="hidden-phone">Выводить по </label>
						<div class="btn-group limit">
							<a href="#" class="btn btn-small {if ($controls.limit==10)}active{/if}" data-limit="10">10</a>
							<a href="#" class="btn btn-small {if ($controls.limit==20)}active{/if}" data-limit="20">20</a>
							<a href="#" class="btn btn-small {if ($controls.limit==30)}active{/if} hidden-phone" data-limit="30">30</a>
							<a href="#" class="btn btn-small {if ($controls.limit==40)}active{/if}" data-limit="40">40</a>
						</div>
							<input id="limit" type="hidden" value="20">
						<div class="btn-group">
							<a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
								Фильтры
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu filters" role="menu" aria-labelledby="dLabel">
								<li class="nav-header">Статусы</li>
								<li>
									{if ($controls.show_answered!='off')}
										<a data-cb="show_answered" data-value="on" tabindex="-1" href="#">
											<i class="icon-ok"></i> Отвеченные
										</a>
									{else}
										<a data-cb="show_answered" data-value="off" tabindex="-1" href="#">
											<i class="icon-none"></i> Отвеченные
										</a>
									{/if}
								</li>
								<li>
									{if ($controls.show_no_answer!='off')}
										<a data-cb="show_no_answer" data-value="on" tabindex="-1" href="#">
											<i class="icon-ok"></i> Не отвеченные
										</a>
									{else}
										<a data-cb="show_no_answer" data-value="off" tabindex="-1" href="#">
											<i class="icon-none"></i> Не отвеченные
										</a>
									{/if}
								</li>
								<li>
									{if ($controls.show_busy!='off')}
										<a data-cb="show_busy" data-value="on" tabindex="-1" href="#">
											<i class="icon-ok"></i> Занято
										</a>
									{else}
										<a data-cb="show_busy" data-value="off" tabindex="-1" href="#">
											<i class="icon-none"></i> Занято
										</a>
									{/if}
								</li>
								<li>
									{if ($controls.show_failed!='off')}
										<a data-cb="show_failed" data-value="on" tabindex="-1" href="#">
											<i class="icon-ok"></i> Отмененные
										</a>
									{else}
										<a data-cb="show_failed" data-value="off" tabindex="-1" href="#">
											<i class="icon-none"></i> Отмененные
										</a>
									{/if}
								</li>
								<li class="divider"></li>
								<li class="nav-header">Посл. действ.</li>
								<li>
									{if ($controls.show_dial!='off')}
										<a data-cb="show_dial" data-value="on" tabindex="-1" href="#">
											<i class="icon-ok"></i> Вызов
										</a>
									{else}
										<a data-cb="show_dial" data-value="off" tabindex="-1" href="#">
											<i class="icon-none"></i> Вызов
										</a>
									{/if}
								</li>
								<li>
									{if ($controls.show_playback!='off')}
										<a data-cb="show_playback" data-value="on" tabindex="-1" href="#">
											<i class="icon-ok"></i> ИВР
										</a>
									{else}
										<a data-cb="show_playback" data-value="off" tabindex="-1" href="#">
											<i class="icon-none"></i> ИВР
										</a>
									{/if}
								</li>
								<li>
									{if ($controls.show_wait!='off')}
										<a data-cb="show_wait" data-value="on" tabindex="-1" href="#">
											<i class="icon-ok"></i> Ожидание
										</a>
									{else}
										<a data-cb="show_wait" data-value="off" tabindex="-1" href="#">
											<i class="icon-none"></i> Ожидание
										</a>
									{/if}
								</li>
								<li>
									{if ($controls.show_hangup!='off')}
										<a data-cb="show_hangup" data-value="on" tabindex="-1" href="#">
											<i class="icon-ok"></i> Сброшено
										</a>
									{else}
										<a data-cb="show_hangup" data-value="off" tabindex="-1" href="#">
											<i class="icon-none"></i> Сброшено
										</a>
									{/if}
								</li>
							</ul>
							<input id="show_answered" type="hidden" value="{if ($controls.show_answered!='off')}on{else}off{/if}">
							<input id="show_no_answer" type="hidden" value="{if ($controls.show_no_answer!='off')}on{else}off{/if}">
							<input id="show_busy" type="hidden" value="{if ($controls.show_busy!='off')}on{else}off{/if}">
							<input id="show_failed" type="hidden" value="{if ($controls.show_failed!='off')}on{else}off{/if}">
							<input id="show_hangup" type="hidden" value="{if ($controls.show_hangup!='off')}on{else}off{/if}">
							<input id="show_playback" type="hidden" value="{if ($controls.show_playback!='off')}on{else}off{/if}">
							<input id="show_dial" type="hidden" value="{if ($controls.show_dial!='off')}on{else}off{/if}">
							<input id="show_wait" type="hidden" value="{if ($controls.show_wait!='off')}on{else}off{/if}">
						</div>
					</form>

						<a id="submit" href="#" class="btn btn-primary btn-medium"><i class="icon-ok icon-white">
							</i> Применить
						</a>

						<!--
						<div id="loading">
							<div class="progress progress-striped active">
								<div class="bar" style="width: 100%;"><strong>Загрузка данных...</strong></div>
							</div>
						</div>
						-->
					
				</div>
			</div>

	
		</form>
	</div>
</div>
