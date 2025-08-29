package org.example.dao;

import org.example.Database;
import org.example.model.Inventory;
import org.example.model.Item;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class InventoryDAO {

    public static Map<String, Item> getInventoryForPlayer(int playerId) throws SQLException{
        Map<String, Item> inventory = new HashMap<>();
        String query = "SELECT i.itemid, i.itemname, i.itemtype, i.itemattack, i.itemdefence " +
                 "FROM inventory inv "+
                "LEFT JOIN items i ON inv.itemid = i.itemid " +
                "WHERE inv.playerid=?";
        try(Connection conn= Database.connection()){
            try(PreparedStatement ps = conn.prepareStatement(query)){
                ps.setInt(1, playerId);
                try(ResultSet rs=ps.executeQuery()){
                    while(rs.next()){
                        String slot = rs.getString("itemtype");
                        Item item = null;
                        if(rs.getInt("itemid") !=0){
                            item = new Item(
                                    rs.getInt("itemid"),
                                    rs.getString("itemname"),
                                    rs.getString("itemtype"),
                                    rs.getInt("itemattack"),
                                    rs.getInt("itemdefence")
                            );
                        }
                        Inventory inv = new Inventory(
                                rs.getInt("inventoryid"),
                                playerId,
                                item,
                                rs.getBoolean("equiped"));
                    }
                }
            }
            return inventory;
        }
    }

}
