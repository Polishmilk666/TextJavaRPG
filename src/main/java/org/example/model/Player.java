package org.example.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Player {
    public int playerId;
    public String playerName;
    public int playerLevel;
    public int playerXp;
    public int playerHp;
    public List<Item> inventory = new ArrayList<>();
    public Map<String, Item> equipment = new HashMap<>();

    public Player() {
    }

    public Player(String playerName) {
        this.playerName = playerName;
        this.playerLevel = 1;
        this.playerXp = 1;
        this.playerHp = 50;
    }

    public String getPlayerName() {
        return playerName;
    }
}
