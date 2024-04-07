<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.postDao"%>
<%@page import="com.tech.blog.helper.connectionProvider"%>
<html>
    <head>
        <title>
            NavbarPage
        </title>
        <style>
            .drop{
                background-color: white; 
                color: blue;
            }
           drop:hover {
                    background-color: blue;
                    color: white;
                    background: blue;
            }   
        </style>
        
    </head>
</html>
<nav class="navbar navbar-expand-lg navbar-light primary-background fixed-top font-weight-bold">
    <a class="navbar-brand" href="index.jsp"> <span class="fa fa-asterisk"></span>    ByteBlog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp"><span class="fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="contact_form.jsp"> <span class="fa fa-address-card-o"></span> Contact </a>
      </li>
      
      
          <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="fa fa-check-square-o"></span>  Top Contributor
                        </a>
                        <div class="dropdown-menu bg-white font-weight-bold" aria-labelledby="navbarDropdown">
                                                     
                                            <a class="dropdown-item drop" href="#">Anuj Pal</a>
                                            <a class="dropdown-item drop" href="#">Jayant Kumar</a>
                                            <a class="dropdown-item drop" href="#">Ankit Prasad</a>
                                         
                                   
                          
                          <div class="dropdown-divider"></div>
                        </div>
             <li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <span class="fa fa-check-square-o"></span>  Categories
        </a>
        <div class="dropdown-menu bg-white font-weight-bold" aria-labelledby="navbarDropdown">
                         
                             <%
                                 try{
                                       postDao d1 = new postDao(connectionProvider.getConnection());
                                       
                                       ArrayList<Category> list2 = d1.getAllcategories();
                                       for(Category ccc: list2)
                                       {
                                     %>
                                            <a class="dropdown-item drop" href="login_page.jsp"><%= ccc.getName() %> </a>
                                         
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