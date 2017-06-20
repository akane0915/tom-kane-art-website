(function($) {


  $(document).ready(function(){
    $(window).scroll(function(){
      if ($(this).scrollTop() > 300) {
        $('#homepage-navbar').fadeIn(500);
      } else {
        $('#homepage-navbar').fadeOut(500);
      }
    });

    $(".image-container").hover(function() {
      $(this).find(".painting-center-title").fadeIn(300);
    },
    function() {
      $(this).find(".painting-center-title").fadeOut(300);
    });


  });
})(jQuery);
