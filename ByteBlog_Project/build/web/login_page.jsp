<%-- 
    Document   : login_page
    Created on : 08-Dec-2023, 8:35:40 am
    Author     : anuj
--%>

<%@page import="com.tech.blog.entities.message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        
        
<!--        Bootstrap link-->
            
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
       
<!--        CSS link-->
        <link rel="stylesheet" href="css/style.css" type="text/css">
        
<!-- font awesome icon link      -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <style>
            
            .banner{
                    clip-path: polygon(28% 2%, 71% 2%, 100% 2%, 100% 91%, 66% 96%, 34% 93%, 0 100%, 0 2%);
            }
            .primary{
                background-color: #546e7a ;
            }
            
            </style>
        
        
    </head>
    <body>
            
<!--        navbar-->
        
                <%@include  file="normal_navbar.jsp" %>
                
<!-- navbar closed               -->
                
        <main class="d-flex align-items-center primary-background banner" style="height: 90vh;">
            <div class="container">
                
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        
                        <div class="card">
                            <div class="card-header primary text-white text-center ">
                                <span class="fa fa-user-plus fa-2x"></span>
                                <br>
                                <p>Login Here!
                            </div>
                            
                            <%
                               message m = (message)session.getAttribute("msg");
                               
                               if(m!=null)
                               {
                            %>
                            
                            <div class="alert <%= m.getCssClass() %> text-center" role="alert">
                                    <%= m.getContent() %>
                            </div>
                               
                               
                               <%
                                    
                                    session.removeAttribute("msg");
                                    
                                }
                                
                             %>
                            
                            
                            <div class="card-body">
                                
                                <form action="loginServlet" method="POST">
                                  <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input name = "email" required placeholder="Enter you email here" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                  </div>
                                  <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input name="password" required placeholder="Enter your password here" type="password" class="form-control" id="exampleInputPassword1">
                                  </div>
                                  
<!--                                  <button type="submit" class="btn btn-primary">Submit</button>-->
                               
                                
                            </div>
                             <div class="card-footer primary container text-center">
                                 <button type="submit" class="btn btn-primary">Submit</button>
                            
                        </div>
                     </form>
                            
                        </div>
                        
                    </div>
                    
                    
                </div>
                
            </div>
            
            
            
            
        </main>
        
        
        
        
        
        
        
        
        
        
        
        
        
 <!--      JavaScript link  -->

       <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
       <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
       <script src="js/myjs.js" type="text/javascript"></script>
        
<!-- JavaScript link   -->
    </body>
</html>
