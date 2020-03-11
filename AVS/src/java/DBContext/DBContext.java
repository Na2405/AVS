/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 *
 * @author duongphse05617
 */
public class DBContext {

    InitialContext initContext;
    Context envCon;
    String serverName;
    String port;
    String username;
    String password;
    String dbName;
    String imgFolder;
    
    public DBContext() throws Exception {

          initContext = new InitialContext();
          envCon = (Context) initContext.lookup("java:comp/env");
          serverName = (String) envCon.lookup("serverName");
          port = (String) envCon.lookup("port");
          username = (String) envCon.lookup("user");
          password = (String) envCon.lookup("password");
          dbName = (String) envCon.lookup("dbName");
          imgFolder = (String) envCon.lookup("imgFolder");
    }
    
    public Connection getConnection() throws Exception {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection("jdbc:sqlserver://"+serverName+":"+port+";databaseName=" +dbName,username,password);
    }
    
    public String getResource() throws Exception {
        return imgFolder;
    }
}
