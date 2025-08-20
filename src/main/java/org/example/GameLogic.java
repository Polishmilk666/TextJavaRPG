package org.example;

import org.example.model.Item;
import org.example.model.Player;

import javax.xml.crypto.Data;
import java.sql.Connection;
import java.sql.SQLException;
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
            System.out.println("Gra wystartowała");
            System.out.println("1. Wyświetl ekwipunek");
            System.out.println("2. Wyświetl inwentarz");
            /*System.out.println("3. Załuż przedmiot");
            System.out.println("4. Zdejmij przedmiot");
            System.out.println("5. Wyprawa");
            System.out.println("9. Zapisz");*/
            System.out.println("0. Koniec");

            String choise = scanner.nextLine().trim();
            switch (choise) {
                case "1" -> loadEquipment();
                case "2" -> loadInventory();
                /*case "3" -> equipItem();
                case "4" -> unequipItem();
                case "5" -> saveGame();*/
                case "0" -> running = false;
                default -> System.out.println("Opcja nieznana");
            }
        }
    }

    private void loadEquipment() {
        System.out.println("Wyposażenie");
        String[] slots = {"helmet", "armor", "pants", "boots", "gloves", "weapon", "shield"};
        for (String s : slots){
            Item it = player.equipment.get(s);
            System.out.println(s + ": " + (it == null ? "-" : it.toString()));
        }
    }
    private void loadInventory(){
        System.out.println("Inwentory loaded");

    }
}
