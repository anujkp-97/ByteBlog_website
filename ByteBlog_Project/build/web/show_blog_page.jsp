<%-- 
    Document   : show_blog_page
    Created on : 03-Apr-2024, 4:19:49 pm
    Author     : anuj
--%>

<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.postDao"%>
<%@page import="com.tech.blog.helper.connectionProvider"%>
<%@page import="com.tech.blog.entities.user"%>
<%@page import="com.tech.blog.dao.userdao"%>
<%@page errorPage="error_page.jsp" %>

<%
        user use = (user)session.getAttribute("currentUser");
        
        if(use == null)
        {
        response.sendRedirect("login_page.jsp");
}

    
    %>


<% 
        int postId = Integer.parseInt(request.getParameter("post_id"));
        
        postDao d= new postDao(connectionProvider.getConnection());
        Post p = d.getPostByPostId(postId);

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <div id="fb-root"></div>
        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/hi_IN/sdk.js#xfbml=1&version=v19.0" nonce="7dZNETuI"></script>
       
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle() %></title>
        
                <!--        Bootstrap link-->
            
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
       
<!--        CSS link-->
        <link rel="stylesheet" href="css/style.css" type="text/css">
        
<!-- font awesome icon link      -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }
            .post-title{
                font-weight: 100;
                font-size: 30px;
            }
            .post-content{
                font-weight: 100;
                font-size: 18px;

            }
            .post-date{
                font-style: italic;
               
            }
            .post-user-info{
                font-size: 20px;

            }


            .row-user{
                border:1px solid #e2e2e2;
                padding-top: 15px;
            }

            body{
                background:url(image/bg.jfif);
                background-size: cover;
                background-attachment: fixed;
            }

            
            
        </style>
        
    </head>
    <body>
        
             <!--        navbar start-->

                           <nav class="navbar navbar-expand-lg navbar-light primary-background fixed-top font-weight-bold">
                    <a class="navbar-brand" href=""> <span class="fa fa-asterisk"></span> ByteBlog</a>
                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>

                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                      <li class="nav-item active">
                        <a class="nav-link" href="profile.jsp"><span class="fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="contact_form.jsp"> <span class="fa fa-address-card-o"></span> Contact </a>
                      </li>
                       

                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="fa fa-check-square-o"></span>  Top Contributor
                        </a>
                        <div class="dropdown-menu primary-background font-weight-bold" aria-labelledby="navbarDropdown">
                                                     
                                            <a class="dropdown-item" href="#">Anuj Pal</a>
                                            <a class="dropdown-item" href="#">Jayant Kumar</a>
                                            <a class="dropdown-item" href="#">Ankit Prasad</a>
                                         
                                   
                          
                          <div class="dropdown-divider"></div>
                        </div>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="fa fa-check-square-o"></span>  Categories
                        </a>
                        <div class="dropdown-menu primary-background font-weight-bold" aria-labelledby="navbarDropdown">
                         
                             <%
                                 try{
                                       postDao d1 = new postDao(connectionProvider.getConnection());
                                       
                                       ArrayList<Category> list2 = d1.getAllcategories();
                                       for(Category ccc: list2)
                                       {
                                     %>
                                            <a class="dropdown-item" href="#"><%= ccc.getName() %></a>
                                         
                                     <%
                                        }
                                       }catch(Exception e)
                                        {
                                        e.printStackTrace();
                                        }
                             %>
                           
                          
                          <div class="dropdown-divider"></div>
                        </div>
                      </li>
                       </li>
                        <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"> <span class="fa fa-book"></span> Create Post </a>
                      </li>

                    </ul>
                
                      <ul class="navbar-nav mr-right">
                           <li class="nav-item">
                                <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle"></span> <%= use.getName()%> </a>
                            </li>
                             <li class="nav-item">
                                <a class="nav-link" href="logoutServlet"> <span class="fa fa-sign-out"></span> Logout </a>
                            </li>
                      </ul>
                      
                  </div>
                </nav>
        
        <!--       Navbar end -->
        <br>
        <br>
        
<!--       start  main content of the body-->
        
                <div class="container">
                    
                    <div class="row my-4">
                        
                        <div class="col-md-6 offset-md-3">
                            
                            <div class="card">
                                
                                <div class="card-header">
                                    
                                    <h4 class="post-title" ><%= p.getpTitle() %></h4>
                                    <%   
                                        userdao ud = new userdao(connectionProvider.getConnection());
                                    %>
                                    Author: <a href="#"><%= ud.getUserByUserId(p.getUserId()).getName() %>  </a> || Date: <span class="post-date"> <%= DateFormat.getDateInstance().format(p.getpDate()) %>  </span>
                                   
                                    
                                </div>
                                    
                                    <div class="card-body">
                                        
                                        <p class="post-content" ><%= p.getpContent()%> </p>
                                        <br>
                                        <br> 
                                        <div class="post-code">
                                        <pre><%= p.getpCode() %> </pre>
                                        </div>
                                    </div>
                                  <div class="card-footer primary-background ">
                                        
                                      <%  
                                            LikeDao ld = new LikeDao(connectionProvider.getConnection());
                                      %>
                                      
                                      <a href="" onclick="doLike(<%= p.getPid() %>,<%= use.getId() %>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up" ></i><span class="like-counter"><%=ld.countLikeOnPost(p.getPid()) %>  </span> </a>
                                      <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o" ></i><span>20</span> </a>
                                      
                                    
                                  </div>
                                     
                                    
                                      
                            </div>
                        </div>
                    </div>

                </div>

<!--       end  main content of the body-->

        
            <!--start of profile modal-->
                    <!-- Button trigger modal -->
                   

                    <!-- Modal -->
                    <div class="modal fade " id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content text-center"  style="max-width: 450px; ">
                          <div class="modal-header primary-background text-white text-center">
                              <h5 class="modal-title" id="exampleModalLabel"> ByteBlog </h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times</span>
                            </button>
                          </div>
                          <div class="modal-body">
                           
                              <div class="container text-center">
                                 <img src="pics/<%= use.getProfile() %>" alt="Profile-pic" class="img-fluid" style="border-radius: 50%; width: 130px; height: 100px; " />   
                                     <h5 class="modal-title mt-3" id="exampleModalLabel"><%= use.getName() %> </h5>
                                     
                                     <!--details-->
                                     <div id="profile-details">
                                     <table class="table">
                                        
                                          <tbody>
                                            <tr>
                                              <th scope="row"> ID: </th>
                                              <td><%= use.getId() %></td>
                                             
                                            </tr>
                                            <tr>
                                              <th scope="row">Email: </th>
                                              <td><%= use.getEmail() %></td>
                                             
                                            </tr>
                                            <tr>
                                              <th scope="row">Contact: </th>
                                              <td><%= use.getContact() %></td>
                                             
                                            </tr>
                                             <tr>
                                              <th scope="row">Gender: </th>
                                              <td><%= use.getGender() %></td>
                                             
                                            </tr>
                                             <tr>
                                              <th scope="row">Registered on: </th>
                                              <td><%= use.getjoiningTime().toString() %></td>
                                             
                                            </tr>
                                          </tbody>
                                        </table>
                                     </div>
                              
<!--                         profile-edit-->

                                <div id="profile-edit" style="display:none;">
                                    <h3 class="mt-1"> Please Edit Carefully</h3>
                                    
                                    <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                        <table class="table">
                                           
                                            <tr> 
                                                <td>Email: </td>
                                                <td> <input type="email" class="form-control" name="user_email" value="<%= use.getEmail() %> " </td>
                                            </tr> 
                                             
                                            <tr> 
                                                <td>Contact: </td>
                                                <td> <input type="text" class="form-control" name="user_contact" value="<%= use.getContact()%> " </td>
                                            </tr> 
                                            <tr>  
                                                <td>Password: </td>
                                                <td> <input type="password" class="form-control" name="user_password" value="<%= use.getPassword()%>" </td>
                                            </tr> 
                                            <tr>  
                                                <td>Gender: </td>
                                                <td> <input type="text" class="form-control" name="user_gender" value="<%= use.getGender()%> " </td>
                                            </tr> 
                                            <tr> 
                                                <td>Select profile: </td>
                                                <td> <input type="file" class="form-control" name="image" </td>
                                            </tr>
                                        </table> 
                                            
                                            <div class="container">
                                                <button type="submit" class="btn btn-outline-primary">Update</button>
                                            </div>
                                            
                                    </form>

                                </div>
                            

                                     
                                     
                              
                           
                                </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button id ="edit-profile-button" type="button" class="btn btn-primary">EDIT</button>
                          </div>
                        </div>
                      </div>
                    </div>
        
        <!--end of profile modal-->
        

        
      <!--add post modal-->



        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="background: #0A67DC;">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the post details..</h5>   <!-- edit blue -->
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form id="add-post-form" action="AddPostServlet" method="post">
                            
                            
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>--Select  Category--</option>
                                    <%
                                    try {
                                        postDao postd = new postDao(connectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllcategories();
                                        for(Category c: list) {
                                %>
                                            <option value="<%= c.getCid()%>"><%= c.getName() %></option>
                                <%
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>

                                    
                                </select>
                            </div>
                                

                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post Title" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <textarea name="pContent" class="form-control" style="height: 100px;" placeholder="Enter your content"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" class="form-control" style="height: 100px;" placeholder="Enter your program (if any)"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select your pic..</label>
                                <br>
                                <input type="file" name="pic"  >
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post </button>
                            </div>

                        </form>


                    </div>

                </div>
            </div>
        </div>
                                
                                
<!--  end post modal-->
        
            
            
            
            
            
            
        <!--      JavaScript link  -->

       <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
       <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"> </script>
       <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
       <script src="js/myjs.js" type="text/javascript"></script>
        
       <script>
           $(document).ready(function(){
               
               let editStatus=false;
               
               
               $('#edit-profile-button').click(function()
               {
//                   alert("button clicked");
                        
                        if (editStatus === false)
                        {
                                 $("#profile-details").hide();
                    
                                 $("#profile-edit").show();
                                     editStatus =true;
                                     $(this).text("Back");
                        }
                        else
                        {
                                $("#profile-details").show();
                    
                                $("#profile-edit").hide();
                                editStatus=false;
                        }
                
               })
               
           });
           
       </script>
       
       
        <!-- JavaScript link   -->    
        
                                        <!--        now add post js-->
        <script>
                    $(document).ready(function (e){
                        
                        $("#add-post-form").on("submit",function(event){
                            // this code gets called when form is submitted...
                            event.preventDefault();
                            console.log("you have clicked on the post");
                            
                            let form = new FormData(this);
                            
                             // now requesting to server
                             $.ajax({
                                 url:"AddPostServlet",
                                 type: 'POST',
                                 data: form,
                                 success: function (data, textStatus, jqXHR){
                                   //success 
                                   console.log(data);
                                   if(data.trim() =='done')
                                   {
                                       swal("Good job!", "Successfully Done!", "success");
                                   }else
                                   {
                                       swal("Error", "Something went wrong! Try again", "error");
                                   }
                                 },
                                 error: function (jqXHR, textStatus, errorThrown){
                                     swal("Error", "Something went wrong! Try again", "error");
                                 },
                                 processData: false,
                                 contentType: false
                             });
                        });
                    });
        </script>
        
        
        
       
    </body>
</html>
