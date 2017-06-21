(function($) {
  $(document).ready(function(){

    // Navbar display on scroll
    // $(window).scroll(function(){
    //   if ($(this).scrollTop() > 500) {
    //     $('#homepage-navbar').fadeIn(500);
    //   } else {
    //     $('#homepage-navbar').fadeOut(500);
    //   }
    // });

    // Jumbotron fade in on load
    $('<img/>').attr('src', 'https://c1.staticflickr.com/5/4245/35040805720_3ff5b9f37e_o.png').on('load', function() {
      $(this).remove();
      $('.jumbotron').css('background-image', 'url(https://c1.staticflickr.com/5/4245/35040805720_3ff5b9f37e_o.png)').hide().fadeIn(3000);
      //Jumbotron text fade in on load
      $('#overlay').fadeIn(5000);
    });

    //Jumbotron arrow scroll on click
    $("#arrow").click(function() {
      $('html, body').animate({
        scrollTop: $("#grid").offset().top
      }, 1000);
    });

    //Image Gallery hover effects
    $(".image-container").hover(function() {
      $(this).find(".painting-center-title").fadeIn(300);
    },
    function() {
      $(this).find(".painting-center-title").fadeOut(300);
    });

    // Navbar Animation to display links
    $('#toggle').click(function() {
      console.log("click");
      $(this).toggleClass('active');
      $('#overlay-navbar').toggleClass('open');

    });
  });
})(jQuery);
