-- -------------------------------------------
-- Usuários e perfis
-- -------------------------------------------
INSERT INTO tb_user (first_name, last_name, cpf, birth_day, phone, email, password) VALUES ('Alex', 'Brown', '12345678', '2006-12-05', '31971734658', 'alex@gmail.com', '$2a$10$eACCYoNOHEqXve8aIWT8Nu3PkMXWBaOxJ9aORUYzfMQCbVBIhZ8tG');
INSERT INTO tb_user (first_name, last_name, cpf, birth_day, phone, email, password) VALUES ('Maria', 'Green', '87654321', '2020-02-05', '31978455484', 'maria@gmail.com', '$2a$10$eACCYoNOHEqXve8aIWT8Nu3PkMXWBaOxJ9aORUYzfMQCbVBIhZ8tG');

INSERT INTO tb_role (authority) VALUES ('ROLE_USER');
INSERT INTO tb_role (authority) VALUES ('ROLE_ADMIN');

INSERT INTO tb_user_role (user_id, role_id) VALUES (1, 1);
INSERT INTO tb_user_role (user_id, role_id) VALUES (2, 1);
INSERT INTO tb_user_role (user_id, role_id) VALUES (2, 2);

-- -----------------------------------------------------
-- Categorias
-- -----------------------------------------------------
INSERT INTO tb_category(name) VALUES ('Bebês');
INSERT INTO tb_category(name) VALUES ('Meninas');
INSERT INTO tb_category(name) VALUES ('Meninos');
INSERT INTO tb_category(name) VALUES ('Roupas de banho');
INSERT INTO tb_category(name) VALUES ('Calçados');
INSERT INTO tb_category(name) VALUES ('Acessórios');
INSERT INTO tb_category(name) VALUES ('Roupas de Dormir');
INSERT INTO tb_category(name) VALUES ('Roupas de Inverno');

-- -----------------------------------------------------
-- Bebês (0-12 meses)
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MAC001', 'Macacão de Manga Longa', 'Macacão de manga longa para bebês', 'imagem_mac001.jpg', false, 50, 39.90, 1, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('CONJ001', 'Conjunto de Body e Calça', 'Conjunto de body e calça para bebês', 'imagem_conj001.jpg', false, 30, 59.90, 1, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('BAB001', 'Babador', 'Babador para bebês', 'imagem_bab001.jpg', false, 100, 9.90, 1, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('TOU001', 'Touca', 'Touca para bebês', 'imagem_tou001.jpg', false, 50, 19.90, 1, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MEI001', 'Meia', 'Meia para bebês', 'imagem_mei001.jpg', false, 80, 9.90, 1, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('SAP001', 'Sapatinho', 'Sapatinho para bebês', 'imagem_sap001.jpg', false, 40, 29.90, 1, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('JAR001', 'Jardineira', 'Jardineira para bebês', 'imagem_jar001.jpg', false, 20, 49.90, 1, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('VES001', 'Vestido para Batizado', 'Vestido para batizado de bebês', 'imagem_ves001.jpg', false, 10, 89.90, 1, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MAN001', 'Manta', 'Manta para bebês', 'imagem_man001.jpg', false, 25, 69.90, 1, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('FRA001', 'Fralda de Pano', 'Fralda de pano para bebês', 'imagem_fra001.jpg', true, 50, 19.90, 1, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('CUE001', 'Cueiro', 'Cueiro para bebês', 'imagem_cue001.jpg', false, 30, 29.90, 1, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('BOD001', 'Body de Manga Curta', 'Body de manga curta para bebês', 'imagem_bod001.jpg', true, 40, 24.90, 1, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('PIJ001', 'Pijama com Pezinho', 'Pijama com pezinho para bebês', 'imagem_pij001.jpg', false, 20, 39.90, 1, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('SAI001', 'Saída de Maternidade', 'Saída de maternidade para bebês', 'imagem_sai001.jpg', false, 15, 99.90, 1, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('CAS001', 'Casaco de Lã', 'Casaco de lã para bebês', 'imagem_cas001.jpg', false, 10, 79.90, 1, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('CAL001', 'Calça com Elástico na Cintura', 'Calça com elástico na cintura para bebês', 'imagem_cal001.jpg', false, 30, 34.90, 1, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('BLU001', 'Blusinha com Botões de Pressão', 'Blusinha com botões de pressão para bebês', 'imagem_blu001.jpg', false, 25, 29.90, 1, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('LEN001', 'Lençol para Berço', 'Lençol para berço de bebês', 'imagem_len001.jpg', false, 20, 49.90, 1, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('COB001', 'Cobertor de Algodão', 'Cobertor de algodão para bebês', 'imagem_cob001.jpg', false, 10, 69.90, 1, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('BAB001', 'Babador Bandana', 'Babador bandana para bebês', 'imagem_bab001.jpg', false, 50, 14.90, 1, NOW(), 0);

-- -----------------------------------------------------
-- Meninas (1-12 anos)
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('VES001', 'Vestido', 'Vestido para meninas', 'imagem_ves001.jpg', false, 50, 99.90, 2, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('SAI001', 'Saia', 'Saia para meninas', 'imagem_sai001.jpg', false, 30, 49.90, 2, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('BLU001', 'Blusinha', 'Blusinha para meninas', 'imagem_blu001.jpg', false, 40, 29.90, 2, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('CON001', 'Conjunto de Blusa e Saia', 'Conjunto de blusa e saia para meninas', 'imagem_con001.jpg', false, 20, 79.90, 2, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('CAL001', 'Calça Jeans', 'Calça jeans para meninas', 'imagem_cal001.jpg', false, 15, 89.90, 2, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('LEG001', 'Legging', 'Legging para meninas', 'imagem_leg001.jpg', false, 25, 39.90, 2, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('CAS001', 'Casaco', 'Casaco para meninas', 'imagem_cas001.jpg', false, 10, 129.90, 2, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('CAM001', 'Camiseta', 'Camiseta para meninas', 'imagem_cam001.jpg', false, 35, 19.90, 2, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('PIJ001', 'Pijama de Personagens', 'Pijama de personagens para meninas', 'imagem_pij001.jpg', false, 20, 59.90, 2, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('CALC001', 'Calçado', 'Calçado para meninas', 'imagem_calc001.jpg', false, 10, 79.90, 2, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('ACE001', 'Acessório', 'Acessório para meninas', 'imagem_ace001.jpg', false, 50, 9.90, 2, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MAI001', 'Maiô/Biquíni', 'Maiô ou biquíni para meninas', 'imagem_mai001.jpg', false, 20, 69.90, 2, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('CONM001', 'Conjunto de Moletom', 'Conjunto de moletom para meninas', 'imagem_conm001.jpg', false, 15, 119.90, 2, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('JAQ001', 'Jaqueta', 'Jaqueta para meninas', 'imagem_jaq001.jpg', false, 10, 99.90, 2, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('ROU001', 'Roupão de Banho', 'Roupão de banho para meninas', 'imagem_rou001.jpg', true, 5, 79.90, 2, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MEI001', 'Meias Coloridas', 'Meias coloridas para meninas', 'imagem_mei001.jpg', false, 30, 9.90, 2, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('VESF001', 'Vestido de Festa', 'Vestido de festa para meninas', 'imagem_vesf001.jpg', true, 10, 149.90, 2, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('TOU001', 'Touca de Lã', 'Touca de lã para meninas', 'imagem_tou001.jpg', false, 20, 19.90, 2, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('LUV001', 'Luvas', 'Luvas para meninas', 'imagem_luv001.jpg', false, 15, 14.90, 2, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('BIJ001', 'Bijuterias Infantis', 'Bijuterias infantis para meninas', 'imagem_bij001.jpg', false, 25, 9.90, 2, NOW(), 0);

-- -----------------------------------------------------
-- Meninos (1-12 anos)
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MEN001', 'Camisetas', 'Camisetas para meninos', 'imagem_men001.jpg', false, 50, 19.90, 3, NOW(), 2);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MEN002', 'Bermudas', 'Bermudas infantis para meninos', 'imagem_men002.jpg', false, 30, 39.90, 3, NOW(), 3);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MEN003', 'Calças de Sarja', 'Calças de sarja para meninos', 'imagem_men003.jpg', false, 20, 59.90, 3, NOW(), 4);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MEN004', 'Conjuntos de Camiseta e Bermuda', 'Conjuntos de camiseta e bermuda para meninos', 'imagem_men004.jpg', false, 25, 79.90, 3, NOW(), 5);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MEN005', 'Calças Jeans', 'Calças jeans infantis para meninos', 'imagem_men005.jpg', false, 40, 89.90, 3, NOW(), 6);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MEN006', 'Jaquetas', 'Jaquetas infantis para meninos', 'imagem_men006.jpg', false, 15, 99.90, 3, NOW(), 7);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MEN007', 'Blusas de Manga Longa', 'Blusas de manga longa para meninos', 'imagem_men007.jpg', false, 30, 29.90, 3, NOW(), 8);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MEN008', 'Casacos', 'Casacos infantis para meninos', 'imagem_men008.jpg', false, 10, 119.90, 3, NOW(), 9);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MEN009', 'Pijamas de Personagens', 'Pijamas de personagens para meninos', 'imagem_men009.jpg', false, 20, 49.90, 3, NOW(), 10);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MEN010', 'Calçados', 'Calçados infantis para meninos', 'imagem_men010.jpg', false, 30, 79.90, 3, NOW(), 1);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MEN011', 'Acessórios', 'Acessórios infantis para meninos', 'imagem_men011.jpg', true, 40, 9.90, 3, NOW(), 1);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MEN012', 'Conjuntos de Moletom', 'Conjuntos de moletom infantis para meninos', 'imagem_men012.jpg', true, 15, 99.90, 3, NOW(), 1);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MEN013', 'Roupas de Time de Futebol', 'Roupas de time de futebol para meninos', 'imagem_men013.jpg', false, 20, 69.90, 3, NOW(), 1);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MEN014', 'Conjuntos de Pijama com Camiseta e Calça', 'Conjuntos de pijama com camiseta e calça para meninos', 'imagem_men014.jpg', false, 25, 59.90, 3, NOW(), 1);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MEN015', 'Camisas Polo', 'Camisas polo infantis para meninos', 'imagem_men015.jpg', false, 30, 49.90, 3, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MEN016', 'Terninhos', 'Terninhos infantis para meninos', 'imagem_men016.jpg', false, 10, 129.90, 3, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MEN017', 'Gravatas Infantis', 'Gravatas infantis para meninos', 'imagem_men017.jpg', 1, 20, 19.90, 3, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MEN018', 'Cuecas', 'Cuecas infantis para meninos', 'imagem_men018.jpg', false, 30, 9.90, 3, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MEN019', 'Sungas', 'Sungas infantis para meninos', 'imagem_men019.jpg', false, 15, 29.90, 3, NOW(), 0);

---- -----------------------------------------------------
---- Roupas de banho
---- -----------------------------------------------------
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('RPB001', 'Maiôs', 'Maiôs infantis para praia e piscina', 'imagem_rpb001.jpg', false, 20, 59.90, 4, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('RPB002', 'Biquínis', 'Biquínis infantis para praia e piscina', 'imagem_rpb002.jpg', false, 15, 49.90, 4, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('RPB003', 'Sungas', 'Sungas infantis para praia e piscina', 'imagem_rpb003.jpg', false, 25, 39.90, 4, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('RPB004', 'Toucas de Natação', 'Toucas de natação infantis para proteção e estilo', 'imagem_rpb004.jpg', false, 30, 19.90, 4, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('RPB005', 'Saias de Praia', 'Saias de praia infantis para estilo e conforto', 'imagem_rpb005.jpg', false, 10, 29.90, 4, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('RPB006', 'Rash Guards', 'Rash guards infantis para proteção solar na praia', 'imagem_rpb006.jpg', false, 8, 39.90, 4, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('RPB007', 'Toalhas de Praia', 'Toalhas de praia infantis para diversão na areia', 'imagem_rpb007.jpg', false, 20, 49.90, 4, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('RPB008', 'Sandálias de Praia', 'Sandálias de praia infantis para conforto e estilo', 'imagem_rpb008.jpg', false, 15, 29.90, 4, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('RPB009', 'Chapéus de Sol', 'Chapéus de sol infantis para proteção do sol', 'imagem_rpb009.jpg', false, 12, 24.90, 4, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('RPB010', 'Óculos de Sol', 'Óculos de sol infantis para proteção e estilo', 'imagem_rpb010.jpg', false, 10, 39.90, 4, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('RPB011', 'Boias de Braço', 'Boias de braço infantis para aprendizado na água', 'imagem_rpb011.jpg', false, 18, 14.90, 4, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('RPB012', 'Flutuadores de Piscina', 'Flutuadores de piscina infantis para diversão na água', 'imagem_rpb012.jpg', true, 20, 19.90, 4, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('RPB013', 'Fraldas de Piscina', 'Fraldas de piscina infantis para uso na água', 'imagem_rpb013.jpg', false, 25, 24.90, 4, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('RPB014', 'Tênis de Água', 'Tênis de água infantis para proteção dos pés', 'imagem_rpb014.jpg', false, 10, 59.90, 4, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('RPB015', 'Roupões de Praia', 'Roupões de praia infantis para conforto após o banho de mar', 'imagem_rpb015.jpg', false, 5, 89.90, 4, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('RPB016', 'Bolsas de Praia', 'Bolsas de praia infantis para transporte de itens pessoais', 'imagem_rpb016.jpg', false, 10, 39.90, 4, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('RPB017', 'Conjuntos de Biquíni Mãe e Filha', 'Conjuntos de biquíni para mães e filhas combinarem na praia', 'imagem_rpb017.jpg', true, 3, 129.90, 4, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('RPB018', 'Conjuntos de Sunga Pai e Filho', 'Conjuntos de sunga para pais e filhos combinarem na praia', 'imagem_rpb018.jpg', false, 4, 99.90, 4, NOW(), 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('RPB019', 'Camisetas com Proteção UV', 'Camisetas infantis com proteção UV para praia e piscina', 'imagem_rpb019.jpg', false, 6, 49.90, 4, NOW(), 0);

-- -----------------------------------------------------
-- Calçados
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count, product_color, product_brand, product_size) VALUES ('TNS001', 'Tênis Esportivo', 'Tênis para prática de atividades físicas', 'tenis-esportivo.jpg', false, 50, 199.99, 5, '2022-01-01', 0, 'AZUL', 'CARINHOSO', 'P' );
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count, product_color, product_brand, product_size) VALUES ('SND001', 'Sandália Feminina', 'Sandália confortável e elegante para o dia a dia', 'sandalia-feminina.jpg', false, 100, 79.99, 5, '2022-01-02', 0, 'VERDE', 'PUC', 'M');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count, product_color, product_brand, product_size) VALUES ('CHN001', 'Chinelo Masculino', 'Chinelo básico para uso casual', 'chinelo-masculino.jpg', false, 150, 29.99, 5, '2022-01-03', 0, 'AMARELO', 'MARISOL', 'G');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count, product_color, product_brand, product_size) VALUES ('BOT001', 'Bota Masculina', 'Bota de couro para uso em ambientes frios', 'bota-masculina.jpg', false, 50, 299.99, 5, '2022-01-04', 0, 'AZUL', 'PUC', 'M');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count, product_color, product_brand, product_size) VALUES ('SPT001', 'Sapatilha Feminina', 'Sapatilha elegante para uso em ocasiões formais', 'sapatilha-feminina.jpg', false, 75, 149.99, 5, '2022-01-05', 0, 'LILAS', 'PUC', 'M');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count, product_color, product_brand, product_size) VALUES ('SPT002', 'Sapato Social Masculino', 'Sapato social de couro para uso em ambientes profissionais', 'sapato-social-masculino.jpg', false, 25, 349.99, 5, '2022-01-06', 0, 'ROXO', 'PUC', 'M');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count, product_color, product_brand, product_size) VALUES ('CHN002', 'Chinelo de Dedo Feminino', 'Chinelo básico para uso casual', 'chinelo-de-dedo-feminino.jpg', false, 200, 19.99, 5, '2022-01-07', 0, 'VERDE', 'PUC', 'M');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count, product_color, product_brand, product_size) VALUES ('BOT002', 'Bota de Chuva Unissex', 'Bota impermeável para uso em dias chuvosos', 'bota-de-chuva-unissex.jpg', false, 100, 89.99, 5, '2022-01-08', 0, 'ROSA_BEBE', 'PUC', 'M');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count, product_color, product_brand, product_size) VALUES ('PTF001', 'Pantufa Unissex', 'Pantufa confortável para uso no inverno', 'pantufa-unissex.jpg', false, 50, 49.99, 5, '2022-01-09', 0, 'BRANCO', 'PUC', 'M');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count, product_color, product_brand, product_size) VALUES ('TNS002', 'Tênis Infantil com Luzinhas', 'Tênis infantil com luzinhas na sola', 'tenis-infantil-luzinhas.jpg', false, 75, 79.99, 5, '2022-01-10', 0, 'CINZA', 'PUC', 'M');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count, product_color, product_brand, product_size) VALUES ('TNS003', 'Tênis Infantil com Rodinhas', 'Tênis infantil com rodinhas na sola para brincadeiras divertidas', 'tenis-infantil-rodinhas.jpg', false, 100, 99.99, 5, '2022-01-11', 0, 'AMARELO', 'PUC', 'SIZE_1');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count, product_color, product_brand, product_size) VALUES ('GLC001', 'Galocha Feminina', 'Galocha elegante para uso em dias chuvosos', 'galocha-feminina.jpg', true, 50, 129.99, 5, '2022-01-12', 0, 'CINZA', 'PUC', 'M');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count, product_color, product_brand, product_size) VALUES ('SPN001', 'Sapatênis Masculino', 'Sapatênis casual para uso no dia a dia', 'sapatênis-masculino.jpg', true, 75, 149.99, 5, '2022-01-13', 0, 'CINZA', 'PUC', 'M');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count, product_color, product_brand, product_size) VALUES ('ESP001', 'Espadrille Feminina', 'Espadrille elegante para uso em ocasiões informais', 'espadrille-feminina.jpg', false, 25, 99.99, 5, '2022-01-14', 0, 'CINZA', 'PUC', 'SIZE_4');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count, product_color, product_brand, product_size) VALUES ('MCS001', 'Mocassim Masculino', 'Mocassim de couro para uso em ambientes profissionais', 'mocassim-masculino.jpg', false, 50, 199.99, 5, '2022-01-15', 0, 'CINZA', 'PUC', 'SIZE_8');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count, product_color, product_brand, product_size) VALUES ('ALP001', 'Alpargata Feminina', 'Alpargata confortável e casual para uso no dia a dia', 'alpargata-feminina.jpg', false, 100, 59.99, 5, '2022-01-16', 0, 'VERDE', 'PUC', 'SIZE_4');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count, product_color, product_brand, product_size) VALUES ('TNS004', 'Tênis de Basquete Masculino', 'Tênis de basquete com alta performance', 'tenis-basquete-masculino.jpg', false, 20, 399.99, 5, '2022-01-17', 0, 'VERDE', 'PUC', 'SIZE_4');

-- -----------------------------------------------------
-- Acessórios
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MHS001', 'Meia Infantil', 'Meia confortável para bebês e crianças', 'meia-infantil.jpg', false, 200, 19.99, 6, '2022-01-18', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('BNS002', 'Boné Infantil', 'Boné com proteção solar para bebês e crianças', 'bone-infantil.jpg', false, 100, 29.99, 6, '2022-01-19', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('CNT003', 'Cinto Infantil', 'Cinto de tecido elástico para bebês e crianças', 'cinto-infantil.jpg', false, 50, 39.99, 6, '2022-01-20', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('LCS004', 'Laço de Cabelo Infantil', 'Laço de cabelo de tecido macio para bebês e meninas', 'laco-de-cabelo-infantil.jpg', false, 150, 9.99, 6, '2022-01-21', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('FXC005', 'Faixa de Cabelo Infantil', 'Faixa de cabelo elástica para bebês e meninas', 'faixa-de-cabelo-infantil.jpg', false, 100, 14.99, 6, '2022-01-22', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('CHP006', 'Chapéu Infantil', 'Chapéu com proteção solar para bebês e crianças', 'chapeu-infantil.jpg', false, 75, 49.99, 6, '2022-01-23', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('LVS007', 'Luva Infantil', 'Luva de tecido macio para bebês e crianças', 'luva-infantil.jpg', false, 50, 24.99, 6, '2022-01-24', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('GRB008', 'Gravata Borboleta Infantil', 'Gravata borboleta ajustável para bebês e crianças', 'gravata-borboleta-infantil.jpg', false, 25, 29.99, 6, '2022-01-25', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('OCS009', 'Óculos de Sol Infantil', 'Óculos de sol com proteção UV para bebês e crianças', 'oculos-de-sol-infantil.jpg', false, 30, 59.99, 6, '2022-01-26', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('BJT010', 'Conjunto de Bijuterias Infantil', 'Conjunto de colar, pulseira e brincos para meninas', 'bijuterias-infantis.jpg', true, 40, 39.99, 6, '2022-01-27', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('BLS011', 'Bolsa Infantil', 'Bolsa infantil para meninas com alça ajustável', 'bolsa-infantil.jpg', false, 20, 49.99, 6, '2022-01-28', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('RLG012', 'Relógio de Pulso Infantil', 'Relógio de pulso para crianças com pulseira de borracha', 'relogio-infantil.jpg', true, 30, 69.99, 6, '2022-01-29', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('ACM013', 'Acessórios de Cabelo para Meninos', 'Conjunto com boné e faixa para meninos', 'acessorios-cabelo-menino.jpg', false, 50, 39.99, 6, '2022-01-30', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('FXC014', 'Faixa de Cabelo com Flores', 'Faixa de cabelo com flores para bebês e meninas', 'faixa-de-cabelo-com-flores.jpg', false, 100, 16.99, 6, '2022-01-31', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('FXC015', 'Faixa de Cabelo com Laços', 'Faixa de cabelo com laços para bebês e meninas', 'faixa-de-cabelo-com-lacos.jpg', false, 75, 14.99, 6, '2022-02-01', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('FXC016', 'Faixa de Cabelo de Personagem', 'Faixa de cabelo com personagens para bebês e meninas', 'faixa-de-cabelo-personagem.jpg', false, 50, 19.99, 6, '2022-02-02', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('FXC017', 'Faixa de Cabelo de Crochê', 'Faixa de cabelo de crochê para bebês e meninas', 'faixa-de-cabelo-croche.jpg', false, 30, 12.99, 6, '2022-02-03', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('TCA018', 'Touca de Inverno Infantil', 'Touca de inverno de tecido quente para bebês e crianças', 'touca-inverno-infantil.jpg', false, 40, 34.99, 6, '2022-02-04', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('ENC019', 'Enfeito de Cabelo com Flores', 'Enfeite de cabelo com flores para bebês e meninas', 'enfeite-cabelo-flores.jpg', false, 80, 9.99, 6, '2022-02-05', 0);

-- -----------------------------------------------------
-- Roupas de dormir
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('PJM001', 'Pijama de Manga Longa', 'Pijama confortável de manga longa para dormir', 'pijama-manga-longa.jpg', false, 200, 49.99, 7, '2022-03-01', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('PJM002', 'Pijama de Manga Curta', 'Pijama fresco de manga curta para dormir', 'pijama-manga-curta.jpg', false, 250, 39.99, 7, '2022-03-02', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('PJM003', 'Pijama de Personagem', 'Pijama com desenhos de personagens famosos', 'pijama-personagem.jpg', false, 100, 59.99, 7, '2022-03-03', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('CJP004', 'Conjunto de Pijama', 'Conjunto de camiseta e calça para dormir', 'conjunto-pijama.jpg', false, 150, 69.99, 7, '2022-03-04', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('CMS005', 'Camisola', 'Camisola confortável para dormir', 'camisola.jpg', false, 50, 79.99, 7, '2022-03-05', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('PTF006', 'Pantufa', 'Pantufa macia para se aquecer durante a noite', 'pantufa.jpg', true, 75, 29.99, 7, '2022-03-06', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('RBE007', 'Robe', 'Robe de tecido leve para usar por cima do pijama', 'robe.jpg', false, 40, 89.99, 7, '2022-03-07', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('RPN008', 'Roupão', 'Roupão de banho macio e confortável', 'roupao.jpg', false, 30, 99.99, 7, '2022-03-08', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MCD009', 'Macacão de Dormir', 'Macacão confortável de tecido macio para dormir', 'macacao-dormir.jpg', false, 100, 59.99, 7, '2022-03-09', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('CMP010', 'Camiseta de Pijama', 'Camiseta confortável para dormir', 'camiseta-pijama.jpg', false, 200, 29.99, 7, '2022-03-10', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('SHD011', 'Shorts de Dormir', 'Shorts fresco de tecido leve para dormir', 'shorts-dormir.jpg', false, 150, 19.99, 7, '2022-03-11', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('PJO012', 'Pijama de Algodão Orgânico', 'Pijama confortável de algodão orgânico para dormir', 'pijama-algodao-organico.jpg', false, 50, 79.99, 7, '2022-03-12', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('PJF013', 'Pijama de Flanela', 'Pijama quente de tecido flanelado para dormir', 'pijama-flanela.jpg', false, 80, 89.99, 7, '2022-03-13', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('PJL014', 'Pijama de Malha', 'Pijama de malha macia e confortável para dormir', 'pijama-malha.jpg', true, 100, 59.99, 7, '2022-03-14', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('PJF015', 'Pijama de Fleece', 'Pijama quente de tecido fleece para dormir', 'pijama-fleece.jpg', false, 70, 99.99, 7, '2022-03-15', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('PJS016', 'Pijama de Seda Sintética', 'Pijama elegante de tecido sedoso para dormir', 'pijama-seda-sintetica.jpg', false, 20, 149.99, 7, '2022-03-16', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('PJA017', 'Pijama Temático de Animais', 'Pijama com desenhos de animais para dormir', 'pijama-tematico-animais.jpg', false, 90, 49.99, 7, '2022-03-17', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('PJU018', 'Pijama de Unicórnio', 'Pijama com estampa de unicórnio para dormir', 'pijama-unicornio.jpg', false, 50, 59.99, 7, '2022-03-18', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('PJH019', 'Pijama de Super-Herói', 'Pijama com desenhos de super-heróis para dormir', 'pijama-super-heroi.jpg', false, 60, 69.99, 7, '2022-03-19', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('PJP020', 'Pijama de Princesa', 'Pijama com desenhos de princesas para dormir', 'pijama-princesa.jpg', false, 80, 59.99, 7, '2022-03-20', 0);

-- -----------------------------------------------------
-- Roupas de Inverno
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('CJL001', 'Casaco de Lã Infantil', 'Casaco quente de lã para crianças no inverno', 'casaco-la-infantil.jpg', true, 50, 99.99, 8, '2022-03-01', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('JQA002', 'Jaqueta Acolchoada Infantil', 'Jaqueta com enchimento para proteger do frio', 'jaqueta-acolchoada-infantil.jpg', false, 75, 129.99, 8, '2022-03-02', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('BLA003', 'Blusa de Lã Infantil', 'Blusa quente de lã para usar por baixo das outras peças', 'blusa-la-infantil.jpg', false, 100, 49.99, 8, '2022-03-03', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('GRS004', 'Gorro de Lã Infantil', 'Gorro quente de lã para proteger a cabeça do frio', 'gorro-la-infantil.jpg', false, 150, 19.99, 8, '2022-03-04', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('CCH005', 'Cachecol Infantil', 'Cachecol quente para proteger o pescoço do frio', 'cachecol-infantil.jpg', false, 80, 29.99, 8, '2022-03-05', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('LVI006', 'Luva de Inverno Infantil', 'Luva quente para proteger as mãos do frio', 'luva-inverno-infantil.jpg', false, 120, 14.99, 8, '2022-03-06', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('CLM007', 'Calça de Moletom Infantil', 'Calça confortável para usar em casa no inverno', 'calca-moletom-infantil.jpg', false, 200, 39.99, 8, '2022-03-07', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('CJM008', 'Conjunto de Moletom Infantil', 'Conjunto de blusa e calça de moletom para usar em casa no inverno', 'conjunto-moletom-infantil.jpg', false, 100, 79.99, 8, '2022-03-08', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('BTF009', 'Bota Forrada Infantil', 'Bota com forro quente para proteger os pés do frio', 'bota-forrada-infantil.jpg', false, 50, 149.99, 8, '2022-03-09', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MEL010', 'Meia de Lã Infantil', 'Meia quente de lã para proteger os pés do frio', 'meia-la-infantil.jpg', false, 150, 9.99, 8, '2022-03-10', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('JQC011', 'Jaqueta Corta-vento Infantil', 'Jaqueta resistente ao vento para proteger do frio', 'jaqueta-corta-vento-infantil.jpg', false, 80, 89.99, 4, '2022-03-11', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('CLN012', 'Calça de Neve Infantil', 'Calça impermeável e quente para usar na neve', 'calca-neve-infantil.jpg', false, 30, 199.99, 8, '2022-03-12', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('RPT013', 'Roupa Térmica Infantil', 'Conjunto de blusa e calça térmicos para proteger do frio', 'roupa-termica-infantil.jpg', false, 50, 149.99, 8, '2022-03-13', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('SUE014', 'Suéter Infantil', 'Suéter quente para usar por cima das blusas', 'sueter-infantil.jpg', false, 90, 69.99, 8, '2022-03-14', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('CPS015', 'Casaco Infantil de Pele Sintética', 'Casaco quente com aparência de pele para proteger do frio', 'casaco-pele-sintetica-infantil.jpg', false, 40, 129.99, 8, '2022-03-15', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('LGT016', 'Legging Térmica Infantil', 'Legging quente para usar por baixo das calças', 'legging-termica-infantil.jpg', false, 120, 29.99, 8, '2022-03-16', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('SBT017', 'Sobretudo Infantil', 'Sobretudo longo e quente para proteger do frio', 'sobretudo-infantil.jpg', false, 60, 149.99, 8, '2022-03-17', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('GOL018', 'Gola de Lã Infantil', 'Gola quente para proteger o pescoço do frio', 'gola-la-infantil.jpg', false, 100, 24.99, 8, '2022-03-18', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('MCL019', 'Meia-calça de Lã Infantil', 'Meia-calça quente de lã para usar por baixo das calças', 'meia-calca-la-infantil.jpg', false, 70, 39.99, 8, '2022-03-19', 0);
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created, sales_count) VALUES ('CPC020', 'Capa de Chuva Infantil', 'Capa impermeável para proteger da chuva', 'capa-chuva-infantil.jpg', false, 50, 79.99, 8, '2022-03-20', 0);

-- -----------------------------------------------------
-- Endereços
-- -----------------------------------------------------
INSERT INTO tb_address(cep, logradouro,complemento, bairro, localidade, uf, user_id) VALUES ('34001090','Rua Levy Firmino Alves', 'casa A', 'Parque Santo Antônio', 'Nova Lima', 'MG', 2);
INSERT INTO tb_address(cep, logradouro,complemento, bairro, localidade, uf, user_id) VALUES ('34012-856','Rua Seis', 'casa B', 'Santa Rita', 'Nova Lima', 'MG', 1);

-- -----------------------------------------------------
-- Pedidos
-- -----------------------------------------------------
INSERT INTO tb_order (moment, status, client_id) VALUES (TIMESTAMP WITH TIME ZONE '2022-07-25T13:00:00Z', 1, 1);
INSERT INTO tb_order (moment, status, client_id) VALUES (TIMESTAMP WITH TIME ZONE '2022-07-29T15:50:00Z', 3, 2);
INSERT INTO tb_order (moment, status, client_id) VALUES (TIMESTAMP WITH TIME ZONE '2022-08-03T14:20:00Z', 0, 1);

-- -----------------------------------------------------
-- Itens de pedidos
-- -----------------------------------------------------
INSERT INTO tb_order_item (order_id, product_id, quantity, price) VALUES (1, 1, 2, 90.5);
INSERT INTO tb_order_item (order_id, product_id, quantity, price) VALUES (1, 2, 1, 1250.0);
INSERT INTO tb_order_item (order_id, product_id, quantity, price) VALUES (2, 3, 1, 1250.0);
INSERT INTO tb_order_item (order_id, product_id, quantity, price) VALUES (3, 4, 1, 90.5);

-- -----------------------------------------------------
-- Instante do Pagamento
-- -----------------------------------------------------
INSERT INTO tb_payment (order_id, moment) VALUES (1, TIMESTAMP WITH TIME ZONE '2022-07-25T15:00:00Z');
INSERT INTO tb_payment (order_id, moment) VALUES (2, TIMESTAMP WITH TIME ZONE '2022-07-30T11:00:00Z');

-- -----------------------------------------------------
-- Countries
-- -----------------------------------------------------
INSERT INTO country(code, name) VALUES ('BR','Brazil');

INSERT INTO country(code, name) VALUES ('CA','Canada');
INSERT INTO country(code, name) VALUES ('DE','Germany');
INSERT INTO country(code, name) VALUES ('IN','India');
INSERT INTO country(code, name) VALUES ('TR','Turkey');
INSERT INTO country(code, name) VALUES ('US','United States');

-- -----------------------------------------------------
-- States
-- -----------------------------------------------------
INSERT INTO state(name, country_id) VALUES ('Acre',1),('Alagoas',1),('Amapá',1),('Amazonas',1),('Bahia',1),('Ceará',1),('Distrito Federal',1),('Espírito Santo',1),('Goiás',1),('Maranhão',1),('Mato Grosso do Sul',1),('Mato Grosso',1),('Minas Gerais',1),('Paraná',1),('Paraíba',1),('Pará',1),('Pernambuco',1),('Piaui',1),('Rio de Janeiro',1),('Rio Grande do Norte',1),('Rio Grande do Sul',1),('Rondônia',1),('Roraima',1),('Santa Catarina',1),('Sergipe',1),('São Paulo',1),('Tocantins',1),('Alberta',2),('British Columbia',2),('Manitoba',2),('New Brunswick',2),('Newfoundland and Labrador',2);

INSERT INTO state(name, country_id) VALUES ('Northwest Territories',2),('Nova Scotia',2),('Nunavut',2),('Ontario',2),('Prince Edward Island',2),('Quebec',2),('Saskatchewan',2),('Yukon',2),('Baden-Württemberg',3),('Bavaria',3),('Berlin',3),('Brandenburg',3),('Bremen',3),('Hamburg',3),('Hesse',3),('Lower Saxony',3),('Mecklenburg-Vorpommern',3),('North Rhine-Westphalia',3);
INSERT INTO state(name, country_id) VALUES ('Rhineland-Palatinate',3),('Saarland',3),('Saxony',3),('Saxony-Anhalt',3),('Schleswig-Holstein',3),('Thuringia',3),('Andhra Pradesh',4),('Arunachal Pradesh',4),('Assam',4),('Bihar',4),('Chhattisgarh',4),('Goa',4),('Gujarat',4),('Haryana',4),('Himachal Pradesh',4),('Jammu & Kashmir',4),('Jharkhand',4),('Karnataka',4);
INSERT INTO state(name, country_id) VALUES ('Kerala',4),('Madhya Pradesh',4),('Maharashtra',4),('Manipur',4),('Meghalaya',4),('Mizoram',4),('Nagaland',4),('Odisha',4),('Punjab',4),('Rajasthan',4),('Sikkim',4),('Tamil Nadu',4),('Telangana',4),('Tripura',4),('Uttar Pradesh',4),('Uttarakhand',4),('West Bengal',4),('Andaman and Nicobar Islands',4),('Chandigarh',4);
INSERT INTO state(name, country_id) VALUES ('Dadra and Nagar Haveli',4),('Daman & Diu',4),('Lakshadweep',4),('Puducherry',4),('The Government of NCT of Delhi',4),('Alabama',6),('Alaska',6),('Arizona',6),('Arkansas',6),('California',6),('Colorado',6),('Connecticut',6),('Delaware',6),('District Of Columbia',6),('Florida',6),('Georgia',6),('Hawaii',6),('Idaho',6),('Illinois',6),('Indiana',6),('Iowa',6),('Kansas',6),('Kentucky',6),('Louisiana',6),('Maine',6),('Maryland',6),('Massachusetts',6),('Michigan',6),('Minnesota',6);
INSERT INTO state(name, country_id) VALUES ('Mississippi',6),('Missouri',6),('Montana',6),('Nebraska',6),('Nevada',6),('New Hampshire',6),('New Jersey',6),('New Mexico',6),('New York',6),('North Carolina',6),('North Dakota',6),('Ohio',6),('Oklahoma',6),('Oregon',6),('Pennsylvania',6),('Rhode Island',6),('South Carolina',6),('South Dakota',6),('Tennessee',6),('Texas',6),('Utah',6),('Vermont',6),('Virginia',6),('Washington',6),('West Virginia',6),('Wisconsin',6),('Wyoming',6),('Adıyaman',5),('Afyonkarahisar',5);
INSERT INTO state(name, country_id) VALUES ('Ağrı',5),('Aksaray',5),('Amasya',5),('Ankara',5),('Antalya',5),('Ardahan',5),('Artvin',5),('Aydın',5),('Balıkesir',5),('Bartın',5),('Batman',5),('Bayburt',5),('Bilecik',5),('Bingöl',5),('Bitlis',5),('Bolu',5),('Burdur',5),('Bursa',5),('Çanakkale',5),('Çankırı',5),('Çorum',5),('Denizli',5),('Diyarbakır',5),('Düzce',5),('Edirne',5),('Elazığ',5),('Erzincan',5),('Erzurum',5),('Eskişehir',5),('Gaziantep',5),('Giresun',5),('Gümüşhane',5),('Hakkâri',5),('Hatay',5);
INSERT INTO state(name, country_id) VALUES ('Iğdır',5),('Isparta',5),('İstanbul',5),('İzmir',5),('Kahramanmaraş',5),('Karabük',5),('Karaman',5),('Kars',5),('Kastamonu',5),('Kayseri',5),('Kırıkkale',5),('Kırklareli',5),('Kırşehir',5),('Kilis',5),('Kocaeli',5),('Konya',5),('Kütahya',5),('Malatya',5),('Manisa',5),('Mardin',5),('Mersin',5),('Muğla',5),('Muş',5),('Nevşehir',5),('Niğde',5),('Ordu',5),('Osmaniye',5),('Rize',5),('Sakarya',5),('Samsun',5),('Siirt',5);
INSERT INTO state(name, country_id) VALUES ('Sinop',5),('Sivas',5),('Şanlıurfa',5),('Şırnak',5),('Tekirdağ',5),('Tokat',5),('Trabzon',5),('Tunceli',5),('Uşak',5),('Van',5),('Yalova',5),('Yozgat',5),('Zonguldak',5);

-- -----------------------------------------------------
-- Reviews
-- -----------------------------------------------------
INSERT INTO tb_review (comment, rating, product_id, user_id) VALUES ('Adorei o conjuntinho de bebê.', 3, 1, 1);
INSERT INTO tb_review (comment, rating, product_id, user_id) VALUES ('Gostei e recomendo!', 4, 1, 1);
INSERT INTO tb_review (comment, rating, product_id, user_id) VALUES ('Que linda roupa!!!', 2, 2, 1);