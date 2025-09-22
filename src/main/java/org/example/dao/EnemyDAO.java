package org.example.dao;

import org.example.Database;
import org.example.model.Enemy;

import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EnemyDAO {

    public static Enemy getEnemy(int enemyLevel)throws SQLException {
        try(Connection conn = Database.connection()){
            Enemy enemy = null;
            String sql = "SELECT * FROM enemy WHERE enemyLevel=? LIMIT 1";
            try(PreparedStatement ps= conn.prepareStatement(sql)){
                ps.setInt(1, enemyLevel);
                try(ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        enemy = new Enemy();
                        enemy.enemyId = rs.getInt("enemyid");
                        enemy.enemyName = rs.getString("enemyname");
                        enemy.enemyHp = rs.getInt("enemyhp");
                        enemy.enemyAttack = rs.getInt("enemyattack");
                        enemy.enemyLevel = rs.getInt("enemylevel");

                        /*System.out.println("Napotkano przeciwnika:");
                        System.out.println("Nazwa: "+enemy.getEnemyName());
                        System.out.println("Poziom: "+enemy.getEnemyLevel());
                        System.out.println("Liczba HP: "+enemy.getEnemyHp());
                        System.out.println("Atak: "+enemy.getEnemyAttack());*/
                }else{
                        return null;
                    }

                }return enemy;
            }
        }
    }
}
