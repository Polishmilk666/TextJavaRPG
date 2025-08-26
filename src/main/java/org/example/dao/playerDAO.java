package org.example.dao;

import org.example.Database;
import org.example.model.Player;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class playerDAO {

    public static Player loadPlayer(String playerName) throws SQLException{
        try(Connection conn = Database.connection()){
            Player player = null;
            try(PreparedStatement ps = conn.prepareStatement("SELECT * from player WHERE playername=?")){
                ps.setString(1, playerName);
                try(ResultSet rs = ps.executeQuery()){
                    if(rs.next()){
                        player = new Player();
                        player.playerId=rs.getInt("playerid");
                        player.playerName=rs.getString("playername");
                        player.playerLevel=rs.getInt("playerlevel");
                        player.playerXp=rs.getInt("playerxp");
                    }else {
                        return null;
                    }
                }
                return player;
            }

        }
    }

    public static Player createPlayer(String playerName) throws SQLException {
       Player p = loadPlayer(playerName);
       if( p!=null) return p;
       try(Connection conn = Database.connection()){
           try(PreparedStatement ps= conn.prepareStatement(" INSERT INTO player (playername)" +
                   "VALUES (?) RETURNING playerid")){
               ps.setString(1, playerName);
               try(ResultSet rs = ps.executeQuery()){
                   rs.next();
                   int playerId = rs.getInt(1);
                   Player player = new Player(playerName);
                   player.playerId=playerId;
                   return player;
               }
           }
       }
    }
}
