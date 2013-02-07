<div class='container-fluid'>
  <div class='row-fluid'>
    <div class='span12'>
      <div class='well well-small'>
        <div class='form-inline' id='fSubmit'>
          <div class='input-append'>
            <input class='input-medium' id='src' placeholder='От кого' type='text' value='{$controls.src}' />
            <span class='add-on'>
              <i class='icon-user'></i>
            </span>
          </div>
          <div class='input-append'>
            <input class='input-medium' id='dst' placeholder='Кому' type='text' value='{$controls.dst}' />
            <span class='add-on'>
              <i class='icon-user'></i>
            </span>
          </div>
          <div class='input-append date' data-date-format='dd-mm-yyyy' data-date='{$controls.date1}' id='dp1'></div>
          <input class='input-small' id='date1' size='16' type='text' value='{$controls.date1}' />
          <span class='add-on'>
            <i class='icon-th'></i>
          </span>
          <div class='input-append date' data-date-format='dd-mm-yyyy' data-date='{$controls.date2}' id='dp2'>
            <input class='input-small' id='date2' size='16' type='text' value='{$controls.date2}' />
            <span class='add-on'>
              <i class='icon-th'></i>
            </span>
          </div>
          <div class='hidden'>
            <input type='submit' />
          </div>
        </div>
        <!--
          <form class='form-inline'>
            <label class='checkbox'>
              <input checked='checked' class='cb' data-cb='show_short_calls' id='cb_short_calls' type='checkbox' />
              Показывать короткие звонки
              <input id='show_short_calls' type='hidden' value='on' />
            </label>
          </form>
        -->
        <form class='form-inline'>
          <label class='hidden-phone'>Выводить по</label>
          <div class='btn-group limit'>
            <a class='btn btn-small {if ($controls.limit==10)}active{/if}' data-limit='10' href='#'>10</a>
            <a class='btn btn-small {if ($controls.limit==20)}active{/if}' data-limit='20' href='#'>20</a>
            <a class='btn btn-small {if ($controls.limit==30)}active{/if} hidden-phone' data-limit='30' href='#'>30</a>
            <a class='btn btn-small {if ($controls.limit==40)}active{/if}' data-limit='40' href='#'>40</a>
          </div>
          <input id='limit' type='hidden' value='20' />
          <div class='btn-group'>
            <a class='btn btn-small dropdown-toggle' data-toggle='dropdown' href='#'>
              Фильтры
              <span class='caret'></span>
            </a>
            <ul aria-labelledby='dLabel' class='dropdown-menu filters' role='menu'>
              <li class='nav-header'>Статусы</li>
              <li>
                {if ($controls.show_answered!='off')}
                <a data-cb='show_answered' data-value='on' href='#' tabindex='-1'>
                  <i class='icon-ok'></i>
                  Отвеченные
                </a>
                {else}
                <a data-cb='show_answered' data-value='off' href='#' tabindex='-1'>
                  <i class='icon-none'></i>
                  Отвеченные
                </a>
                {/if}
              </li>
              <li>
                {if ($controls.show_no_answer!='off')}
                <a data-cb='show_no_answer' data-value='on' href='#' tabindex='-1'>
                  <i class='icon-ok'></i>
                  Не отвеченные
                </a>
                {else}
                <a data-cb='show_no_answer' data-value='off' href='#' tabindex='-1'>
                  <i class='icon-none'></i>
                  Не отвеченные
                </a>
                {/if}
              </li>
              <li>
                {if ($controls.show_busy!='off')}
                <a data-cb='show_busy' data-value='on' href='#' tabindex='-1'>
                  <i class='icon-ok'></i>
                  Занято
                </a>
                {else}
                <a data-cb='show_busy' data-value='off' href='#' tabindex='-1'>
                  <i class='icon-none'></i>
                  Занято
                </a>
                {/if}
              </li>
              <li>
                {if ($controls.show_failed!='off')}
                <a data-cb='show_failed' data-value='on' href='#' tabindex='-1'>
                  <i class='icon-ok'></i>
                  Отмененные
                </a>
                {else}
                <a data-cb='show_failed' data-value='off' href='#' tabindex='-1'>
                  <i class='icon-none'></i>
                  Отмененные
                </a>
                {/if}
              </li>
              <li class="divider"></li>
              <li class="nav-header">Посл. действ.</li>
              <li>
                {if ($controls.show_dial!='off')}
                <a data-cb='show_dial' data-value='on' href='#' tabindex='-1'>
                  <i class='icon-ok'>
                    Вызов
                  </i>
                </a>
                {else}
                <a data-cb='show_dial' data-value='off' href='#' tabindex='-1'>
                  <i class='icon-none'>
                    Вызов
                  </i>
                </a>
                {/if}
              </li>
              <li>
                {if ($controls.show_playback!='off')}
                <a data-cb='show_playback' data-value='off' href='#' tabindex='-1'>
                  <i class='icon-ok'>
                    ИВР
                  </i>
                </a>
                {else}
                <a data-cb='show_playback' data-value='off' href='#' tabindex='-1'>
                  <i class='icon-none'>
                    ИВР
                  </i>
                </a>
                {/if}
              </li>
              <li>
                {if ($controls.show_wait!='off')}
                <a data-cb='show_wait' data-value='on' href='#' tabindex='-1'>
                  <i class='icon-ok'>
                    Ожидание
                  </i>
                </a>
                {else}
                <a data-cb='show_wait' data-value='off' href='#' tabindex='-1'>
                  <i class='icon-none'>
                    Ожидание
                  </i>
                </a>
                {/if}
              </li>
              <li>
                {if ($controls.show_hangup!='off')}
                <a data-cb='show_hangup' data-value='on' href='#' tabindex='-1'>
                  <i class='icon-ok'>
                    Сброшено
                  </i>
                </a>
                {else}
                <a data-cb='show_hangup' data-value='off' href='#' tabindex='-1'>
                  <i class='icon-none'>
                    Сброшено
                  </i>
                </a>
                {/if}
              </li>
            </ul>
            <input id='show_answered' type='hidden' value="{if ($controls.show_answered!='off')}on{else}off{/if}" />
            <input id='show_no_answer' type='hidden' value="{if ($controls.show_no_answer!='off')}on{else}off{/if}" />
            <input id='show_busy' type='hidden' value="{if ($controls.show_busy!='off')}on{else}off{/if}" />
            <input id='show_failed' type='hidden' value="{if ($controls.show_failed!='off')}on{else}off{/if}" />
            <input id='show_hangup' type='hidden' value="{if ($controls.show_hangup!='off')}on{else}off{/if}" />
            <input id='show_playback' type='hidden' value="{if ($controls.show_playback!='off')}on{else}off{/if}" />
            <input id='show_dial' type='hidden' value="{if ($controls.show_dial!='off')}on{else}off{/if}" />
            <input id='show_wait' type='hidden' value="{if ($controls.show_wait!='off')}on{else}off{/if}" />
          </div>
          <a class='btn btn-primary btn-medium' href='#' id='submit'>
            <i class='icon-ok icon-white'></i>
            Применить
          </a>
          <!--
            <div id='loading'>
              <div class='progress progress-striped active'>
                <div class='bar' style='width: 100%;'>
                  <strong>Загрузка данных...</strong>
                </div>
              </div>
            </div>
          -->
        </form>
      </div>
    </div>
  </div>
</div>
