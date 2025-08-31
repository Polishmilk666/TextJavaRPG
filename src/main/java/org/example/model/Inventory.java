package org.example.model;

public class Inventory {
    public int invenotoryId;
    public int playerId;
    public Item item;
    public boolean equipped;

    public Inventory(int invenotoryId, int playerId, Item item, boolean equipped) {
        this.invenotoryId = invenotoryId;
        this.playerId = playerId;
        this.item = item;
        this.equipped = equipped;
    }

    public Inventory(Item item, boolean equipped) {
        this.item = item;
        this.equipped = equipped;
    }

    public int getInvenotoryId() {
        return invenotoryId;
    }

    public int getPlayerId() {
        return playerId;
    }


    public boolean isEquipped() {
        return equipped;
    }

    @Override
    public String toString() {
        return (equipped ? "[E] " : "") + (item == null ? "-" : item.toString());
    }
}
