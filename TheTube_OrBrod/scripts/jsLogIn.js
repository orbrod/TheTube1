$(document).ready(function () {

    defence();
})
function defence() {
    var userName = document.getElementById("userName");
    var password = document.getElementById("password");
    document.getElementById("submit").disabled = true;
    if (userName.value.length > 1 && password.value.length > 1) {
        document.getElementById("submit").disabled = false;
    }
    else {
        document.getElementById("submit").disabled = true;
    }
}