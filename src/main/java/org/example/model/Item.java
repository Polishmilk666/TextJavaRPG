package org.example.model;

public class Item {

    public int itemId;
    public String itemName;
    public String itemType;
    public int itemAttack;
    public int itemDefence;

    public Item() {
    }

    public Item(int itemId, String itemName, String itemType, int itemAttack, int itemDefence) {
        this.itemId = itemId;
        this.itemName = itemName;
        this.itemType = itemType;
        this.itemAttack = itemAttack;
        this.itemDefence = itemDefence;
    }

    public int getItemId() {
        return itemId;
    }

    public String getItemName() {
        return itemName;
    }

    public String getItemType() {
        return itemType;
    }

    public int getItemAttack() {
        return itemAttack;
    }

    public int getItemDefence() {
        return itemDefence;
    }

    @Override
    public String toString() {
        return "("+ ")"+ itemId + itemName + "(" + itemType+ " " + itemAttack + " " + itemDefence +")";
    }
}
