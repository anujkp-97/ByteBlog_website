

<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.user"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.postDao"%>
<%@page import="com.tech.blog.helper.connectionProvider"%>





<div class="row">

<%
    user use =(user)session.getAttribute("currentUser");
        Thread.sleep(500);
    
        postDao d = new postDao(connectionProvider.getConnection());
        
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = null;
        if(cid == 0){
             posts = d.getAllPosts(); 
        }else{
                posts = d.getPostByCatId(cid);
          }
        if(posts.size() ==0)
        {
        out.println("<h3 class='display-3 text-center'>oops ! No post in this category !</h3> ");
        return;
        
    }
       
        for(Post p: posts){
        
  %>
  <div class="col-md-6 mt-2" >
      <div class="card " style="height: 280px; overflow: hidden;" >
          <img class="card-img-top" src="blog_pics/<%=p.getpPic() %>" alt="Card image cap" style="width: 333px; height: 140px;">
          <div class="card-body" style="height: 100px; overflow: hidden;"  >
              <b><%= p.getpTitle() %> </b>
              <p class="card-text"><%= p.getpContent().substring(0,80) %> ... </p>
          </div>
          <div class="card-footer primary-background text-center">
              
              <%
                  LikeDao ld = new LikeDao(connectionProvider.getConnection());
                  %>
              
              
               <a href="" onclick="doLike(<%= p.getPid() %>,<%= use.getId() %>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up" ></i><span class="like-counter"> <%=ld.countLikeOnPost(p.getPid()) %>  </span> </a>
              <a href="show_blog_page.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-light btn-sm">Read more.. </a>
              <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o" ></i><span>20</span> </a>
          </div>
             
          
      </div>
  </div>
              
              

  
 <%
    }
        

%>
</div>