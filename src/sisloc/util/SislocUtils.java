package sisloc.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class SislocUtils {
	
	private static Connection c;
	
	public static Connection getConnection(){
		try{
			if(c == null){
				Class.forName("org.postgresql.Driver");
				c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/sisloc","postgres","postgres");
			}
		}catch(Exception e){}
		return c;
	}

}
