/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user.dao;

/**
 *
 * @author WilliamCarvalho
 */
import java.sql.*;


public class ConnectionPro {
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/shiftmatcherdb?useTimezone=true&serverTimezone=UTC&useSSL=false";
    private static final String USER = "root";
    private static final String PASS = "root";
    private static Connection connection = null;
    
    public static Connection getConnection(){
        try{
            Class.forName(DRIVER);
            connection = DriverManager.getConnection(URL,USER,PASS);
            
        }catch(ClassNotFoundException | SQLException e){
        }
        return connection;
    }
}
