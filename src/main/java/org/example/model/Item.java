package org.example.model;

public class Item {

    public int itemId;
    public String itemName;
    public int itemPower;
    public String itemType;

    public Item() {
    }

    public Item(int itemId, String itemName, int itemPower, String itemType) {
        this.itemId = itemId;
        this.itemName = itemName;
        this.itemPower = itemPower;
        this.itemType = itemType;
    }


    @Override
    public String toString() {
        return itemName + "(+" + itemPower +")";
    }
}
