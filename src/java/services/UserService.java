package services;

import dataaccess.DBUtil;
import dataaccess.RoleDB;
import models.*;
import dataaccess.UserDB;
import java.util.List;
import javax.persistence.EntityManager;
import static org.eclipse.persistence.platform.database.oracle.plsql.OraclePLSQLTypes.Int;


public class UserService {
    public List<User> getAll() throws Exception {
        UserDB userDB = new UserDB();
        List<User> users = userDB.getAll();
        return users;
    }
    
    public User get(String email) throws Exception {
        UserDB userDB = new UserDB();
        User user = userDB.get(email);
        return user;
    }
    
    public void insert(String email, boolean activity, String first_name, String last_name, String password, int roleID) throws Exception{
      
        RoleDB roleDB = new RoleDB();
        Role role = roleDB.get(roleID);
        User user = new User(email, activity, first_name, last_name, password);
        user.setRole(role);
        role.getUserList().add(user);
        UserDB userDB = new UserDB();
        userDB.insert(user);
    }
    
    public void update(String email, boolean activity, String first_name, String last_name, String password, int roleID) throws Exception{
        RoleDB roleDB = new RoleDB();
        Role role = roleDB.get(roleID);
        UserDB userDB = new UserDB();
        User user = userDB.get(email);
        user.setFirstName(first_name);
        user.setLastName(last_name);
        user.setRole(role);
        userDB.update(user);
    }
    
    public void delete(String email) throws Exception{
        UserDB userDB = new UserDB();
        User user = userDB.get(email);
        userDB.delete(user);
    }
}






