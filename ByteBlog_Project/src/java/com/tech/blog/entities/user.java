
package com.tech.blog.entities;
import java.sql.*;

public class user {
    
    private int id;
    private String name;
    private String email;
    private String contact;
    private String password;
    private String gender;
    private String profile;
    private Timestamp joiningTime;

    public user(int id, String name, String email, String contact, String password, String gender, Timestamp joiningTime) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.contact = contact;
        this.password = password;
        this.gender = gender;
        this.joiningTime= joiningTime;
        
    }

    

    public user() {
    }

    public user(String name, String email, String contact, String password, String gender) {
        this.name = name;
        this.email = email;
        this.contact = contact;
        this.password = password;
        this.gender = gender;
//        this.profile = profile;
    }
    
//    getters and setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public Timestamp getjoiningTime() {
        return joiningTime;
    }

    public void setjoiningTime(Timestamp joiningTime) {
        this.joiningTime = joiningTime;
    }
    

   

  
    
    
    
    
}
