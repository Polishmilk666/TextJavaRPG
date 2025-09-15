package org.example;

import org.example.dao.InventoryDAO;
import org.example.model.Inventory;
import org.example.model.Item;
import org.example.model.Player;


import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import static org.example.dao.playerDAO.loadPlayer;

public class GameLogic {
    private final Scanner scanner = new Scanner(System.in);
    private Player player;

    public GameLogic(Player player){
        this.player=player;
    }

    public void StartGame() throws SQLException {
        boolean running = true;
        while (running){
            for(int i =1; i<30; i++) {
                System.out.print("+");
            }
            System.out.println();
            System.out.println();
            System.out.println("1. Wyświetl ekwipunek");
            System.out.println("2. Wyświetl inwentarz");
            System.out.println("3. Załuż przedmiot");
            System.out.println("4. Zdejmij przedmiot");
            /*System.out.println("5. Wyprawa");
            System.out.println("9. Zapisz");*/
            System.out.println("0. Koniec");

            String choise = scanner.nextLine().trim();
            switch (choise) {
                case "1" -> loadEquipment(player);
                case "2" -> loadInventory(player);
                case "3" -> equipItem(player);
                case "4" -> unEquipItem(player);
                /*case "5" -> saveGame();*/
                case "0" -> running = false;
                default -> System.out.println("Opcja nieznana");
            }
        }
    }

    private void loadEquipment(Player player) {
        try {
            System.out.println("Wyposażenie gracza " + player.getPlayerName());
            Map<String, Inventory> equipped = InventoryDAO.getEquippedForPlayer(player.getPlayerId());
            String[] slots = {"helmet", "armor", "pants", "boots", "gloves", "weapon", "shield"};

            for (String slot : slots) {
                Inventory inv = equipped.get(slot);
                if (inv != null && inv.item != null) {
                    System.out.println(slot + ": " + inv.item.getItemName() + " Atak: " + inv.item.getItemAttack() +
                            " Obrona: " + inv.item.getItemDefence());
                } else {
                    System.out.println(slot + ": -");
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    private void loadInventory(Player player){
                try{
                    Map<String, List<Inventory>> inventory = InventoryDAO.getInventoryForPlayer(player.getPlayerId());

                    System.out.println("Załadowano inwentarz dla gracza " + player.getPlayerName());
                    for (Map.Entry<String, List<Inventory>> entry : inventory.entrySet()) {
                        String slot = entry.getKey();
                        List<Inventory> items = entry.getValue();

                        System.out.println("Slot: " + slot);
                        for (Inventory inv : items) {
                            Item it = inv.item;
                            String equipped = inv.isEquipped() ? "[E]" : "";
                            System.out.println("  - " + (it == null ? "-" : it.toString()) + " " + equipped);
                        }
                    }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }
    private void equipItem(Player player){
        System.out.println("Podaj ID przedmiotu do założenia: ");
        int inventoryId = Integer.parseInt(scanner.nextLine().trim());
        try {
            InventoryDAO.equipItem(inventoryId, player.getPlayerId());
            System.out.println("Przedmiot założony");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    private void unEquipItem(Player player){
        System.out.println("Podaj ID przedmiotu do zdjęcia");
        int invenotryId = Integer.parseInt(scanner.nextLine().trim());
        InventoryDAO.unEquipItem(invenotryId, player.getPlayerId());
        System.out.println("Przedmiot zdjęty");
    }
}
