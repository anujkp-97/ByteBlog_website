<%-- 
    Document   : register_page
    Created on : 08-Dec-2023, 9:45:56 am
    Author     : anuj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        
        <!--        Bootstrap link-->
            
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
       
<!--        CSS link-->
        <link rel="stylesheet" href="css/style.css" type="text/css">
        
<!-- font awesome icon link      -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <style>
            .banner-background{
clip-path: polygon(28% 2%, 71% 2%, 100% 2%, 100% 91%, 66% 96%, 34% 93%, 0 100%, 0 2%);
     
            }
            
            .primary{
                background-color: #546e7a ;
            }
            
        </style>
        
        
        
        
        
    </head>
    <body>
            
<!--        navbar-->

            <%@include file="normal_navbar.jsp" %>
        
        <main class="primary-background p-5 mt-0 banner-background" style="height: 97vh;">
            
            <div class="container p-3">
              
                <div class="col-md-6 offset-md-3">
                 
                    <div class="card" style="max-width: 450px;">
                        <div class="card-header mb-1 text-center primary text-white">
                            <span class="fa fa-3x fa-user-circle"></span>
                            <p>Register Here</p>
                            
                        </div>
                        <div class="card-body">
                            <form id="reg-form"  action="registerServlet" method="POST">
                                    <div class="mb-3">
                              
                                    <input name="user_name" type="text" class="form-control" id="username" aria-describedby="name" placeholder="Enter your name here">
                                  </div>
                                    
                                    
                                  <div class="mb-3">
<!--                                    <label for="exampleInputEmail1" class="form-label">Email address</label>-->
                                    <span></span>
                                    <input  name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter your email">
                                  </div>
                                    
                                   <div class="mb-3">
<!--                                    <label for="exampleInputEmail1" class="form-label">Email address</label>-->
                                    <input  name="user_contact" type="number" class="form-control" id="contact" aria-describedby="contactHelp" placeholder="Enter your contact number">
                                  </div>  
                                    
                                  <div class="mb-3">
<!--                                    <label for="exampleInputPassword1" class="form-label">Password</label>-->
                                    <input  name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter your password">
                                  </div>
                                    
                                  <div class="mb-3">
                                    <label for="gender">Select Gender : </label>
                                    <div>
                                        <input class="radio-inline pr-3"  type="radio" id="gender"  name="gender" value="Male"> Male
                                        <input  class="radio-inline ml-3" type="radio" id="gender" name="gender" value="Female"> Female 
                                    </div>    
                                   
                                  </div>
<!--                                    
                                    <div class="group-class">
                                    
                                        <textarea name="about" class="form-control" id="" rows="5" placeholder="Enter something about yourself" />
                                    </div>-->
                                
                                  <div class="mb-3">
                                   
                                      
                                  </div>
                                    
                                  <div class="mb-3 form-check">
                                    <input  name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
                                  </div>


                            <div class="container">
                                
                                   <div  class="text-center" id="loader" style="display:none;" >
                                       <span class="fa fa-refresh fa-spin fa-3x"></span>
                                       <h4>Please wait...</h4>
                                       
                                   </div>
                                   <hr>
                                <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button> 
                            </div>
                                
                              
                            
                        </div>
                       
                         </form>
                    </div>
                    
                </div>
                
            </div>
    
        </main>
        
        
        
        
        
        
        
        
        
        
        
        
<!--      JavaScript link  -->

       <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
       <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
       <script src="js/myjs.js" type="text/javascript"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
       
       
       <script>
           $(document).ready(function(){
               console.log("loaded...")
               
               $('#reg-form').on('submit',function(event){
                   
                   event.preventDefault();
                   
                   let  form = new FormData(this);
                   
                   $("#submit-btn").hide();
                   $("#loader").show();
                   
                   
                   
                   
                   //send register servlet
                   
                   $.ajax({
                       
                       url: "registerServlet",
                       type: 'POST',
                       data: form,
                       success: function (data,textStatus, jqXHR){
                          console.log(data); 
                          
                            $("#submit-btn").show();
                             $("#loader").hide(); 
                             
                       
                             swal("Registered Successfully! Redirected to Login Page")
                                .then((value) => {
                                    window.location="login_page.jsp";
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
       
       
        
<!-- JavaScript link   -->   
        
    </body>
</html>
