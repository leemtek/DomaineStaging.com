

$(document).ready(function()
{

$.post("action.asp",{ rand:Math.random(),action:'onload' } ,function(data)
        {
		  //alert(data.mdata);
		  if(data.error==0) //if correct login detail
		  {
		  
		  $("#userlogin1").html(data.mdata).fadeTo(900,1);
		  
		  $("#email_username").focus();
	$("#login").submit(function()
	{
		
	
		$("#login_response").removeClass().addClass('messagebox').text('Validating....').fadeIn(1000);
		
		$.post("action.asp",{ user_name:$('#email_username').val(),password:$('#password').val(),rand:Math.random(),action:'onsubmit' } ,function(data)
        {
		  if(data.error==0) //if correct login detail
		  {
		  	$("#login_response").fadeTo(200,0.1,function()  //start fading the messagebox
			{ 
			  //add message and change the class of the box and start fading
			  $(this).html('Logging in.....').addClass('messageboxok').fadeTo(900,1,
              function()
			  { 
			  	 //redirect to secure page
				 document.location='membersonly.asp';
			  });
			  
			});
		  }
		  else 
		  {
		  	$("#login_response").fadeTo(200,0.1,function() //start fading the messagebox
			{ 
			  //add message and change the class of the box and start fading
			  $(this).html(data.mdata).addClass('messageboxerror').fadeTo(900,1);
			});		
          }
				
        }, "json");
 		return false; //not to post the  form physically
	});
		 
		  }
		  
				
        }, "json");




	//now call the ajax also focus move from 
	/*$("#password").blur(function()
	{
		$("#login").trigger('submit');
	});*/
});