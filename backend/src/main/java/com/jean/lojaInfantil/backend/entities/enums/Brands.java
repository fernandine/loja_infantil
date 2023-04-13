package com.jean.lojaInfantil.backend.entities.enums;

public enum Brands {
    CARINHOSO(1, "Carinhoso"),
    MALWEE_KIDS(2, "Malwee Kids"),
    LILICA_RIPILICA(3, "Lilica Ripilica"),
    TIP_TOP(4, "Tip Top"),
    BRANDILI(5, "Brandili"),
    MARISOL(6, "Marisol"),
    PUC(7, "PUC"),
    TROLLE(8, "Trolle"),
    UP_BABY(9, "Up Baby"),
    MILON(10, "Milon");

    private final int value;
    private final String name;

    Brands(int value, String name) {
        this.value = value;
        this.name = name;
    }

    public int getValue() {
        return value;
    }

    public String getName() {
        return name;
    }
}