/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author BinhNT
 */
public class User {
    private int id;
    private String username;
    private String password;
    private int rolenum;
    private int age;
    private int job;
    private String workplace;
    private int gender;
    private String mail;
    private String phone;

    public User() {
    }

    public User(int id, String username, String password, int rolenum, int age, int job, String workplace, int gender, String mail, String phone) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.rolenum = rolenum;
        this.age = age;
        this.job = job;
        this.workplace = workplace;
        this.gender = gender;
        this.mail = mail;
        this.phone = phone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRolenum() {
        return rolenum;
    }

    public void setRolenum(int rolenum) {
        this.rolenum = rolenum;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setJob(int job) {
        this.job = job;
    }

    

    public String getWorkplace() {
        return workplace;
    }

    public void setWorkplace(String workplace) {
        this.workplace = workplace;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    
}
