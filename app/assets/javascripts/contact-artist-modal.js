/**
 * Created by jd on 8/1/15.
 */
$(document).ready(
    function(){
        $(".conversation-form").bind("ajax:success",
            function(evt, data, status, xhr){
                //Success handled in create.js.erb
            }).bind("ajax:error", function(evt, data, status, xhr){
                //do something with the error here
                if(data.responseText) {
                    toastr.warning(data.responseText);
                }
                toastr.warning("Could not send message!");
            });
    });