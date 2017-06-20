(function($) {
    $(document).ready(function(){
        $(window).scroll(function(){
            if ($(this).scrollTop() > 300) {
                $('#homepage-navbar').fadeIn(500);
            } else {
                $('#homepage-navbar').fadeOut(500);
            }
        });


        $('<img/>').attr('src', 'https://c1.staticflickr.com/5/4245/35040805720_3ff5b9f37e_o.png').on('load', function() {
           $(this).remove();
           $('.jumbotron').css('background-image', 'url(https://c1.staticflickr.com/5/4245/35040805720_3ff5b9f37e_o.png)').hide().fadeIn(0);

           $('#overlay').fadeIn(0);
        });


        $("#arrow").click(function() {
          $('html, body').animate({
            scrollTop: $("#grid").offset().top
          }, 1000);
        });

    });
})(jQuery);
