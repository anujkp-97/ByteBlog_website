
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.postDao"%>
<%@page import="com.tech.blog.helper.connectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Contact Form</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        background-color: #f8f9fa;
        background: linear-gradient(0deg, rgba(86,96,235,1) 40%, rgba(86,171,233,1) 83%);
        height: 98vh;
        
                  
    }
    .contact-form {
        max-width: 500px;
        margin: 50px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    .form-group {
        margin-bottom: 20px;
    }
    label {
        font-weight: bold;
    }
    input, textarea {
        width: 100%;
        padding: 8px;
        border-radius: 5px;
        border: 1px solid #ccc;
    }
    button {
        padding: 8px 20px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    button:hover {
        background-color: #0056b3;
    }
    .left-align {
    margin-left: 0;
    margin-right: auto;
}
</style>

<!--        Bootstrap link-->
            
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
       
<!--        CSS link-->
        <link rel="stylesheet" href="css/style.css" type="text/css">
        
<!-- font awesome icon link      -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>
        <!--        navbar-->
        
           <nav class="navbar navbar-expand-lg navbar-light primary-background fixed-top font-weight-bold">
    <a class="navbar-brand" href="index.jsp"> <span class="fa fa-asterisk"></span>    ByteBlog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="profile.jsp?index.jsp"><span class="fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="contact_form.jsp"> <span class="fa fa-address-card-o"></span> Contact </a>
      </li>
      
      
          
 
      
       <li class="nav-item">
        <a class="nav-link" href="login_page.jsp"> <span class="fa fa-user-circle"></span> Login </a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="register_page.jsp"> <span class="fa fa-user-plus"></span> Sign up </a>
      </li>
     
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-light type="submit">Search</button>
    </form>
  </div>
</nav>
        
        <!--  navbar closed-->
<div class="container mt-4">
    <div class="row">
        <div class="col-md-10 mx-auto">
            <div class="contact-form mt-7" style="background: #f5f4f0; position: relative; padding-right: 50px;">
                <h2 class="mb-4">Contact Us</h2>
                <form id="contactForm" method="post">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" id="name" name="Cname" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="Cemail" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="contact">Contact no.</label>
                        <input type="number" id="contact" name="Ccontact" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="message">Message</label>
                        <textarea id="message" name="Cmessage" class="form-control" placeholder="Enter your message here!" rows="5" required></textarea>
                    </div>
                       
                            
                            <div class="container">
                                
                                   <div  class="text-center" id="loader" style="display:none;" >
                                       <span class="fa fa-refresh fa-spin fa-3x"></span>
                                       <h4>Please wait...</h4>
                                       
                                   </div>
                                   <hr>
                            <button type="submit" id="submit-btn" class="btn btn-primary">Submit</button>
                            </div>
                            
                </form>
                                
            </div>
             
        </div>
         
    </div>
</div>
        
<!--        javascript link-->
       <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
       <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>



<script>
    
    
    
     $(document).ready(function(){
               console.log("loaded...");
               
               $('#contactForm').on('submit',function(event){
                  
                   event.preventDefault();
                 
                   let  form = JSON.stringify($("#contactForm").serializeArray());
                   console.log(form);
                   
                   $("#submit-btnn").hide();
                   $("#loader").show();
                   
                   
                                      
                   //send register servlet
                   
                   $.ajax({
                       
                       url: "contactServelet",
                       type: 'POST',
                       data: form,
                       success: function (response){
                          console.log(response); 
                          
                            $("#submit-btn").show();
                             $("#loader").hide(); 
                             
                       
                             swal("Successful submitted!!!")
                                .then((value) => {
                                    window.location="contact_form.jsp";
                                });
                         
                       
                          
                       },
                       
                       error: function(jqXHR, textStatus, errorThrown){
                         
                                   $("#submit-btn").show();
                                      $("#loader").hide(); 
                                swal("Something went wrong! Try again")
                               
                       
                             
                        
                       },
                       
                       processData: false,
                       contentType: false,
                               
                   });
                   
                   
               });
               
           });
                
    
    
    
    
</script>

</body>
</html>
