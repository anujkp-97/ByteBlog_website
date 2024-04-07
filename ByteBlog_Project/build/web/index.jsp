<%-- 
    Document   : index
    Created on : 07-Dec-2023, 5:09:49 pm
    Author     : anuj
--%>

<%@page import="com.tech.blog.entities.user"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.connectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
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
        </style>
   
    
    
    </head>
    <body>
        
<!--            navbar-->
        <%@include file="normal_navbar.jsp" %>
        
          <%
                  LikeDao ld = new LikeDao(connectionProvider.getConnection());
                      user use =(user)session.getAttribute("currentUser");

          %>
        
<!--    banner-->
        <div class="container-fluid p-0 m-0">
            
            <div class="jumbotron primary-background text-white banner-background">
                 <div class="container">
                    <h3 class="display-4">Welcome, to ByteBlog</h3>
                    
                    <p>Welcome to ByteBlog, your go-to source for all things tech!  </p>
                    <p> Our featured content section highlights the latest trends, insights, and updates in the world of technology. From in-depth reviews of the newest tech to expert analysis of industry developments, ByteBlog keeps you informed and ahead of the curve.</p>
                    <p>Whether you're a tech enthusiast, a professional in the industry, or simply curious about the latest tech trends, ByteBlog has something for everyone. Join us on a journey through the exciting world of technology, where every byte counts!</p>
                    
                    <a href="contact_form.jsp"> <button class="btn btn-outline-light"> <span class="fa fa-user-plus"></span> Subscribe! It's free</button></a>
                    <a href="login_page.jsp" class="btn btn-outline-light"> <span class="fa fa-user-circle fa-spin"></span>  Login</a>

                 </div>
            </div>
        </div>
       
<!--//cards-->

    

    <div class="container">
        <div class="row m-4">            
            
                
                <%
                   postDao dao = new postDao(connectionProvider.getConnection()); 
                   List<Post> list =  dao.getAllPosts();
                   for(Post p: list)
                   {
                 %>
                    <div class="col-md-3 mb-3 ">
                    <div class="card " style="height: 250px; overflow: hidden;" >
            <div class="card-body" style="height: 100px; overflow: hidden;"  >
                <b><%= p.getpTitle() %> </b> 
                <hr style="  margin: 5px 0; border-top: 1px solid #0C6EE9;">
                  <p class="card-text"><%= p.getpContent().substring(0,95) %> ... </p>
            </div>
          <div class="card-footer primary-background text-center">
              
            
              
               <a href="login_page.jsp"  class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up" ></i><span class="like-counter"> <%=ld.countLikeOnPost(p.getPid()) %>   </span> </a>
              <a href="show_blog_page.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-light btn-sm">Read more.. </a>
              <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o" ></i><span>20</span> </a>
          </div>
               
          
      </div>
               </div>   
                 <%
                   }

                   
                 %>
                
                
                    
        </div>
    </div>
                 
        
<!--      JavaScript link  -->

       <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
       <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
       <script src="js/myjs.js" type="text/javascript"></script>
        
<!-- JavaScript link   -->
    </body>
</html>
