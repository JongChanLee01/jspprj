package dao;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import util.*;

public class UserDAO {

    public boolean insert(String uid, String upass, String uname) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            String sql = "INSERT INTO user(id, password, name) VALUES(?, ?, ?)";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);
            stmt.setString(2, upass);
            stmt.setString(3, uname);
            
            int count = stmt.executeUpdate();
            return (count == 1) ? true : false;
            
        } finally {
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }
    
    public boolean insert2(String uid, String jsonstr) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            String sql = "INSERT INTO user2(id, jsonstr) VALUES(?, ?)";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);
            stmt.setString(2, jsonstr);
            
            int count = stmt.executeUpdate();
            return (count == 1) ? true : false;
            
        } finally {
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }
    
    // 아이디가 있는지 검사
    public boolean exists(String uid) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            //String sql = "SELECT id FROM user WHERE id = ?";
        	String sql = "SELECT id FROM user2 WHERE id = ?";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);
            
            rs = stmt.executeQuery();
            return rs.next();
            
        } finally {
            if (rs != null) rs.close(); 
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }

    /*
    public boolean delete(String uid) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            String sql = "DELETE FROM user WHERE id = ?";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);
            
            int count = stmt.executeUpdate();
            return (count == 1) ? true : false;
            
        } finally {
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }
    */
    public boolean delete(String uid) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            String sql = "DELETE FROM user2 WHERE id = ?";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);
            
            int count = stmt.executeUpdate();
            return (count == 1) ? true : false;
            
        } finally {
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }

    /*
    public int login(String uid, String upass) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT id, password FROM user WHERE id = ?";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);
            
            rs = stmt.executeQuery();
            if (!rs.next()) return 1;
            if (!upass.equals(rs.getString("password"))) return 2;

            return 0;
            
        } finally {
            if (rs != null) rs.close(); 
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }
    */
    public int login(String uid, String upass) throws NamingException, SQLException, ParseException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
        	String sql = "SELECT jsonstr FROM user2 WHERE id = ?";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);
            
            rs = stmt.executeQuery();
            if (!rs.next()) return 1;
            
            String jsonstr = rs.getString("jsonstr");
            JSONObject obj = (JSONObject) (new JSONParser()).parse(jsonstr);
            String pass = obj.get("password").toString();
            
            if (!upass.equals(pass)) return 2;

            return 0;
        } finally {
            if (rs != null) rs.close(); 
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }

    public ArrayList<UserObj> getList() throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT id, name, ts FROM user ORDER BY ts DESC";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            
            ArrayList<UserObj> users = new ArrayList();
            while(rs.next()) {
             users.add(new UserObj(rs.getString("id"), rs.getString("name"), rs.getString("ts")));
            }
            return users;
            
        } finally {
            if (rs != null) rs.close(); 
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }// getList
    
    /*
    public String getList2() throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT id, name, ts FROM user ORDER BY ts DESC";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            
            JSONArray users = new JSONArray();


            while(rs.next()) {
              JSONObject obj = new JSONObject();
              obj.put("id", rs.getString("id"));
              obj.put("name", rs.getString("name"));
              obj.put("ts", rs.getString("ts"));
              users.add(obj);
            }
            return users.toJSONString();
            
        } finally {
            if (rs != null) rs.close(); 
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }// getList2
    */
    
    public String getList2() throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
        	String sql = "SELECT jsonstr FROM user2";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            
            String str = "[";
            int cnt = 0;
            while(rs.next()) {
             if (cnt++ > 0) str += ", ";
             str += rs.getString("jsonstr");
            }
            return str + "]";
            
        } finally {
            if (rs != null) rs.close(); 
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }// getList2
}