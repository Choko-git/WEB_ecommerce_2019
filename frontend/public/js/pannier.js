$(document).ready(function($){
    if (document.cookie.includes("login_token")) {
        var token = "abcde";
        document.cookie = "login_token="+token;
    }

    
});