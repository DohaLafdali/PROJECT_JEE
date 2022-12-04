package Controller;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.SQLException;

public class SingleConnexion {
    String db = "aatae";
    String user = "root";
    String pwd = "";
    String url = "jdbc:mysql://localhost:3306/" + db;
    private static Connection connection = null;
    
	
    public SingleConnexion(){

    String driver ="com.mysql.jdbc.Driver";
  
     
    try{
      	  try {
				Class.forName(driver);

			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            connection = DriverManager.getConnection(url, user, pwd);
            System.out.println("instance cree!!");
        } catch (SQLException e) {
        	System.out.println(e.getMessage());
            e.printStackTrace();
        }

    }

    public static Connection getConnection()  {

        if (connection == null)
            new SingleConnexion();
        return connection;
    }
    
}
