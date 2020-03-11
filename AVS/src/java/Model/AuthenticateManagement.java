/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.User;

/**
 *
 * @author BinhNT
 */
public class AuthenticateManagement {
    public enum CheckUsernameResult
    {
        SUCCESS,
        NO_USERNAME,
        SHORT,
        WRONG_PASSWORD
    }
    
    public CheckUsernameResult checkUserAccount(String username, String password)
    {
        try
        {
            UserModel userDao = new UserModel();
            User user = userDao.getUserByUsername(username);
            if(user == null)
            {
                return CheckUsernameResult.NO_USERNAME;
            }
            else if (password.length()<6) {
                return CheckUsernameResult.SHORT;
            }
            else if (!user.getPassword().equals(password))
            {
                return CheckUsernameResult.WRONG_PASSWORD;
            }
            return CheckUsernameResult.SUCCESS;
        }catch(Exception ex)
        {
            return CheckUsernameResult.NO_USERNAME;
        }
        
    }
}
