package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class OracleDBTest {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		String url = "jdbc:oracle:thin:@//localhost:1521/orcl";
		String sql = "select * from EMP";

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(url, "scott", "tiger");

		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);

		String str = "EMPNO|ENAME |  JOB  |  MGR  |    HIREDATE    | SAL | COMM | DEPTNO\n";
		while (rs.next()) {
			str += rs.getString("empno") + " ," + rs.getString("ename")
			    + ", " + rs.getString("job") + ", " + rs.getString("mgr")
			    + ", " + rs.getString("hiredate") + ", " + rs.getString("sal")
			    + ", " + rs.getString("comm") + ", " + rs.getString("deptno");
			str += "\n";
		}
		System.out.println(str);

		rs.close();
		st.close();
		con.close();
	}

}
