
package rateit.helper;

import java.sql.*;



public class ConnectionProvider {
    public static Connection con;
    
    public static Connection getConnection(){
    
       try{
           if(con == null){
       Class.forName("com.mysql.cj.jdbc.Driver");
       
       con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rateitdb", "root", "Pri163004");
           }
       
       }
       catch(Exception e){e.printStackTrace();}
    
       return con;
    }
    
}
