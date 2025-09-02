package org.example.dao;

import org.example.Database;
import org.example.model.Inventory;
import org.example.model.Item;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class InventoryDAO {

    public static Map<String, List<Inventory>> getInventoryForPlayer(int playerId) throws SQLException {
        Map<String, List<Inventory>> inventory = new HashMap<>();
        String query = "SELECT inv.inventoryid, inv.slot, inv.equipped, " +
                "i.itemid, i.itemname, i.itemtype, i.itemattack, i.itemdefence " +
                "FROM inventory inv " +
                "LEFT JOIN item i ON inv.itemid = i.itemid " +
                "WHERE inv.playerid = ?";

        try (Connection conn = Database.connection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, playerId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Item item = null;
                    if (rs.getInt("itemid") != 0) {
                        item = new Item(
                                rs.getInt("itemid"),
                                rs.getString("itemname"),
                                rs.getString("itemtype"),
                                rs.getInt("itemattack"),
                                rs.getInt("itemdefence")
                        );
                    }
                    String slot = rs.getString("slot");
                    boolean equipped = rs.getBoolean("equipped");

                    Inventory inv = new Inventory(
                            rs.getInt("inventoryid"),
                            playerId,
                            item,
                            equipped
                    );

                    inventory.computeIfAbsent(slot, k -> new ArrayList<>()).add(inv);
                }
            }
        }
        return inventory;
        }

        public static Map<String, List<Inventory>> getEquippedForPlayer(int playerId) throws SQLException{
        Map<String, List<Inventory>> equipped = new HashMap<>();
            String query = "SELECT inv.inventoryid, inv.slot, inv.equipped, " +
                    "i.itemid, i.itemname, i.itemtype, i.itemattack, i.itemdefence " +
                    "FROM inventory inv " +
                    "LEFT JOIN item i ON inv.itemid = i.itemid " +
                    "WHERE inv.playerid = ? AND inv.equipped = true";

            try(Connection conn = Database.connection()){
                try(PreparedStatement ps = conn.prepareStatement(query)){
                    ps.setInt(1, playerId);
                    try(ResultSet rs = ps.executeQuery()){
                        while(rs.next()){
                            Item item = null;
                            if(rs.getInt("itmeid") !=0){
                                item = new Item(
                                        rs.getInt("itemid"),
                                        rs.getString("itemname"),
                                        rs.getString("itemtype"),
                                        rs.getInt("itemattack"),
                                        rs.getInt("itemdefence")
                                );
                            }
                            String slot = rs.getString("slot");
                            boolean equippedCol = rs.getBoolean("equipped");

                            Inventory equp = new Inventory(
                                    rs.getInt("inventoryid"),
                                    playerId,
                                    item,
                                    equippedCol
                            );
                            equipped.computeIfAbsent(slot, k -> new ArrayList<>()).add(equp);
                        }
                    }
                }
            }

        return equipped;
        }
    }

