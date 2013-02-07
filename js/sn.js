// Generated by CoffeeScript 1.3.3

$(function() {
  var methods;
  methods = {
    init: function(options) {
      var def;
      if (!options) {
        options = {};
      }
      def = {
        content: {},
        result: {
          key: ''
        }
      };
      $.extend(true, def, options);
      $(this).data('sn', def);
      $(this).snTriggers();
      if ($("#controls").html() !== "") {
        return $(this).snEvents({
          'href': '#autoload'
        });
      }
    }
  };
  return $.fn.sn = function(sn) {
    if (!sn) {
      sn = {};
    }
    if (methods[sn]) {
      return methods[sn].apply(this, Array.prototype.slice.call(arguments, 1));
    } else {
      if (typeof sn === 'object' || !sn) {
        return methods.init.apply(this, arguments);
      } else {
        return $.error('Метод ' + sn + ' не существует');
      }
    }
  };
});
// Generated by CoffeeScript 1.3.3

$(function() {
  var methods;
  methods = {
    init: function() {
      $(this).snPlayer('onClickPlay');
      return $(this).snPlayer('onClickclose');
    },
    onClickclose: function() {
      return $("#player-close").on("click", function(e) {
        e.prevEventDefault();
        return $("#player-wrap").hide();
      });
    },
    onClickPlay: function() {
      return $("a.play").on("click", function(e) {
        var id, src;
        e.prevEventDefault();
        id = $(this).data('id');
        src = $(this).data('src');
        $("#player-wrap").show();
        $("#player").html('<audio/>'.data('id', id));
        return audiojs.events.ready(function() {
          var a, audio;
          a = audiojs.createAll();
          audio = a[0];
          $("#player-close").on("click", function(e) {
            e.prevEventDefault();
            audio.pause();
            return $("#player").html('');
          });
          audio.load(src);
          return audio.play();
        });
      });
    }
  };
  return $.fn.snPlayer = function(sn) {
    if (!sn) {
      sn = {};
    }
    if (methods[sn]) {
      return methods[sn].apply(this, Array.prototype.slice.call(arguments, 1));
    } else {
      if (typeof sn === 'object' || !sn) {
        return methods.init.apply(this, arguments);
      } else {
        return $.error('Метод ' + sn + ' не существует');
      }
    }
  };
});
// Generated by CoffeeScript 1.3.3

$(function() {
  var methods;
  methods = {
    init: function(options) {},
    sendRequest: function(options) {
      var def, sn;
      if (!options) {
        options = {};
      }
      def = {
        type: 'json',
        debug: false,
        action: 'submit',
        login: $('#inputLogin').val(),
        password: $('#inputPassword').val(),
        page: $('#page').val(),
        id: '',
        message: '',
        src: $('#src').val(),
        dst: $('#dst').val(),
        date1: $('#date1').val(),
        date2: $('#date2').val(),
        limit: $('#limit').val(),
        order: $('#order').val(),
        grad: $('#grad').val(),
        phone: '',
        show_short_calls: $('#show_short_calls').val(),
        show_answered: $('#show_answered').val(),
        show_no_answer: $('#show_no_answer').val(),
        show_busy: $('#show_busy').val(),
        show_failed: $('#show_failed').val(),
        show_hangup: $('#show_hangup').val(),
        show_playback: $('#show_playback').val(),
        show_dial: $('#show_dial').val(),
        show_wait: $('#show_wait').val()
      };
      $.extend(true, def, options);
      if (def.debug) {
        def.type = 'text';
      }
      sn = $(this).data('sn');
      return $.ajax({
        url: 'index.php',
        type: 'POST',
        data: {
          action: def.action,
          page: def.page,
          login: def.login,
          password: def.password,
          id: def.id,
          message: def.message,
          src: def.src,
          dst: def.dst,
          date1: def.date1,
          date2: def.date2,
          limit: def.limit,
          order: def.order,
          grad: def.grad,
          phone: def.phone,
          show_short_calls: def.show_short_calls,
          show_answered: def.show_answered,
          show_no_answer: def.show_no_answer,
          show_busy: def.show_busy,
          show_failed: def.show_failed,
          show_hangup: def.show_hangup,
          show_playback: def.show_playback,
          show_dial: def.show_dial,
          show_wait: def.show_wait,
          key: sn.result.key
        },
        dataType: def.type,
        timeout: 10000,
        beforeSend: function() {
          return $("#loading").show();
        },
        success: function(s) {
          if (typeof s === 'object') {
            $.extend(true, sn.result, s);
          } else {
            if (def.debug) {
              alert(s);
            }
            sn.result = s;
          }
          $(this).data('sn', sn);
          if (typeof sn.result === 'object') {
            if (sn.result.alert) {
              alert(sn.result.alert);
            }
            if (sn.result.callback) {
              $(this).snEvents({
                href: '#' + sn.result.callback
              });
            }
          }
          return $("#loading").hide();
        },
        error: function(XMLHttpRequest, textStatus, error) {}
      });
    }
  };
  return $.fn.snAjax = function(sn) {
    if (!sn) {
      sn = {};
    }
    if (methods[sn]) {
      return methods[sn].apply(this, Array.prototype.slice.call(arguments, 1));
    } else {
      if (typeof sn === 'object' || !sn) {
        return methods.init.apply(this, arguments);
      } else {
        return $.error('Метод ' + sn + ' не существует');
      }
    }
  };
});
// Generated by CoffeeScript 1.3.3

$(function() {
  var methods;
  methods = {
    init: function(options) {
      return $(this).snConf(main);
    },
    main: function(options) {
      var sn;
      sn = $(this).data(sn);
      return $.ajax({
        url: 'sn-project/settings/main.json',
        async: false,
        dataType: 'json',
        success: function(s) {
          $.extend(true, sn, s);
          return $(this).data('sn', sn);
        }
      });
    }
  };
  return $.fn.snConf = function(sn) {
    if (!sn) {
      sn = {};
    }
    if (methods[sn]) {
      return methods[sn].apply(this, Array.prototype.slice.call(arguments, 1));
    } else {
      if (typeof sn === 'object' || !sn) {
        return methods.init.apply(this, arguments);
      } else {
        return $.error('Метод ' + sn + ' не существует');
      }
    }
  };
});
// Generated by CoffeeScript 1.3.3

$(function() {
  var methods;
  methods = {
    init: function(options) {
      var def, href, sn, th;
      def = {
        href: 'none'
      };
      $.extend(true, def, options);
      th = $(this);
      sn = $(this).data('sn');
      href = def.href;
      switch (href.replace(/(.*)#(.*)/, '$2')) {
        case "autoload":
          $("#dp1").datepicker();
          $("#dp2").datepicker();
          $(this).snEvents({
            href: '#fbRequest'
          });
          return $(this).snPlayer();
        case "signin":
          $("#signin-error").hide();
          return $(this).snAjax('sendRequest', {
            action: 'signin',
            debug: false
          });
        case "afterSignin":
          if (sn.result) {
            if (sn.result.response) {
              if (sn.result.controls) {
                $('#controls').html(sn.result.controls);
              }
              $("#signin").empty();
              $(this).snTriggers('controls');
              $("#dp1").datepicker();
              $("#dp2").datepicker();
              $(this).snAjax('sendRequest', {
                action: 'submit',
                debug: false
              });
              return $(this).snPlayer();
            } else {
              $("#inputLogin").val('');
              $("#inputPassword").val('');
              return $("#signin-error").show();
            }
          }
          break;
        case "submit":
          return $(this).snAjax('sendRequest', {
            action: 'submit',
            debug: false
          });
        case "afterSubmit":
          if (sn.result) {
            if (sn.result.table) {
              $("#table").html(sn.result.table);
              $(this).snTriggers('sort');
              $(this).snTriggers('detail');
              $(this).snPlayer('onClickPlay');
            }
            if (sn.result.stat) {
              $("#stat").html(sn.result.stat);
            }
            if (sn.result.pagination) {
              $("#pagination").html(sn.result.pagination);
              $(this).snTriggers('pagination');
            }
            return $(this).snEvents({
              href: '#fbRequest'
            });
          }
          break;
        case "fbRequest":
          return $(".no-fb").each(function() {
            if ($(this).val() !== "") {
              th.snAjax('sendRequest', {
                action: 'fbRequest',
                phone: $(this).val(),
                debug: false
              });
              return $(this).removeClass('no-fb');
            }
          });
        case "afterFbRequest":
          if (sn.result) {
            if (sn.result.response) {
              if (sn.result.response.hash) {
                return $("." + sn.result.response.hash).html(sn.result.response.caption);
              }
            }
          }
          break;
        case "close":
          return $(this).hide();
      }
    }
  };
  return $.fn.snEvents = function(sn) {
    if (!sn) {
      sn = {};
    }
    if (methods[sn]) {
      return methods[sn].apply(this, Array.prototype.slice.call(arguments, 1));
    } else {
      if (typeof sn === 'object' || !sn) {
        return methods.init.apply(this, arguments);
      } else {
        return $.error('Метод ' + sn + ' не существует');
      }
    }
  };
});
// Generated by CoffeeScript 1.3.3

$(function() {
  var methods;
  methods = {
    init: function() {
      if ($("#controls").html() !== "") {
        $(this).snTriggers('controls');
      }
      if ($("#table").html() !== "") {
        $(this).snTriggers('sort');
        $(this).snTriggers('detail');
      }
      if ($("#pagination").html() !== "") {
        $(this).snTriggers('pagination');
      }
      if ($("#signin").html() !== "") {
        return $(this).snTriggers('signin');
      }
    },
    controls: function() {
      $(this).snTriggers('submit');
      $(this).snTriggers('cb');
      $(this).snTriggers('limit');
      return $(this).snTriggers('filters');
    },
    signin: function() {
      var th;
      th = $(this);
      return $("#fSignin").on("submit", function(e) {
        e.preventDefault();
        return th.snEvents({
          href: '#signin'
        });
      });
    },
    submit: function() {
      var th;
      th = $(this);
      $("#fSubmit").on("submit", function(e) {
        e.preventDefault();
        $("#page").val('1');
        return th.snEvents({
          href: '#submit'
        });
      });
      return $("#submit").on("click", function(e) {
        e.preventDefault();
        $("#page").val('1');
        return th.snEvents({
          href: '#submit'
        });
      });
    },
    limit: function() {
      var sn, th;
      th = $(this);
      sn = $(this).data('sn');
      return $(".limit a").on("click", function(e) {
        e.preventDefault();
        $(this).addClass('active').siblings().removeClass('active');
        $('#limit').val($(this).data('limit'));
        $("#page").val('1');
        return th.snEvents({
          href: '#submit'
        });
      });
    },
    cb: function() {
      var th;
      th = $(this);
      return $(".cb").on("click", function(e) {
        e.preventDefault();
        if ($(this).is(':checked')) {
          $('#' + $(this).data('cb')).val('on');
        } else {
          $('#' + $(this).data('cb')).val('off');
        }
        $("#page").val('1');
        return th.snEvents({
          href: "#submit"
        });
      });
    },
    filters: function() {
      var sn, th;
      th = $(this);
      sn = $(this).data('sn');
      return $(".filters li a").on("click", function(e) {
        e.preventDefault();
        if ($(this).data('value' === 'on')) {
          $('i', this).removeClass('icon-ok').addClass('icon-none');
          $(this).data('value', 'off');
          $('#' + $(this).data('cb')).val('off');
        } else {
          $('i', this).removeClass('icon-none').addClass('icon-ok');
          $(this).data('value', 'on');
          $('#' + $(this).data('cb')).val('on');
        }
        $("#page").val('1');
        return th.snEvents({
          href: "#submit"
        });
      });
    },
    detail: function() {
      var th;
      th = $(this);
      return $("a.tel").on("click", function(e) {
        e.preventDefault();
        $("#dst").val($(this).html());
        $("#src").val($(this).html());
        $("#page").val('1');
        return th.snEvents({
          href: "#submit"
        });
      });
    },
    sort: function() {
      var th;
      th = $(this);
      return $("a.sort").on("click", function(e) {
        e.preventDefault();
        $("#order").val($(this).data('order'));
        $("#grad").val($(this).data('grad'));
        $("#page").val('1');
        return th.snEvents({
          href: "#submit"
        });
      });
    },
    pagination: function() {
      var th;
      th = $(this);
      $("a#prev").on("click", function(e) {
        e.preventDefault();
        $("#page").val(($("#page").val() * 1) - 1);
        return th.snEvents({
          href: "#submit"
        });
      });
      $("a.list").on("click", function(e) {
        e.preventDefault();
        $("#page").val($(this).data("page"));
        return th.snEvents({
          href: "#submit"
        });
      });
      return $("a#next").on("click", function(e) {
        e.preventDefault();
        $("#page").val(($("#page").val() * 1) + 1);
        return th.snEvents({
          href: "#submit"
        });
      });
    }
  };
  return $.fn.snTriggers = function(sn) {
    if (!sn) {
      sn = {};
    }
    if (methods[sn]) {
      return methods[sn].apply(this, Array.prototype.slice.call(arguments, 1));
    } else {
      if (typeof sn === 'object' || !sn) {
        return methods.init.apply(this, arguments);
      } else {
        return $.error('Метод ' + sn + ' не существует');
      }
    }
  };
});
