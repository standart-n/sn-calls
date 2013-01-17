
<div class="container-fluid">
	<div class="row-fluid">
	
			<div class="span12">
				<div class="well well-small">
					<form class="form-inline">
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
					</form>

					<form class="form-inline">
						<label class="checkbox">
							<input id="cb_no_answer" type="checkbox" {$controls.cb_no_answer}>Показывать неотвеченные
						</label>
						<label class="checkbox">
							<input id="cb_short_calls" type="checkbox" {$controls.cb_short_calls}>Показывать короткие звонки
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
						<a id="submit" href="#" class="btn btn-primary btn-medium"><i class="icon-ok icon-white"></i> Применить</a>
					</form>

					<div id="loading">
						<div class="progress progress-striped active">
							<div class="bar" style="width: 100%;"><strong>Загрузка данных...</strong></div>
						</div>
					</div>
					
				</div>
			</div>

	
		</form>
	</div>
</div>
