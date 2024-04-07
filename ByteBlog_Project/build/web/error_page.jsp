

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry ! something went wrong</title>
        
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
            body{
                background-color: #0D5C5E;
            }
            
        </style>
    
        
        
        
        
    </head>
    <body>
       
        
        <div class="container text-center">
            
            <img src="image/error1.png" class="image-fluid" >
            
            <h3 class="display-5" style="color: #FF0F3F">Try again ! Something went wrong...</h3>
            <%= exception%>
            <a href ="index.jsp" class="btn btn-success primary-background btn-lg text-white mt-3">Home </a>
            
            
            
            
            
        </div>
        
        
        
    </body>
</html>
