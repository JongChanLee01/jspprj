package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
	public static List<User> findAll() throws Exception {
        String sql = "SELECT s.*, d.departmentName " +
                "FROM user s LEFT JOIN department d ON s.departmentId = d.id";
        try (Connection connection = DB.getConnection("student1");
         PreparedStatement statement = connection.prepareStatement(sql);
         ResultSet resultSet = statement.executeQuery()) {
        	ArrayList<User> list = new ArrayList<User>();
        
            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setUserid(resultSet.getString("userid"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setDepartmentId(resultSet.getInt("departmentId"));
                user.setDepartmentName(resultSet.getString("departmentName"));
                user.setUserType(resultSet.getString("userType"));
                list.add(user);
            }
            return list;
    	}
    }
}
