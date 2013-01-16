<!--
<div class="container-fluid">
	<div class="row-fluid">
	
			<div class="span12">
				<div class="well">
					<h4>Учет звонков</h4>
				</div>
			</div>

	</div>
</div>
-->

<div class="container-fluid">
	<div class="row-fluid">
	
			<div class="span12">
				<div class="well well-small">
					<form class="form-inline">
						<div class="input-append">
							<input type="text" class="input-medium" placeholder="От кого">
							<span class="add-on"><i class="icon-user"></i></span>
						</div>
						<div class="input-append">
							<input type="text" class="input-medium" placeholder="Кому">
							<span class="add-on"><i class="icon-user"></i></span>
						</div>
				  	
				  		<div class="input-append date" id="dp1" data-date="12-02-2012" data-date-format="dd-mm-yyyy">
							<input id="date1" class="input-small" size="16" type="text" value="12-02-2012">
							<span class="add-on"><i class="icon-th"></i></span>
						</div>
						<div class="input-append date" id="dp2" data-date="12-02-2012" data-date-format="dd-mm-yyyy">
							<input id="date2" class="input-small" size="16" type="text" value="12-02-2012">
							<span class="add-on"><i class="icon-th"></i></span>
						</div>
					</form>

					<form class="form-inline">
						<label class="checkbox">
							<input type="checkbox" checked>Показывать неотвеченные
						</label>
						<label class="checkbox">
							<input type="checkbox" checked>Показывать короткие звонки
						</label>
					</form>

					<form class="form-inline">
						<label class="hidden-phone">Выводить по </label>
						<div class="btn-group">
							<a href="#" class="btn btn-small">10</a>
							<a href="#" class="btn btn-small active">20</a>
							<a href="#" class="btn btn-small hidden-phone">30</a>
							<a href="#" class="btn btn-small">40</a>
						</div>
						<div class="btn-group">
							<a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
								Сортировать по
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
								<li><a tabindex="-1" href="#"><i class="icon-arrow-up"></i> От кого</a></li>
								<li><a tabindex="-1" href="#"><i class="icon-arrow-down"></i> От кого</a></li>
								<li class="divider"></li>
								<li><a tabindex="-1" href="#"><i class="icon-arrow-up"></i> Кому</a></li>
								<li><a tabindex="-1" href="#"><i class="icon-arrow-down"></i> Кому</a></li>
							</ul>
						</div>
					</form>

					<form class="form-inline">
						<a href="#" class="btn btn-primary btn-medium"><i class="icon-ok icon-white"></i> Применить</a>
					</form>
					
				</div>
			</div>

	
		</form>
	</div>
</div>

<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
		<table class="table table-bordered table-condensed table-striped">
			<thead>
				<tr>
					<th>Дата</th>
					<th>От_кого</th>
					<th class="hidden">Номер</th>
					<th>Кому</th>
					<th class="hidden">Номер</th>
					<th>Запись</th>
					<th class="hidden-phone">Действие</th>
					<th class="hidden-phone">Длит.(c)</th>
				</tr>
			</thead>
			<tbody>
			{if isset($cdr)}
				{foreach from=$cdr item=key}
					<tr>
						<td>{$key.post_t} <small>{$key.post_d}</small></td>
						<td>{$key.src}</td>
						<td class="hidden">{$key.id}</td>
						<td>{$key.dst}</td>
						<td class="hidden">{$key.id}</td>
						<td>
							{if (!$key.listen)}
								<span class="label label-{$key.status_class}">{$key.status_rus}</span>
							{else}
								<a href="#" class="btn btn-primary btn-small play" data-id="{$key.id}" data-src="sn-project/mp3/1000.mp3"><i class="icon-play icon-white"> </i></a>
								<a href="#" class="btn btn-small pause" data-id="{$key.id}"><i class="icon-pause"> </i></a>
								<a href="#" class="btn btn-small"><i class="icon-download-alt"> </i></a>
								<!--
								<object type="application/x-shockwave-flash" data="{$key.path_player}" width="100" height="20">
									<param name="movie" value="{$key.path_player}" />
									<param name="FlashVars" value="mp3={$key.path_audio}" />
									<param name="bgcolor" value="#000000" />
								</object>								
								-->
							{/if}
						</td>
						<td class="hidden-phone"><small>{$key.lastapp_rus}</small></td>
						<td class="hidden-phone">
							<div class="progress">
								<div class="bar bar-warning" style="width:{$key.duration_in_pr}%;"><small>{$key.duration_in}</small></div>
								<div class="bar bar-success" style="width:{$key.duration_call_pr}%;"><b>{$key.duration_call}</b></div>
								<div class="bar bar-danger" style="width:{$key.duration_error_pr}%;">{$key.duration_error}</div>
							</div>
						</td>
					</tr>
				{/foreach}
			{/if}
			</tbody>
		</table>		
		</div>
	</div>
</div>

<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<div class="pagination pagination-centered">
				<ul>
					<li><a href="#">Назад</a></li>
					<li class="hidden-phone"><a href="#">1</a></li>
					<li class="hidden-phone"><a href="#">2</a></li>
					<li class="hidden-phone"><a href="#">3</a></li>
					<li class="hidden-phone"><a href="#">4</a></li>
					<li class="hidden-phone"><a href="#">5</a></li>
					<li><a href="#">Вперед</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
