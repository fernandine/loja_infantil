package com.jean.lojaInfantil.backend.entities.enums;

public enum Colors {
    AZUL(1, "Azul"),
    ROSA_BEBE(2, "Rosa Bebê"),
    LILAS(3, "Lilás"),
    VERMELHO(4, "Vermelho"),
    AMARELO(5, "Amarelo"),
    VERDE(6, "Verde"),
    PRETO(7, "Preto"),
    BRANCO(8, "Branco"),
    CINZA(9, "Cinza"),
    MARROM(10, "Marrom"),
    ROXO(11, "Roxo"),
    BEGE(12, "Bege"),
    LARANJA(13, "Laranja"),
    ROSA(14, "Rosa"),
    TURQUESA(15, "Turquesa");

    private final int value;
    private final String name;

    Colors(int value, String name) {
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