package org.example.model;


import java.util.HashMap;
import java.util.Map;

public class Player {
    public int playerId;
    public String playerName;
    public int playerXp;
    public int playerHp;
    public Map<String, Item> equipment = new HashMap<>();

    public Player() {
    }

    public Player(String playerName) {
        this.playerName = playerName;
        this.playerXp = 1;
        this.playerHp = 100;
    }

    public String getPlayerName() {
        return playerName;
    }

    public int getPlayerId() {
        return playerId;
    }
    public int getPlayerHp(){
        return playerHp;
    }

    public int getPlayerXp() {
        return playerXp;
    }

    public void setPlayerName(String playerName) {
        this.playerName = playerName;
    }

    public void setPlayerXp(int playerXp) {
        this.playerXp = playerXp;
    }

    public void setPlayerHp(int playerHp) {
        this.playerHp = playerHp;
    }
}
