/**
 * Created by valua on 9/2/2016.
 */
$(document).ready(function(){
    $('#updateUsername').submit(function(){
        var username = $('#username').val();
        $.ajax({
            url: 'update',
            type: 'POST',
            dataType: 'json',
            data:{id: "user", username: username},
           // data: $('#updateUsername').serialize(),
            success: function(data){
               /* if(data.isValid){
                    var str=data.username;
                    $('p.displayName').html('<p>Hello,'+ data.username + ' <em>You bet!</em></p>');
                }
                else{
                    alert('Please enter a valid username!');
                }*/

                var str = data[0].address+ " name " + data[0].name+ " email "+ data[0].email;
                $('p.displayName').html('<p>Hello,'+ str + ' <em>You bet!</em></p>');
                //TODO onclick
            }

        });
        return false;

    });
});

