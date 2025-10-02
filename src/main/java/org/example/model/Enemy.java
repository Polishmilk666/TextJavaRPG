package org.example.model;

public class Enemy {
    public int enemyId;
    public String enemyName;
    public int enemyHp;
    public int enemyAttack;
    public int enemyLevel;

    public Enemy() {
    }

    public Enemy(int enemyId, String enemyName, int enemyHp, int enemyAttack, int enemyLevel) {
        this.enemyId = enemyId;
        this.enemyName = enemyName;
        this.enemyHp = enemyHp;
        this.enemyAttack = enemyAttack;
        this.enemyLevel = enemyLevel;
    }

    public String getEnemyName() {
        return enemyName;
    }

    public int getEnemyHp() {
        return enemyHp;
    }

    public int getEnemyAttack() {
        return enemyAttack;
    }

    public int getEnemyLevel() {
        return enemyLevel;
    }


    @Override
    public String toString() {
        return "Spotkałeś: " + enemyName + "\nLevel: " + enemyLevel + "\nZdrowie: " + enemyHp + "\nAtak: " + enemyAttack;
    }
}
