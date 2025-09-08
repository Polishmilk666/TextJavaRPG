package org.example;

import org.example.dao.playerDAO;
import org.example.model.Player;


import java.util.Scanner;

public class Gierka{
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("1. Nowa gra");
        System.out.println("2. Wczytaj postać");
        String choose = scanner.nextLine().trim();

        try {
            Player player;

            if("2".equals(choose)){

                Player loadPlayer = null;
                while(loadPlayer==null) {
                    System.out.println("+++++++++ Wczytywanie postaci +++++++++");
                    System.out.println();
                    System.out.println("Podaj nazwę postacji");
                    String readPlayer = scanner.nextLine().trim();

                    if (!playerDAO.checkIfPlayerExists(readPlayer)) {
                        System.out.println("Gracz o podanej naziwe nie istnieje!");
                    }else{
                        loadPlayer=playerDAO.createPlayer(readPlayer);
                    }

                }
                player = loadPlayer;
            }else {
                Player newPlayer = null;
                while(newPlayer==null) {
                    System.out.println("+++++++++ Nowa gra +++++++++");
                    System.out.println("Podaj nazwę postaci");
                    String readPlayer = scanner.nextLine().trim();

                    if (playerDAO.checkIfPlayerExists(readPlayer)) {
                        System.out.println("Gracz o takiej nazwie już istnieje!");
                    } else {
                        newPlayer = playerDAO.createPlayer(readPlayer);
                    }
                }
                player = newPlayer;
            }


            GameLogic game = new GameLogic(player);
            game.StartGame();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
