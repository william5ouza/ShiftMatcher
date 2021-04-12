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
import user.model.User;

public class UserDatabase {

//    private static final long serialVersionUID = 1L;
    private static final String SQL_INSERT = "insert into user(userName,userPass,userEmail,userType)values(?,?,?,?)";
    private static final String SELECT_USER_BY_EMAIL_PASS = "select * from user where userEmail = (?) and userPass = (?)";
    private static final String UPDATE_USER_PASS_BY_ID =  "update user set userPass = (?) where userID = (?)";

    private Connection connection = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;

    public UserDatabase(Connection connection) {
        this.connection = connection;
    }

    //for register user 
    public boolean saveUser(User user) {
        boolean set = false;
        try {
            //Insert register data to database
            preparedStatement = this.connection.prepareStatement(SQL_INSERT);
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getUserPass());
            preparedStatement.setString(3, user.getUserEmail());
            preparedStatement.setString(4, user.getUserType());
            preparedStatement.executeUpdate();
            set = true;
        } catch (SQLException e) {
        }
        return set;
    }

    // user login    
    public User logUser(String userEmail, String userPass) {
        User user = null;
        try {
           
            // Get Username and Password from database
            preparedStatement = this.connection.prepareStatement(SELECT_USER_BY_EMAIL_PASS);

            //Set Parameter
            preparedStatement.setString(1, userEmail);
            preparedStatement.setString(2, userPass);
            
            // Execute the query
            resultSet = preparedStatement.executeQuery();

            // Fetch row
            if (resultSet.next()) {
                user = new User();
                user.setUserID(resultSet.getInt("userID"));
                user.setUserName(resultSet.getString("userName"));
                user.setUserPass(resultSet.getString("userPass"));
                user.setUserEmail(resultSet.getString("userEmail"));
                user.setUserType(resultSet.getString("userType"));               
            }

        } catch (SQLException e) {

        }
        return user;
    }
    
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try (
            PreparedStatement statement = this.connection.prepareStatement(UPDATE_USER_PASS_BY_ID);) {
            System.out.println("updated User:" + statement);        
            statement.setString(3, user.getUserPass());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

}
