/**
 * Created by valua on 9/24/2016.
 */
function openNav() {
    document.getElementById("myNav").style.width = "100%";
    $('#login').replaceWith("<input id='login' type='text' size='20'>");
    $('#password').replaceWith("<input id='password' type='password' size='20'>");
    $('p.fail').html('<h1 style="color:white;"></h1>');
}

function closeNav() {
    document.getElementById("myNav").style.width = "0%";
}
$(document).ready(function(){
    $('#loginField').submit(function(){
        var login = $('#login').val();
        var password = $('#password').val();
        $.ajax({
            url: 'update',
            type: 'POST',
            dataType: 'json',
            data:{id: "log",login: login, pass: password},
            success: function(data){
                if(!data[0].userName){
                    $('#login').replaceWith("<input class = 'redinput' id='login' type='text' size='20'>");
                    $('#password').replaceWith("<input class = 'redinput' id='password' type='password' size='20'>")
                    $('p.fail').html('<h1 style="color:white;">Your username or password is incorect!</h1>');
                }
                else{
                    var type=true;
                    if(data[0].userType==type)
                        document.location.href="/admin_user.jsp";
                    else
                        document.location.href="/logged_user.jsp";
                }
            }
        });
        return false;
    });
});
function  checkLogin() {


}