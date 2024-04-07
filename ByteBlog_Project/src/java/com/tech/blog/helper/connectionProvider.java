
package com.tech.blog.helper;
import java.sql.*;

public class connectionProvider {
    
    private static Connection con;
    public static Connection getConnection()
    {
        try
        {
            if(con==null)
            {
                //driver load
              Class.forName("com.mysql.jdbc.Driver");
            
              //connection            
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","MRAK#7899@yk");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
        return con;
    }
        
}
