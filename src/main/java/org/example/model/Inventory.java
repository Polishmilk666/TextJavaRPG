package org.example.model;

public class Inventory {
    public int invenotoryId;
    public int playerId;
    public Item itemId;
    public boolean equippment;

    public Inventory(int invenotoryId, int playerId, Item itemId, boolean equippment) {
        this.invenotoryId = invenotoryId;
        this.playerId = playerId;
        this.itemId = itemId;
        this.equippment = equippment;
    }

    public int getInvenotoryId() {
        return invenotoryId;
    }

    public int getPlayerId() {
        return playerId;
    }


    public boolean isEquippment() {
        return equippment;
    }
}
