package com.jean.lojaInfantil.backend.entities.enums;

public enum Brands {
    CARINHOSO("Carinhoso"),
    MALWEE_KIDS("Malwee Kids"),
    LILICA_RIPILICA("Lilica Ripilica"),
    TIP_TOP("Tip Top"),
    BRANDILI("Brandili"),
    MARISOL("Marisol"),
    PUC("PUC"),
    TROLLE("Trolle"),
    UP_BABY("Up Baby"),
    MILON("Milon");

    private final String name;

    Brands(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
