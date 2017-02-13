package paypal.dao.member;

import java.sql.Connection;
import java.sql.DriverManager;


public class ConnectionHelper {
	
	public static Connection getConnection(String dbname) {
		
		if (dbname.toLowerCase().equals("mysql")) {
			try {
				//1. 직접 연결 객체 생성
				Class.forName("com.mysql.jdbc.Driver");				
				Connection conn = 
					DriverManager.getConnection(
					"jdbc:mysql://210.16.214.202:3306/paypal", "paypal", "paypal88");
//					"jdbc:mysql://121.168.79.74:7272/PAYPAL?user=jjw&password=jjw");
				
				return conn;
			} catch (Exception ex) {
				return null;
			}
		} else if (dbname.toLowerCase().equals("mysql")) {
			try {
				//1.
				Class.forName("com.mysql.jdbc.Driver");
				
				Connection conn = 
					DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/demoweb", "devadmin", "mysql");
				
				return conn;
			} catch (Exception ex) {
				return null;
			}
		} else {
			return null;
		}
		
	}

}
