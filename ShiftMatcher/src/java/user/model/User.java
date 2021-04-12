package user.model;

/**
 *
 * @author WilliamCarvalho
 */

public class User {

    private int userID;
    private String userName;
    private String userPass;
    private String userEmail;
    private String userType;
    
    public User() {
    }
    
    public User (String uName, String uPass, String uEmail, String uType) {
        this.userName = uName;
        this.userPass = uPass;
        this.userEmail = uEmail;
        this.userType = uType;        
    }
    
    public User (int uID, String uName, String uPass, String uEmail, String uType) {
        this.userID = uID;
        this.userName = uName;
        this.userPass = uPass;
        this.userEmail = uEmail;
        this.userType = uType;        
    }
    
    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
}
