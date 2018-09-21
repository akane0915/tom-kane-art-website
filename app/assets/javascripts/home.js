(function($) {
  $(document).ready(function(){
    $('#arrow').hide()

    $('#toggle').click(function() {
      $(this).toggleClass('active');
      $('#overlay-navbar').toggleClass('open');

    });

    var currentPath = window.location.pathname;

    var detailPageLoad = function() {
      var img = $("img")[0];
      var imgSource = $("img")[0].currentSrc;
      $('<img/>').attr('src', imgSource).on('load', function() {
        $(this).remove();
        $('.detail-image').hide().fadeIn(3000);
        $('.painting-details').hide().fadeIn(3000);
      });
    }

    var galleryPageLoad = function() {
      $('<img/>').attr('src', 'https://tomkaneart.s3.amazonaws.com/paintings/440367a1-8774-41a9-a131-4146d7e8e5cf/pclip_image/masthead_35040805720_3ff5b9f37e_o.jpg').on('load', function() {
        $(this).remove();
        $('.jumbotron').css('background-image', 'url(https://tomkaneart.s3.amazonaws.com/paintings/440367a1-8774-41a9-a131-4146d7e8e5cf/pclip_image/masthead_35040805720_3ff5b9f37e_o.jpg)').hide().fadeIn(3000);
        $('#overlay').fadeIn(5000);
        $('#arrow').hide().fadeIn(5000);
      });

      $("#arrow").click(function() {
        $('html, body').animate({
          scrollTop: $("#grid").offset().top
        }, 1000);
      });

      $(".image-container").hover(function() {
        $(this).find(".painting-center-title").fadeIn(300);
      },
      function() {
        $(this).find(".painting-center-title").fadeOut(300);
      });
    }

    if (currentPath === "/details/index") { detailPageLoad() }
    if (currentPath === "/") { galleryPageLoad() }

  });
})(jQuery);
