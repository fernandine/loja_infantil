package com.jean.lojaInfantil.backend.entities.enums;

public enum Colors {
    AZUL("Azul"),
    ROSA_BEBE("Rosa Bebê"),
    LILAS("Lilás"),
    VERMELHO("Vermelho"),
    AMARELO("Amarelo"),
    VERDE("Verde"),
    PRETO("Preto"),
    BRANCO("Branco"),
    CINZA("Cinza"),
    MARROM("Marrom"),
    ROXO("Roxo"),
    BEGE("Bege"),
    LARANJA("Laranja"),
    ROSA("Rosa"),
    TURQUESA("Turquesa");

    private final String name;

    Colors(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
