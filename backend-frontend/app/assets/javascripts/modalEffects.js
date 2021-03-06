/**
 * modalEffects.js v1.0.0
 * http://www.codrops.com
 *
 * Licensed under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 * 
 * Copyright 2013, Codrops
 * http://www.codrops.com
 */
var ModalEffects = (function() {

  function init() {

    [].slice.call( document.querySelectorAll( '.md-trigger' ) ).forEach( function( el, i ) {

      var modal = document.querySelector( '#' + el.getAttribute( 'data-modal' ) ),
        close = modal.querySelector( '.md-close' );

      function removeModal( hasPerspective ) {
        classie.remove( modal, 'md-show' );

        if( hasPerspective ) {
          classie.remove( document.documentElement, 'md-perspective' );
        }
      }

      function removeModalHandler() {
        removeModal( classie.has( el, 'md-setperspective' ) ); 
      }

      el.addEventListener( 'click', function( ev ) {
        if( !$('div').hasClass('md-show') ){
          classie.add( modal, 'md-show' );    
        }
        
        if( classie.has( el, 'md-setperspective' ) ) {
          setTimeout( function() {
            classie.add( document.documentElement, 'md-perspective' );
          }, 25 );
        }
      });

      close.addEventListener( 'click', function( ev ) {
        ev.stopPropagation();
        removeModalHandler();
      });

    } );

  }

  init();

})();

function clear_span(){
  $('.form-panel span').text('')
  $('.form-panel #request_title').val('')
  $('.form-panel #request_description').val('')
  $('.form-panel #problem_title').val('')
  $('.form-panel #problem_description').val('')
  $('.form-panel #incident_title').val('')
  $('.form-panel #incident_description').val('')
  $('.form-panel #comments_problem_description').val('')
  $('.form-panel #comments_request_description').val('')
  $('.form-panel #comments_incident_description').val('')
}



