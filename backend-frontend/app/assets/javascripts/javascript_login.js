$(document).ready(function() {
  
  var animating = false,
      submitPhase1 = 2000,
      submitPhase2 = 400,
      logoutPhase1 = 800,
      $login = $(".login"),
      $app = $(".app");
  
  function ripple(elem, e) {
    $(".ripple").remove();
    var elTop = elem.offset().top,
        elLeft = elem.offset().left,
        x = e.pageX - elLeft,
        y = e.pageY - elTop;
    var $ripple = $("<div class='ripple'></div>");
    $ripple.css({top: y, left: x});
    elem.append($ripple);
  };
  
  $(document).on("click", ".login__submit", function(e) {
    if (animating) return;
    animating = true;
    var that = this;
    ripple($(that), e);
    $(that).addClass("processing");
    setTimeout(function() {
          $login.removeClass('animated shake');
          $(that).addClass("success");
          setTimeout(function() {
            $app.show();
            $app.css("top");
            $app.addClass("active");
          }, submitPhase2 - 70);
          setTimeout(function() {
            $login.addClass('animated shake');
            animating = false;
            $(that).removeClass("success processing");
          }, submitPhase2);
        }, submitPhase1);
        });    
    /*
    user = console.log($('#customer_id').val());
    pass = console.log($('#password').val());
    $.ajax({
      type: "POST",
      url: "sessions",
      dataType: "json",
      data: { customer_id: user, password: pass },
      success: function(){
        alert( "biennn" );
      },
      error: function() {
          setTimeout(function() {
          $login.removeClass('animated shake');
          $(that).addClass("success");
          setTimeout(function() {
            $app.show();
            $app.css("top");
            $app.addClass("active");
          }, submitPhase2 - 70);
          setTimeout(function() {
            $login.addClass('animated shake');
            animating = false;
            $(that).removeClass("success processing");
          }, submitPhase2);
        }, submitPhase1);
        }
    );
      */
    
  
  
  $(document).on("click", ".app__logout", function(e) {
    if (animating) return;
    $(".ripple").remove();
    animating = true;
    var that = this;
    $(that).addClass("clicked");
    setTimeout(function() {
      $app.removeClass("active");
      $login.show();
      $login.css("top");
      $login.removeClass("inactive");
    }, logoutPhase1 - 120);
    setTimeout(function() {
      $app.hide();
      animating = false;
      $(that).removeClass("clicked");
    }, logoutPhase1);
  });
  
});