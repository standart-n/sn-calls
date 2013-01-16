
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
			{if $cdr}
				{foreach from=$cdr item=key}
					<tr>
						<td>{$key.post_t} <small>{$key.post_d}</small></td>
						<td><small>{$key.src_name}</small> <small class="muted">{$key.src}</small></td>
						<td class="hidden">{$key.id}</td>
						<td><small>{$key.dst_name}</small> <small class="muted">{$key.dst}</small></td>
						<td class="hidden">{$key.id}</td>
						<td>
							{if (!$key.listen)}
								<span class="label label-{$key.status_class}">{$key.status_rus}</span>
							{else}
								<div class="btn-group">
										<a href="#" class="btn btn-primary btn-mini play" data-id="{$key.id}" data-src="sn-project/mp3/1000.mp3"><i class="icon-play icon-white"></i></a>
										<a href="sn-project/mp3/1000.mp3" target="_blank" class="btn btn-mini"><i class="icon-download-alt"></i></a>
								</div>
								<!--
								<a href="#" class="btn btn-small pause" data-id="{$key.id}"><i class="icon-pause"> </i></a>
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
								<div class="bar bar-success" style="width:{$key.duration_call_pr}%;"><strong>{$key.duration_call}</strong></div>
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
