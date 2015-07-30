/**
 * Created by brockwhittaker on 7/18/15.
 */

function sendComments () {
    var fname = document.getElementById('fname').value;
    var lname = document.getElementById('lname').value;
    var email = document.getElementById('email').value;
    var comments = document.getElementById('comments').value;

    body = "fname=" + fname + "&lname=" + lname + "&email=" + email + "&comments=" + comments;

    nanoajax.ajax({url: "https://www.studiocracy.com/php/mailer.php", method: 'POST', body: body}, function (code, responseText, request) {
        data = responseText;
        document.getElementById('post-response').innerHTML = data;
    });
}

document.getElementById('submit-comments').addEventListener('click', sendComments);