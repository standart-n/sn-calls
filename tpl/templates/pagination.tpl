
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<div class="pagination pagination-centered">
				<ul>
					<li {if isset($prev)}{if (!$prev)}class="disabled"{/if}{/if}><a id="prev" href="#">«</a></li>
					{if isset($pagination)}
						{foreach from=$pagination item=key}
							<li class="hidden-phone {if isset($key.status)}{$key.status}{/if}">
								<a class="list" data-page="{if isset($key.page)}{$key.page}{/if}" href="#">{if isset($key.page)}{$key.page}{/if}</a>
							</li>
						{/foreach}
					{/if}
					<li {if isset($next)}{if (!$next)}class="disabled"{/if}{/if}><a id="next" href="#">»</a></li>
				</ul>
				<input id="page" type="hidden" value="{if isset($page)}{$page}{/if}">
			</div>
		</div>
	</div>
</div>
