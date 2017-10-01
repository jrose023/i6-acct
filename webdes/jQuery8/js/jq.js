$(document).ready(function() {
  // All your jQuery code should go inside here

  // Wrap your script in a jQuery ready event.
  // Use jQuery syntax to access elements (i.e. with CSS-style selectors).
  // Use jQuery syntax to change element content.
  // Use jQuery syntax to change element style.
  // Use jQuery syntax to apply an effect to an element.
  // At least one of these changes should occur in response to a user event, such as “click.”




  //animate homepage gif
  $('#zoo').hide().delay(500).fadeIn();
  $('#zoo').hover(function() {
    $(this).attr('src', "images/zoolander.gif");
  }, function() {
    $(this).attr('src', "images/zoolander.png");
  });



  //spin home button
  //code adapted from https://sarfraznawaz.wordpress.com/tag/css3/
  $('#chip').hover(function(){
    var interval = null;
    var counter = 0;
    var $this = $(this);
    clearInterval(interval);

    interval = setInterval(function(){
      if (counter != -360) {
        counter -= 5;
        $this.css({
          MozTransform: 'rotate(-' + -counter + 'deg)',
          WebkitTransform: 'rotate(' + -counter + 'deg)',
          transform: 'rotate(' + -counter + 'deg)'
        });
      }
    }, 1);
  });


  //zoom images on info pages
  $('.tallimage, .wideimage, .boximage').width(200);

  $('.tallimage, .wideimage, .boximage').mouseover(function(){
    $(this).css("cursor","pointer");
    $(this).animate({width: "500px"}, 'fast');
  });
  $('.tallimage, .wideimage, .boximage').mouseout(function(){
    $(this).animate({width: "200px"});
  });



  //night mode button toggle
  $('#night').css('background-color','white');
  $('#night').css('color','#007264');
  $('#night').text('All-nighter');

  $("#night").click(function() {
    $(".details, body").toggleClass("night-mode");
  });

  //homepage form validation plugin
  $('form').validate();


});
