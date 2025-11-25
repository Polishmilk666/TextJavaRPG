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

        public static Map<String, Inventory> getEquippedForPlayer(int playerId) throws SQLException{
        Map<String, Inventory> equipped = new HashMap<>();
            String query = "SELECT inv.inventoryid, inv.slot, inv.equipped, " +
                    "i.itemid, i.itemname, i.itemtype, i.itemattack, i.itemdefence " +
                    "FROM inventory inv " +
                    "LEFT JOIN item i ON inv.itemid = i.itemid " +
                    "WHERE inv.playerid = ? AND inv.equipped = true";

            try(Connection conn = Database.connection()){
                try(PreparedStatement ps = conn.prepareStatement(query)){
                    ps.setInt(1, playerId);
                    try(ResultSet rs = ps.executeQuery()){
                        while(rs.next()) {
                            Item item = new Item(
                                        rs.getInt("itemid"),
                                        rs.getString("itemname"),
                                        rs.getString("itemtype"),
                                        rs.getInt("itemattack"),
                                        rs.getInt("itemdefence")
                                );


                            Inventory inv = new Inventory(
                                    rs.getInt("inventoryid"),
                                    playerId,
                                    item,
                                    rs.getBoolean("equipped")
                            );
                            String slot = rs.getString("slot");
                            equipped.put(slot, inv);
                        }
                    }
                }
            }

        return equipped;
        }

        public static void equipItem(int itemId, int playerId) throws SQLException{
        String queryUnEquip = "UPDATE inventory SET equipped=false WHERE playerid=? AND slot = (SELECT slot FROM inventory WHERE itemid=?)";
        String queryEquip = "UPDATE inventory SET equipped=true WHERE playerid = ? AND inventoryid = (SELECT inventoryid FROM inventory WHERE playerid =? AND itemid=?)";
            try(Connection conn = Database.connection()){
                try(PreparedStatement psUnEquip= conn.prepareStatement(queryUnEquip);
                    PreparedStatement psEquip=conn.prepareStatement(queryEquip)){

                    psUnEquip.setInt(1, playerId);
                    psUnEquip.setInt(2, itemId);
                    psUnEquip.executeUpdate();

                    psEquip.setInt(1, playerId);
                    psEquip.setInt(2, playerId);
                    psEquip.setInt(3, itemId);
                    psEquip.executeUpdate();
                }catch (SQLException e){
                    throw new RuntimeException(e);
                }
            }catch (SQLException e){
                throw new RuntimeException(e);
            }
        }
        public static void unEquipItem(int itemId, int playerId){
            String queryUnEquip = "UPDATE inventory SET equipped=false WHERE playerid=? and slot = (SELECT slot FROM inventory WHERE itemid=?)";
            try(Connection conn = Database.connection()){
                try(PreparedStatement psUnEquip= conn.prepareStatement(queryUnEquip)){

                    psUnEquip.setInt(1, playerId);
                    psUnEquip.setInt(2, itemId);
                    psUnEquip.executeUpdate();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

