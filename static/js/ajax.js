function ReSendOTP(username, mess_id){

    mess = document.getElementById(mess_id)
    mess.innerText = "Sending..."
    $.ajax({
        type: 'GET',
        url: '/signup/resendOTP',
        data: {user:username},
        success: function(data){
            mess.innerText = data;
        }
    })
}