package org.example;

import org.example.dao.EnemyDAO;
import org.example.dao.InventoryDAO;
import org.example.dao.playerDAO;
import org.example.model.Enemy;
import org.example.model.Inventory;
import org.example.model.Item;
import org.example.model.Player;



import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Scanner;



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
            System.out.println("5. Wyświetl statystyki");
            System.out.println("6. Wyprawa");
            System.out.println("0. Koniec");

            String choise = scanner.nextLine().trim();
            switch (choise) {
                case "1" -> loadEquipment(player);
                case "2" -> loadInventory(player);
                case "3" -> equipItem(player);
                case "4" -> unEquipItem(player);
                case "5" -> showPlayerStat();
                case "6" -> expedition();
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
                            String equipped = inv.isEquipped() ? "[W użyciu]" +
                                    "]" : "";
                            System.out.println("  - " + (it == null ? "-" : it.toString()) + " " + equipped);
                        }
                    }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }
    private void equipItem(Player player){
        try {
        loadInventory(player);
        System.out.println("Podaj ID przedmiotu do założenia: ");
        String input = scanner.nextLine().trim();

        if(!input.matches("\\d+")){
            System.out.println("Błąd!!! Nie podałeś wartości liczbowej");
            return;
        }
        int inventoryId = Integer.parseInt(input);
        InventoryDAO.equipItem(inventoryId, player.getPlayerId());
            System.out.println("Przedmiot założony");
        } catch (Exception e) {
            System.out.println("Błąd podczas zakładania przedmiotu " + e.getMessage());
        }
    }
    private void unEquipItem(Player player){
        try {
            loadInventory(player);
            System.out.println("Podaj ID przedmiotu do zdjęcia");
            String input = scanner.nextLine().trim();
            if(!input.matches("\\d+")){
                System.out.println("Błąd!!! Nie podałeś wartości liczbowej");
                return;
            }
            int inventoryId = Integer.parseInt(input);
            InventoryDAO.unEquipItem(inventoryId, player.getPlayerId());
            System.out.println("Przedmiot zdjęty");
        }catch (Exception e){
            System.out.println("Błąd podczas zdejmowania przedmiotu " + e.getMessage());
        }

    }
    private void showPlayerStat() throws SQLException{
        try{
            Player playerStat = playerDAO.loadPlayerStat(player.getPlayerId());
            Player level = playerDAO.loadPlayerXp(player.getPlayerId());
            if(playerStat !=null){
                int lvl;
                if(level.playerXp<=100){
                    lvl = 1;
                }else{
                    lvl = player.playerXp/100;
                }

                System.out.println("++++++STATYSTKI GRACZA "+ player.playerName + "++++++");
                System.out.println("Nazwa: " + player.playerName);
                System.out.println("Hp: " + player.playerHp);
                System.out.println("XP: " + player.playerXp);
                System.out.println("Level: " + lvl);
            }else {
                System.out.println("Nie można wczytać statystyk");
            }
        } catch (RuntimeException e) {
            throw new RuntimeException(e);
        }

    }
    private void expedition() throws SQLException {
        Player level = playerDAO.loadPlayerXp(player.getPlayerId());
        int enemyLevelToLoad = (level.playerXp)/100;
        int rand;
        if(enemyLevelToLoad<=10){
            rand = (int) (Math.random()*10);
        }else{
            rand = (int) (Math.random()*100);
        }


        Enemy enemy = EnemyDAO.getEnemy(enemyLevelToLoad);
        System.out.println(enemy.toString());
        System.out.println("Random: " + rand);

        System.out.println("Co chcesz zrobić?");
        System.out.println("1. Atak");
        System.out.println("2. Odwrót");
        int action = Integer.parseInt(scanner.nextLine().trim());

        if(action==1){
            int playerHp = player.getPlayerHp();
            int enemyHp = enemy.getEnemyHp();
            Player playerXp = playerDAO.loadPlayerXp(player.getPlayerId());
            while (playerHp>0 && enemyHp>0){
                int playerDamage = (10*3) + (int)(Math.random()*3);
                enemy.setEnemyHp(enemy.getEnemyHp() - playerDamage);
                System.out.println("Zadałeś: " + playerDamage + " obrażeń wrogowi zostało " + enemy.getEnemyHp());
                if(enemy.getEnemyHp()<=0){
                    System.out.println("Wróg został pokonany! Wygrałeś!");
                    player.setPlayerXp(player.getPlayerXp() + enemy.getEnemyLevel()*10);
                    System.out.println("Zdobyłeś " + enemy.getEnemyLevel()*10 + " expa");
                    break;
                }

                int enemyDamage = (10*3) + (int)(Math.random()*3);
                player.setPlayerHp(player.getPlayerHp() - enemyDamage);
                System.out.println("Wróg zadał: " + enemyDamage + " wróg zdała ci: " + player.getPlayerHp());
                if(player.getPlayerHp()<=0){
                    System.out.println("Zostałeś pokonany musiałeś uciekać!");
                    break;
                }

            }
        }
        else{
            System.out.println("Uciełeś");;
        }
    }

}
