// yandex maps init
$(document).ready(function() {
  ymaps.ready(init);
  var myMap,
      myPlacemark;

  function init() {
    var myMap = new ymaps.Map('map', {
      center: [56.0746, 47.275131],
      zoom: 16
    });

    var myPlacemark = new ymaps.Placemark(myMap.getCenter(), {
      balloonContentBody: [
        '<strong>Офис компании "Подбор Авто"</strong>',
        '<br/>',
        'Адрес: 428028, пр. Ивана Яковлева 39А, ТК "Хевел"',
      ].join('')
    }, {
      preset: 'islands#blueDotIcon'
    });

    myMap.geoObjects.add(myPlacemark);
  }
});

// callback div size fixing
$(document).ready(function() {
  $(window).load(function() {
    $('.as-callback.affix').width($('.right-as').width());
  });
  $(window).resize(function() {
    $('.as-callback.affix').width($('.right-as').width());
  });
  $(window).scroll(function() {
    $('.as-callback.affix').width($('.right-as').width());
  });
});

// callback modal window horizontal centering
$(document).ready(function() {
  $('#modal-callback').on('show', function() {
    var marginsize = ( $(window).width() - 235) / 2;
    $('#modal-callback').css('cssText', 'left:'+marginsize+'px !important;');
  });
});

// highlight current page button
$(document).ready(function() {
  $('.nav').find('a').each(function() {
    if ( $(this).attr('href') == window.location.pathname ) {
      $(this).closest('li').addClass('highlight');
    }
  });
});

// client_side validations gem init
$(document).ready(function() {
  $('#modal-callback').on('shown', function() {
    $( ClientSideValidations.selectors.forms ).validate();
  });
});

// butterbrod button color inverse on menu colapse
$(document).ready(function() {
  var $navColl = $('.nav-collapse'),
      $btnNav = $('.btn-navbar'),
      $iconBar = $('.icon-bar');
  $navColl.on('show', function() {
    $btnNav.addClass('btn-navbar-inverted');
    $iconBar.addClass('icon-bar-inverted');
  });
  $navColl.on('hide', function() {
    $btnNav.removeClass('btn-navbar-inverted');
    $iconBar.removeClass('icon-bar-inverted');
  });
});

// new_callback blinking
setInterval(function() {
  $('blink').each(function() {
    $(this).css('visibility' , $(this).css('visibility') === 'hidden' ? '' : 'hidden');
  });
}, 250);

// on affix event imitation for logo, phone, margin-left

$(document).ready(function () {
  var INTRO_HEIGHT = 78,
      phoneShow = false,
      $phone = $('.phone-1'),
      $logo = $('.logo-nav-desktop');
      $nav = $('ul.nav.pull-left');
  if ($(window).scrollTop() <= INTRO_HEIGHT) {
    $phone.removeClass('phone-show');
    $logo.removeClass('logo-nav-desktop-show');
    $nav.addClass('add-margin');
  } else {
    $phone.addClass('phone-show');
    $logo.addClass('logo-nav-desktop-show');
    $nav.removeClass('add-margin');
    phoneShow = true;
  }

  $(window).scroll($.throttle(200, scrollHandler));

  function scrollHandler() {
    var $pageOff = $(window).scrollTop();
    if (($pageOff > INTRO_HEIGHT) && (phoneShow === false)) {
      $phone.addClass('phone-show');
      $logo.addClass('logo-nav-desktop-show');
      $nav.removeClass('add-margin');
      phoneShow = true;
    } else if (($pageOff <= INTRO_HEIGHT) && (phoneShow === true)) {
      $phone.removeClass('phone-show');
      $logo.removeClass('logo-nav-desktop-show');
      $nav.addClass('add-margin');
      phoneShow = false;
    }
  }
});

