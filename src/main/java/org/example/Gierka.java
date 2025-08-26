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

                System.out.println("+++++++++ Utwórz nową postać +++++++++");
                System.out.println();
                System.out.println("Podaj nazwę postacji");
                player = playerDAO.loadPlayer(scanner.nextLine().trim());
            }else{
                System.out.println("+++++++++ Nowa gra +++++++++");
                System.out.println("Podaj nazwę postaci");
                player=playerDAO.createPlayer(scanner.nextLine().trim());

            }


            GameLogic game = new GameLogic(player);
            game.StartGame();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
