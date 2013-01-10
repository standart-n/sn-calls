<!--
<div class="container-fluid">
	<div class="row-fluid">
		<h4>Учет звонков</h4>
	</div>
</div>
-->

<div class="container">
	<div class="row">
	
			<div class="span4">
				<div class="well">
					<form>
							<input type="text" class="input-large" placeholder="От кого">
							<input type="text" class="input-large" placeholder="Кому">
							<label>Начальная дата</label>
						  		<div class="input-append date" id="dp1" data-date="12-02-2012" data-date-format="dd-mm-yyyy">
									<input id="date1" class="input-medium" size="16" type="text" value="12-02-2012">
									<span class="add-on"><i class="icon-th"></i></span>
								</div>
							<label>Конечная дата</label>
								<div class="input-append date" id="dp2" data-date="12-02-2012" data-date-format="dd-mm-yyyy">
									<input id="date2" class="input-medium" size="16" type="text" value="12-02-2012">
									<span class="add-on"><i class="icon-th"></i></span>
								</div>
					</form>
				</div>
			</div>

			<div class="span4">
				<div class="well">
					<form class="form-horizontal">
						<div class="control-group">
							<label class="control-label">Начальная дата</label>
							<div class="controls">
						  		<div class="input-append date" id="dp1" data-date="12-02-2012" data-date-format="dd-mm-yyyy">
									<input id="date1" class="input-small" size="16" type="text" value="12-02-2012">
									<span class="add-on"><i class="icon-th"></i></span>
								</div>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">Конечная дата</label>
							<div class="controls">
								<div class="input-append date" id="dp2" data-date="12-02-2012" data-date-format="dd-mm-yyyy">
									<input id="date2" class="input-small" size="16" type="text" value="12-02-2012">
									<span class="add-on"><i class="icon-th"></i></span>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>

			<div class="span4">
				<div class="well well-small">
					<div class="controls">
						<label class="radio">
							<input type="radio" name="search_option" value="all" checked="">Все звонки
						</label>			
						<label class="radio">
							<input type="radio" name="search_option" value="src">Отвеченные
						</label>
						<label class="radio">
							<input type="radio" name="search_option" value="dst">Неотвеченные
						</label>
					</div>
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
					<th>Номер</th>
					<th>Кому</th>
					<th>Номер</th>
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
						<td>{$key.id}</td>
						<td>{$key.id}</td>
						<td>{$key.id}</td>
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
