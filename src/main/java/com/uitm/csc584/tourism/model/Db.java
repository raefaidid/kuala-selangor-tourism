package com.uitm.csc584.tourism.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class Db {

    private static final String URL      = System.getenv().getOrDefault("DB_URL",      "jdbc:postgresql://localhost:5432/csc584_tourism");
    private static final String USER     = System.getenv().getOrDefault("DB_USER",     "raefdd");
    private static final String PASSWORD = System.getenv().getOrDefault("DB_PASSWORD", "");

    private Db() {}

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
