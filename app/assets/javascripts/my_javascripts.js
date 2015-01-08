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
    $( '.as-callback.affix' ).width($( '.right-as' ).width());
  });
  $(window).resize(function() {
    $( '.as-callback.affix' ).width($( '.right-as' ).width());
  });
  $(window).scroll(function() {
    $( '.as-callback.affix' ).width( $( '.right-as' ).width());
  });
});

// callback modal window horizontal centering
$(document).ready(function() {
  $( '#modal-callback' ).on( 'show', function() {
    var marginsize = ( $(window).width() - 235) / 2;
    $( '#modal-callback' ).css( 'cssText', 'left:'+marginsize+'px !important;' );
  });
});

// highlight current page button
$(document).ready(function() {
  $( '.nav' ).find( 'a' ).each(function() {
    if ( $( this ).attr( 'href' ) == window.location.pathname ) {
      $( this ).closest( "li" ).addClass( 'highlight' );
    }
  });
});

// client_side validations gem init
$(document).ready(function() {
  $( '#modal-callback' ).on( 'shown', function() {
    $( ClientSideValidations.selectors.forms ).validate();
  });
});

// butterbrod button color inverse on menu colapse
$(document).ready(function() {
  $( '.nav-collapse' ).on( 'show', function() {
    $( '.btn-navbar' ).attr( 'style', 'background-color: #ffffff !important' );
    $( '.icon-bar' ).attr( 'style', 'background-color: #124191 !important' );
  });
  $( '.nav-collapse' ).on( 'hide', function() {
    $( '.btn-navbar' ).attr( 'style', 'background-color: #113176 !important' );
    $( '.icon-bar' ).attr( 'style', 'background-color: #ffffff: !important' );
  });
});

// new_callback blinking
setInterval(function() {
  $('blink').each(function() {
    $(this).css('visibility' , $(this).css('visibility') === 'hidden' ? '' : 'hidden')
  });
}, 250);
