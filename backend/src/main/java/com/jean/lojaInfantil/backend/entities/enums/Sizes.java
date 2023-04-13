package com.jean.lojaInfantil.backend.entities.enums;

public enum Sizes {
    P(1, "P"),
    M(2, "M"),
    G(3, "G"),
    GG(4, "GG"),
    SIZE_1(5, "1"),
    SIZE_2(6, "2"),
    SIZE_3(7, "3"),
    SIZE_4(8, "4"),
    SIZE_6(9, "6"),
    SIZE_8(10, "8"),
    SIZE_10(11, "10"),
    SIZE_12(12, "12"),
    SIZE_14(13, "14"),
    SIZE_16(14, "16");

    private final int value;
    private final String name;

    Sizes(int value, String name) {
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
