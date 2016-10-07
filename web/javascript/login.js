/**
 * Created by valua on 9/24/2016.
 */
$(function(){
    $('#logzone').click(function(){
        $('#overlay').fadeIn('fast', function(){
            $('#box').fadeIn('fast',function(){
                window_width = $(window).width();
                window_height = $(window).height();
                obj_width = $('#box').width();
                obj_height = $('#box').height();
                $('#box').css('top', (window_height/2)-(obj_width/2)).css('left',
                    (window_width/2)-(obj_width/2));
                change_value('#login', 'login');
                change_value('#password', 'password');

            })
        })
    })
})

$('boxclose').click(function(){
    $('#box').animate({'top': '-2100px'},500,
    function(){
        $('#overlay').fadeOut('fast');
    })
})