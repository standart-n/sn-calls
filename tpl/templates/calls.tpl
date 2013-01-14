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
				<div class="well">
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
							<a href="#" class="btn btn-small hidden-phone">20</a>
							<a href="#" class="btn btn-small active">30</a>
							<a href="#" class="btn btn-small">50</a>
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
		<table class="table table-hover table-bordered table-condensed table-striped">
			<thead>
				<tr>
					<th>Время звонка</th>
					<th>От кого</th>
					<th class="hidden">Номер</th>
					<th>Кому</th>
					<th class="hidden">Номер</th>
					<th>Запись</th>
					<th></th>
					<th>Посл. действ.</th>
					<th>Время</th>
				</tr>
			</thead>
			<tbody>
			{if isset($calls)}
				{foreach from=$calls item=key}
					<tr class="{$key.line_class}">
						<td>{$key.id}</td>
						<td>{$key.id}</td>
						<td class="hidden">{$key.id}</td>
						<td>{$key.id}</td>
						<td class="hidden">{$key.id}</td>
						<td>{$key.id}</td>
						<td>{$key.id}</td>
						<td>{$key.id}</td>
						<td>{$key.id}</td>
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
