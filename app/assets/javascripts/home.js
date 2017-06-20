(function($) {
    $(document).ready(function(){
        $(window).scroll(function(){
            if ($(this).scrollTop() > 300) {
                $('#homepage-navbar').fadeIn(500);
            } else {
                $('#homepage-navbar').fadeOut(500);
            }
        });
    });
})(jQuery);
