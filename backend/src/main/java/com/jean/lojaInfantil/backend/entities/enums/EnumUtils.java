package com.jean.lojaInfantil.backend.entities.enums;

public class EnumUtils {
    public static Colors parseColor(String colorStr) {
        try {
            return Colors.valueOf(colorStr.toUpperCase());
        } catch (IllegalArgumentException ex) {
            // handle invalid color value
            throw new RuntimeException("Invalid color value: " + colorStr);
        }
    }

    public static Brands parseBrand(String brandStr) {
        try {
            return Brands.valueOf(brandStr.toUpperCase());
        } catch (IllegalArgumentException ex) {
            // handle invalid brand value
            throw new RuntimeException("Invalid brand value: " + brandStr);
        }
    }

    public static Sizes parseSize(String sizeStr) {
        try {
            return Sizes.valueOf(sizeStr.toUpperCase());
        } catch (IllegalArgumentException ex) {
            // handle invalid size value
            throw new RuntimeException("Invalid size value: " + sizeStr);
        }
    }
}

