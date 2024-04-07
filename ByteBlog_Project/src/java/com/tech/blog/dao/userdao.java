
package com.tech.blog.dao;

import com.tech.blog.entities.user;
import java.sql.*;

public class userdao {
    
    private Connection con;

    public userdao(Connection con) {
        this.con = con;
    }
    
    //method to insert data to Database
    
    public boolean saveUser(user use)
    {
        
         boolean f =false;
        try{
            
           
            
            String query = "insert into user(name,email,contact,password, gender) values(?,?,?,?,?)";
            
            PreparedStatement ps = this.con.prepareStatement(query);
            
            ps.setString(1, use.getName());
            ps.setString(2, use.getEmail());
            ps.setString(3, use.getContact());
            ps.setString(4, use.getPassword());
            ps.setString(5, use.getGender());
         
            
            ps.executeUpdate();
            
             f= true;
            
            
        }
        catch(Exception e )
        {
            e.printStackTrace();
        }
        
        return f;
    }
    
    //get user by email and user password
    
    public user getUserByEmailAndPassword(String email, String password)
    {
        user use = null;
        
        try{
            String query = "select * from user where email=? and password=? ";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, email);
            ps.setString(2, password);
            
           ResultSet rs = ps.executeQuery();
           
           if(rs.next())
           {
               use = new user();
//               database se data nikala
               String name =rs.getString("name");
               
//               user object mai data daala

                use.setName(name);
                use.setId(rs.getInt("id"));
                use.setEmail(rs.getString("email"));
                use.setPassword(rs.getString("password"));
                use.setContact(rs.getString("contact"));
                use.setGender(rs.getString("gender"));
                use.setProfile(rs.getString("profile"));
                use.setjoiningTime(rs.getTimestamp("joiningTime"));
                
               
               
           }
           
           
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return use;
    }
    
    public boolean updateUser(user use)
    {
        boolean f = false;
        
        try{
            String query = "update user set email=?, contact =?, password=?, gender=?, profile=? where id=?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, use.getEmail());
             p.setString(2, use.getContact());
             p.setString(3, use.getPassword());
             p.setString(4, use.getGender());
             p.setString(5, use.getProfile());
              p.setInt(6, use.getId());
              
              p.executeUpdate();
            f = true;
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
           return f;

    }
    
   public user getUserByUserId(int userId)
   {
       user use =null;
      try{
           String q = "select * from user where id=?";
           PreparedStatement ps = this.con.prepareStatement(q);
           ps.setInt(1, userId);
           ResultSet rs = ps.executeQuery();
           
           if(rs.next()){
                use = new user();
//               database se data nikala
               String name =rs.getString("name");
               
//               user object mai data daala

                use.setName(name);
                use.setId(rs.getInt("id"));
                use.setEmail(rs.getString("email"));
                use.setPassword(rs.getString("password"));
                use.setContact(rs.getString("contact"));
                use.setGender(rs.getString("gender"));
                use.setProfile(rs.getString("profile"));
                use.setjoiningTime(rs.getTimestamp("joiningTime"));
           }
           
           
      }catch(Exception e)
      {
          e.printStackTrace();
      }
      
      return use;
   }
}
