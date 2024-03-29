package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO2 {
	private static User getUserFrom(ResultSet resultSet) throws SQLException {
		User user = new User();
        user.setId(resultSet.getInt("id"));
        user.setUserid(resultSet.getString("userid"));
        user.setName(resultSet.getString("name"));
        user.setEmail(resultSet.getString("email"));
        user.setDepartmentId(resultSet.getInt("departmentId"));
        user.setDepartmentName(resultSet.getString("departmentName"));
        user.setUserType(resultSet.getString("userType"));
        return user;
    }
	
	public static List<User> findAll() throws Exception {
        String sql = "SELECT s.*, d.departmentName " +
                "FROM user s LEFT JOIN department d ON s.departmentId = d.id";
        try (Connection connection = DB.getConnection("student1");
         PreparedStatement statement = connection.prepareStatement(sql);
         ResultSet resultSet = statement.executeQuery()) {
        	ArrayList<User> list = new ArrayList<User>();
        
            while (resultSet.next()) {
            	// getUserFrom 없을때
				/*
				 * User user = new User();
				 * user.setId(resultSet.getInt("id"));
				 * user.setUserid(resultSet.getString("userid"));
				 * user.setName(resultSet.getString("name"));
				 * user.setEmail(resultSet.getString("email"));
				 * user.setDepartmentId(resultSet.getInt("departmentId"));
				 * user.setDepartmentName(resultSet.getString("departmentName"));
				 * user.setUserType(resultSet.getString("userType"));
				 * list.add(user);
				 */
            	
            	// getUserFrom 생겼을때
            	// 1
            	// User user = getUserFrom(resultSet);
            	// list.add(user);
            	
            	// 2 좀 더 개선
            	list.add(getUserFrom(resultSet));
            }
            return list;
    	}
    }
	
	public static List<User> findByName(String name) throws Exception {
		String sql = "SELECT s.*, d.departmentName " +
                "FROM user s LEFT JOIN department d ON s.departmentId = d.id " +
                "WHERE s.name LIKE ?";
	    try (Connection connection = DB.getConnection("student1");
	    PreparedStatement statement = connection.prepareStatement(sql)) {
	        statement.setString(1, name + "%");
	        try (ResultSet resultSet = statement.executeQuery()) {
	            ArrayList<User> list = new ArrayList<User>();
	            while (resultSet.next()) {
					/*
					 * User user = new User();
					 * user.setId(resultSet.getInt("id"));
					 * user.setUserid(resultSet.getString("userid"));
					 * user.setName(resultSet.getString("name"));
					 * user.setEmail(resultSet.getString("email"));
					 * user.setDepartmentId(resultSet.getInt("departmentId"));
					 * user.setDepartmentName(resultSet.getString("departmentName"));
					 * user.setUserType(resultSet.getString("userType"));
					 * list.add(user);
					 */
	            	
	            	// 1
	            	// User user = getUserFrom(resultSet);
	            	// list.add(user);
	            	
	            	//2 
	            	list.add(getUserFrom(resultSet));
	            }
	        return list;
	       }
	    }
    }
	
	public static User findById(int id) throws Exception {
        String sql = "SELECT s.*, d.departmentName " +
                     "FROM user s LEFT JOIN department d ON s.departmentId = d.id " +
                     "WHERE s.id = ?";

        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)) {
             statement.setInt(1, id);
             try (ResultSet resultSet = statement.executeQuery()) {
                 if (resultSet.next()) {
                	 /*
                     User user = new User();
                     user.setId(resultSet.getInt("id"));
 	                 user.setUserid(resultSet.getString("userid"));
 	                 user.setName(resultSet.getString("name"));
 	                 user.setEmail(resultSet.getString("email"));
 	                 user.setDepartmentId(resultSet.getInt("departmentId"));
 	                 user.setDepartmentName(resultSet.getString("departmentName"));
 	                 user.setUserType(resultSet.getString("userType"));
                     return user;
                     */
                	 
                	 // 1
                	 // User user = getUserFrom(resultSet);
                 	 // return user;
                	 
                	 return getUserFrom(resultSet);
                 } else
                	 return null;
             }
         }
    }
	
	public static User findByUserId(String userid) throws Exception {
        String sql = "SELECT s.*, d.departmentName " +
                     "FROM user s LEFT JOIN department d ON s.departmentId = d.id " +
                     "WHERE s.id = ?";

        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)) {
             statement.setString(1, userid);
             try (ResultSet resultSet = statement.executeQuery()) {
                 if (resultSet.next()) {
                	 /*
                     User user = new User();
                     user.setId(resultSet.getInt("id"));
 	                 user.setUserid(resultSet.getString("userid"));
 	                 user.setName(resultSet.getString("name"));
 	                 user.setEmail(resultSet.getString("email"));
 	                 user.setDepartmentId(resultSet.getInt("departmentId"));
 	                 user.setDepartmentName(resultSet.getString("departmentName"));
 	                 user.setUserType(resultSet.getString("userType"));
                     return user;
                     */
                	 
                	 // 1
                	 // User user = getUserFrom(resultSet);
                 	 // return user;
                	 
                	 return getUserFrom(resultSet);
                 } else
                	 return null;
             }
         }
    }
	
	public static void insert(User user) throws Exception {
        String sql = "INSERT user (id, userid, name, email, departmentName, userType)" +
                     " VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection connection = DB.getConnection("student1");
            PreparedStatement statement = connection.prepareStatement(sql)) {
        	statement.setInt(1,user.getId());
            statement.setString(2, user.getUserid());
            statement.setString(3, user.getName());
            statement.setString(4, user.getEmail());
            statement.setString(5, user.getDepartmentName());
            statement.setString(6, user.getUserType());
            statement.executeUpdate();
        }
    }
	
	
	public static void update(User user) throws Exception {
        String sql = "UPDATE user SET id=?, userid=?, name=?, email=?, departmentName=?, userType=? " +
                     " WHERE id = ?";
        try (Connection connection = DB.getConnection("student1");
            PreparedStatement statement = connection.prepareStatement(sql)) {
        	statement.setInt(1,user.getId());
            statement.setString(2, user.getUserid());
            statement.setString(3, user.getName());
            statement.setString(4, user.getEmail());
            statement.setString(5, user.getDepartmentName());
            statement.setString(6, user.getUserType());
            statement.executeUpdate();
        }
    }

 

    public static void delete(int id) throws Exception {
        String sql = "DELETE FROM user WHERE id = ?";
        try (Connection connection = DB.getConnection("student1");
            PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
   }
}
