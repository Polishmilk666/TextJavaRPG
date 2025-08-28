package org.example.dao;

import org.example.Database;
import org.example.model.Item;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class itemDAO {

    public static Item getItemById(int itemId) throws SQLException {
        String query = "SELECT * FROM item WHERE itemid=?";
        try(Connection conn = Database.connection()){
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, itemId);
            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                return new Item(
                  rs.getInt("itemid"),
                  rs.getString("itemname"),
                  rs.getString("itemtype"),
                  rs.getInt("itemattack"),
                  rs.getInt("itemdefence")
                );
            }
        }
        return null;
    }

}
