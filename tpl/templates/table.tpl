<div class='container-fluid'>
  <div class='row-fluid'>
    <div class='span12'>
      <table class='table table-bordered table-condensed table-striped'>
        <thead>
          <tr>
            <th>
              {if ($order=="calldate")}
              <a class='sort btn btn-mini btn-primary' data-grad="{if ($grad=='asc')}desc{else}asc{/if}" data-order='calldate' href='#'>
                <i class="hidden-phone icon-arrow-{if ($grad=='asc')}up{else}down{/if} icon-white"></i>
                Дата
              </a>
              {else}
              <a class='sort btn btn-mini' data-grad='asc' data-order='calldate' href='#'>
                <i class='hidden-phone icon-arrow-up'></i>
                Дата
              </a>
              {/if}
            </th>
            <th>
              {if ($order=="src_name")}
              <a class='sort btn btn-mini btn-primary' data-grad="{if ($grad=='asc')}desc{else}asc{/if}" data-order='src_name' href='#'>
                <i class="hidden-phone icon-arrow-{if ($grad=='asc')}up{else}down{/if} icon-white"></i>
                От_кого
              </a>
              {else}
              <a class='sort btn btn-mini' data-grad='asc' data-order='src_name' href='#'>
                <i class='hidden-phone icon-arrow-up'></i>
                От_кого
              </a>
              {/if}
            </th>
            <th>
              {if ($order=="dst_name")}
              <a class='sort btn btn-mini btn-primary' data-grad="{if ($grad=='asc')}desc{else}asc{/if}" data-order='dst_name' href='#'>
                <i class="hidden-phone icon-arrow-{if ($grad=='asc')}up{else}down{/if} icon-white"></i>
                Кому
              </a>
              {else}
              <a class='sort btn btn-mini' data-grad='asc' data-order='dst_name' href='#'>
                <i class='hidden-phone icon-arrow-up'></i>
                Кому
              </a>
              {/if}
            </th>
            <th>
              <a class='btn btn-mini disabled' href='#'>
                Запись
              </a>
            </th>
            <th class='hidden-phone'>
              <a class='btn btn-mini disabled' href='#'>
                Действие
              </a>
            </th>
            <th class='hidden-phone'>
              {if ($order=="billsec")}
              <a class='sort btn btn-mini btn-primary' data-grad="{if ($grad=='asc')}desc{else}asc{/if}" data-order='billsec' href='#'>
                <i class="hidden-phone icon-arrow-{if ($grad=='asc')}up{else}down{/if} icon-white"></i>
                Длит.(с)
              </a>
              {else}
              <a class='sort btn btn-mini' data-grad='asc' data-order='billsec' href='#'>
                <i class='hidden-phone icon-arrow-up'></i>
                Длит.(с)
              </a>
              {/if}
            </th>
            <input id='order' type='hidden' value='{$order}' />
            <input id='grad' type='hidden' value='{$grad}' />
          </tr>
        </thead>
        <tbody>
          {if isset($cdr)}
          {foreach from=$cdr item=key}
          <tr>
            <td>
              {$key.post_t}
              <small>{$key.post_d}</small>
            </td>
            <td>
              <small>
                <div class='fb-name {$key.src_hash}'>{$key.src_name}</div>
              </small>
              <small>
                <a class='tel' href='#'>{$key.src}</a>
              </small>
            </td>
            <td>
              <small>
                <div class='fb-name {$key.dst_hash}'>{$key.dst_name}</div>
              </small>
              <small>
                <a class='tel' href='#'>{$key.dst}</a>
              </small>
            </td>
            <td>
              {if (!$key.listen)}
              <span class='label label-{$key.status_class}'>
                <small>{$key.status_rus}</small>
              </span>
              {else}
              {if isset($key.path_audio)}
              <div class='btn-group'>
                <a class='btn btn-primary btn-mini play' data-id='{$key.id}' data-src='{$key.path_audio}' href='#'>
                  <i class='icon-play icon-white'></i>
                </a>
                <a class='btn btn-mini' href='{$key.path_audio}' target='_blank'>
                  <i class='icon-download-alt'></i>
                </a>
              </div>
              {/if}
              {/if}
            </td>
            <td class='hidden-phone'>
              <small>{$key.lastapp_rus}</small>
            </td>
            <td class='hidden-phone'>
              <div class='progress'>
                <div class='bar bar-warning' style='width:{$key.duration_in_pr}%;'>
                  <small>{$key.duration_in}</small>
                </div>
                <div class='bar bar-success' style='width:{$key.duration_call_pr}%;'>
                  <strong>{$key.duration_call}</strong>
                </div>
                <div class='bar bar-danger' style='width:{$key.duration_error_pr}%;'>
                  {$key.duration_error}
                </div>
              </div>
            </td>
          </tr>
          {/foreach}
          {/if}
        </tbody>
      </table>
      <div class='hidden'>
        {if isset($phones)}
        {foreach from=$phones item=key}
        <input class='no-fb' type='hidden' value='{$key}' />
        {/foreach}
        {/if}
      </div>
    </div>
  </div>
</div>
