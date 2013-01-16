
{if $stat}
	{if isset($stat.count_all)}
		{if ($stat.count_all>0)}

<div class="container-fluid">
	<div class="row-fluid">
	
			<div class="span12">
				<div class="well well-small">
					<h4>Статистика</h4>

					<strong>По времени разговора</strong>
					<div class="progress">
						<div class="bar bar-danger" style="width: {$stat.pr_limit_1}%;"></div>
						<div class="bar bar-warning" style="width: {$stat.pr_limit_2}%;"></div>
						<div class="bar bar-info" style="width: {$stat.pr_limit_3}%;"></div>
						<div class="bar bar-success" style="width: {$stat.pr_limit_4}%;"></div>
					</div>
					<form class="form-inline">
						<label><span class="badge badge badge-important">{$stat.count_limit_1}</span> <small>0</small></label>
						<label><span class="badge badge-warning">{$stat.count_limit_2}</span> <small>0-10c.</small></label>
						<label><span class="badge badge-info">{$stat.count_limit_3}</span> <small>10-30c.</small></label>
						<label><span class="badge badge-success">{$stat.count_limit_4}</span> <small>>30c.</small></label>
					</form>

					<strong>По статусам звонков</strong>
					<div class="progress">
						<div class="bar bar-danger" style="width: {$stat.pr_failed}%;"></div>
						<div class="bar bar-warning" style="width: {$stat.pr_busy}%;"></div>
						<div class="bar bar-info" style="width: {$stat.pr_no_answer}%;"></div>
						<div class="bar bar-success" style="width: {$stat.pr_answered}%;"></div>
					</div>
					<form class="form-inline">
						<label><span class="badge badge-important">{$stat.count_failed}</span> <small>Отменен</small></label>
						<label><span class="badge badge-warning">{$stat.count_busy}</span> <small>Занято</small></label>
						<label><span class="badge badge-info">{$stat.count_no_answer}</span> <small>Не отвечено</small></label>
						<label><span class="badge badge-success">{$stat.count_answered}</span> <small>Отвечено</small></label>
					</form>

				</div>				
			</div>

		{/if}
	{/if}
{/if}

	</div>
</div>
