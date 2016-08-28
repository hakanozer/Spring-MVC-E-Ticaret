
package com.admin.panel.yonetim;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;


public class DB {
    
    
    Connection con;
    Statement st;
    
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost/";
    String dbName = "springmvcadmin?useUnicode=true&characterEncoding=UTF-8";
    String dbUser = "root";
    String dbPass = "";

    public DB() {
    }
    
    public DB(String dbName) {
        this.dbName = dbName;
    }
    
    public Statement baglan(){
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url+dbName, dbUser, dbPass);
            st = con.createStatement();
        } catch (Exception e) {
            System.out.println("Baðlantý Hatasý : " + e);
        }
        return st;
    }
    
    
    // md5 method
    public String MD5(String md5) {
    	   try {
    	        java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
    	        byte[] array = md.digest(md5.getBytes());
    	        StringBuffer sb = new StringBuffer();
    	        for (int i = 0; i < array.length; ++i) {
    	          sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1,3));
    	       }
			return sb.toString();
    	    } catch (java.security.NoSuchAlgorithmException e) {
    	    }
    	    return null;
    	}
    
    
    
    
}
