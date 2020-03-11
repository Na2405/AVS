/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DBContext.DBContext;
import Entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author BinhNT
 */
public class UserModel {
    private final DBContext db;

    public UserModel() throws Exception {
        db = new DBContext();
    }
     public User getUserByUsername(String username) throws Exception {
       String query = "select * from Users where user_Name=?";
        Connection conn = null;
        PreparedStatement ps = null; //de nhan paramenter
        ResultSet rs = null;
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("user_ID"));
                user.setUsername(rs.getString("user_Name"));
                user.setPassword(rs.getString("user_Password"));
                user.setRolenum(rs.getInt("user_RoleNum"));
                user.setAge(rs.getInt("user_Age"));
                user.setJob(rs.getInt("job_ID"));
                user.setWorkplace(rs.getString("user_Workplaces"));
                user.setGender(rs.getInt("user_Gender"));
                user.setMail(rs.getString("user_Mail"));
                user.setPhone(rs.getString("user_Phone"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}
