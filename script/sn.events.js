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
            debug: true
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
                action: 'phone',
                phone: $(this).val(),
                debug: false
              });
              return $(this).removeCLass('no-fb');
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
