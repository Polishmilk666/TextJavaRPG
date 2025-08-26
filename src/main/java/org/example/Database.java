package org.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {

    private static final String URL = "jdbc:postgresql://10.1.1.20:5432/rpgconsole";
    private static final String USER = "postgres";
    private static final String PASS = "postgres";

    public static Connection connection () throws SQLException {
        String url  = System.getenv().getOrDefault("URL", URL);
        String user = System.getenv().getOrDefault("USER", USER);
        String pass = System.getenv().getOrDefault("PASS", PASS);
        return DriverManager.getConnection(url, user, pass);
    }
}
