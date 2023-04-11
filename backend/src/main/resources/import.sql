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
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('MAC001', 'Macacão de Manga Longa', 'Macacão de manga longa para bebês', 'imagem_mac001.jpg', 0, 50, 39.90, 1, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('CONJ001', 'Conjunto de Body e Calça', 'Conjunto de body e calça para bebês', 'imagem_conj001.jpg', 0, 30, 59.90, 1, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('BAB001', 'Babador', 'Babador para bebês', 'imagem_bab001.jpg', 0, 100, 9.90, 1, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('TOU001', 'Touca', 'Touca para bebês', 'imagem_tou001.jpg', 0, 50, 19.90, 1, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('MEI001', 'Meia', 'Meia para bebês', 'imagem_mei001.jpg', 0, 80, 9.90, 1, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('SAP001', 'Sapatinho', 'Sapatinho para bebês', 'imagem_sap001.jpg', 0, 40, 29.90, 1, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('JAR001', 'Jardineira', 'Jardineira para bebês', 'imagem_jar001.jpg', 0, 20, 49.90, 1, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('VES001', 'Vestido para Batizado', 'Vestido para batizado de bebês', 'imagem_ves001.jpg', 0, 10, 89.90, 1, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('MAN001', 'Manta', 'Manta para bebês', 'imagem_man001.jpg', 0, 25, 69.90, 1, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price,category_id, date_created)
VALUES ('FRA001', 'Fralda de Pano', 'Fralda de pano para bebês', 'imagem_fra001.jpg', 0, 50, 19.90, 1, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('CUE001', 'Cueiro', 'Cueiro para bebês', 'imagem_cue001.jpg', 0, 30, 29.90, 1, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('BOD001', 'Body de Manga Curta', 'Body de manga curta para bebês', 'imagem_bod001.jpg', 0, 40, 24.90, 1, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('PIJ001', 'Pijama com Pezinho', 'Pijama com pezinho para bebês', 'imagem_pij001.jpg', 0, 20, 39.90, 1, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('SAI001', 'Saída de Maternidade', 'Saída de maternidade para bebês', 'imagem_sai001.jpg', 0, 15, 99.90, 1, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('CAS001', 'Casaco de Lã', 'Casaco de lã para bebês', 'imagem_cas001.jpg', 0, 10, 79.90, 1, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('CAL001', 'Calça com Elástico na Cintura', 'Calça com elástico na cintura para bebês', 'imagem_cal001.jpg', 0, 30, 34.90, 1, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('BLU001', 'Blusinha com Botões de Pressão', 'Blusinha com botões de pressão para bebês', 'imagem_blu001.jpg', 0, 25, 29.90, 1, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('LEN001', 'Lençol para Berço', 'Lençol para berço de bebês', 'imagem_len001.jpg', 0, 20, 49.90, 1, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('COB001', 'Cobertor de Algodão', 'Cobertor de algodão para bebês', 'imagem_cob001.jpg', 0, 10, 69.90, 1, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('BAB001', 'Babador Bandana', 'Babador bandana para bebês', 'imagem_bab001.jpg', 0, 50, 14.90, 1, NOW());

-- -----------------------------------------------------
-- Meninas (1-12 anos)
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('VES001', 'Vestido', 'Vestido para meninas', 'imagem_ves001.jpg', 0, 50, 99.90, 2, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('SAI001', 'Saia', 'Saia para meninas', 'imagem_sai001.jpg', 0, 30, 49.90, 2, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('BLU001', 'Blusinha', 'Blusinha para meninas', 'imagem_blu001.jpg', 0, 40, 29.90, 2, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('CON001', 'Conjunto de Blusa e Saia', 'Conjunto de blusa e saia para meninas', 'imagem_con001.jpg', 0, 20, 79.90, 2, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('CAL001', 'Calça Jeans', 'Calça jeans para meninas', 'imagem_cal001.jpg', 0, 15, 89.90, 2, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('LEG001', 'Legging', 'Legging para meninas', 'imagem_leg001.jpg', 0, 25, 39.90, 2, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('CAS001', 'Casaco', 'Casaco para meninas', 'imagem_cas001.jpg', 0, 10, 129.90, 2, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('CAM001', 'Camiseta', 'Camiseta para meninas', 'imagem_cam001.jpg', 0, 35, 19.90, 2, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('PIJ001', 'Pijama de Personagens', 'Pijama de personagens para meninas', 'imagem_pij001.jpg', 0, 20, 59.90, 2, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('CALC001', 'Calçado', 'Calçado para meninas', 'imagem_calc001.jpg', 0, 10, 79.90, 2, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('ACE001', 'Acessório', 'Acessório para meninas', 'imagem_ace001.jpg', 0, 50, 9.90, 2, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('MAI001', 'Maiô/Biquíni', 'Maiô ou biquíni para meninas', 'imagem_mai001.jpg', 0, 20, 69.90, 2, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('CONM001', 'Conjunto de Moletom', 'Conjunto de moletom para meninas', 'imagem_conm001.jpg', 0, 15, 119.90, 2, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('JAQ001', 'Jaqueta', 'Jaqueta para meninas', 'imagem_jaq001.jpg', 0, 10, 99.90, 2, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('ROU001', 'Roupão de Banho', 'Roupão de banho para meninas', 'imagem_rou001.jpg', 0, 5, 79.90, 2, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('MEI001', 'Meias Coloridas', 'Meias coloridas para meninas', 'imagem_mei001.jpg', 0, 30, 9.90, 2, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('VESF001', 'Vestido de Festa', 'Vestido de festa para meninas', 'imagem_vesf001.jpg', 0, 10, 149.90, 2, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('TOU001', 'Touca de Lã', 'Touca de lã para meninas', 'imagem_tou001.jpg', 0, 20, 19.90, 2, NOW());
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES ('LUV001', 'Luvas', 'Luvas para meninas', 'imagem_luv001.jpg', 0, 15, 14.90, 2, NOW());
INSERT INTO product (sku, name,'description', 'image', 'favorite', 'units_in_stock', 'unit_price', 'category_id', 'date_created')
VALUES ('BIJ001', 'Bijuterias Infantis', 'Bijuterias infantis para meninas', 'imagem_bij001.jpg', 0, 25, 9.90, 2, NOW());

-- -----------------------------------------------------
-- Meninos (1-12 anos)
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created)
VALUES
('MEN001', 'Camisetas', 'Camisetas para meninos', 'imagem_men001.jpg', 0, 50, 19.90, 3, NOW()),
('MEN002', 'Bermudas', 'Bermudas infantis para meninos', 'imagem_men002.jpg', 0, 30, 39.90, 3, NOW()),
('MEN003', 'Calças de Sarja', 'Calças de sarja para meninos', 'imagem_men003.jpg', 1, 20, 59.90, 3, NOW()),
('MEN004', 'Conjuntos de Camiseta e Bermuda', 'Conjuntos de camiseta e bermuda para meninos', 'imagem_men004.jpg', 0, 25, 79.90, 3, NOW()),
('MEN005', 'Calças Jeans', 'Calças jeans infantis para meninos', 'imagem_men005.jpg', 1, 40, 89.90, 3, NOW()),
('MEN006', 'Jaquetas', 'Jaquetas infantis para meninos', 'imagem_men006.jpg', 0, 15, 99.90, 3, NOW()),
('MEN007', 'Blusas de Manga Longa', 'Blusas de manga longa para meninos', 'imagem_men007.jpg', 1, 30, 29.90, 3, NOW()),
('MEN008', 'Casacos', 'Casacos infantis para meninos', 'imagem_men008.jpg', 0, 10, 119.90, 3, NOW()),
('MEN009', 'Pijamas de Personagens', 'Pijamas de personagens para meninos', 'imagem_men009.jpg', 1, 20, 49.90, 3, NOW()),
('MEN010', 'Calçados', 'Calçados infantis para meninos', 'imagem_men010.jpg', 1, 30, 79.90, 3, NOW()),
('MEN011', 'Acessórios', 'Acessórios infantis para meninos', 'imagem_men011.jpg', 0, 40, 9.90, 3, NOW()),
('MEN012', 'Conjuntos de Moletom', 'Conjuntos de moletom infantis para meninos', 'imagem_men012.jpg', 1, 15, 99.90, 3, NOW()),
('MEN013', 'Roupas de Time de Futebol', 'Roupas de time de futebol para meninos', 'imagem_men013.jpg', 0, 20, 69.90, 3, NOW()),
('MEN014', 'Conjuntos de Pijama com Camiseta e Calça', 'Conjuntos de pijama com camiseta e calça para meninos', 'imagem_men014.jpg', 1, 25, 59.90, 3, NOW()),
('MEN015', 'Camisas Polo', 'Camisas polo infantis para meninos', 'imagem_men015.jpg', 0, 30, 49.90, 3, NOW()),
('MEN016', 'Terninhos', 'Terninhos infantis para meninos', 'imagem_men016.jpg', 0, 5, 10, 129.90, 3, NOW()),
('MEN017', 'Gravatas Infantis', 'Gravatas infantis para meninos', 'imagem_men017.jpg', 1, 20, 19.90, 3, NOW()),
('MEN018', 'Cuecas', 'Cuecas infantis para meninos', 'imagem_men018.jpg', 0, 30, 9.90, 3, NOW()),
('MEN019', 'Sungas', 'Sungas infantis para meninos', 'imagem_men019.jpg', 1, 15, 29.90, 3, NOW());

-- -----------------------------------------------------
-- Roupas de banho
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('RPB001', 'Maiôs', 'Maiôs infantis para praia e piscina', 'imagem_rpb001.jpg', 1, 20, 59.90, 4, NOW()),
('RPB002', 'Biquínis', 'Biquínis infantis para praia e piscina', 'imagem_rpb002.jpg', 1, 15, 49.90, 4, NOW()),
('RPB003', 'Sungas', 'Sungas infantis para praia e piscina', 'imagem_rpb003.jpg', 1, 25, 39.90, 4, NOW()),
('RPB004', 'Toucas de Natação', 'Toucas de natação infantis para proteção e estilo', 'imagem_rpb004.jpg', 0, 30, 19.90, 4, NOW()),
('RPB005', 'Saias de Praia', 'Saias de praia infantis para estilo e conforto', 'imagem_rpb005.jpg', 1, 10, 29.90, 4, NOW()),
('RPB006', 'Rash Guards', 'Rash guards infantis para proteção solar na praia', 'imagem_rpb006.jpg', 1, 8, 39.90, 4, NOW()),
('RPB007', 'Toalhas de Praia', 'Toalhas de praia infantis para diversão na areia', 'imagem_rpb007.jpg', 1, 20, 49.90, 4, NOW()),
('RPB008', 'Sandálias de Praia', 'Sandálias de praia infantis para conforto e estilo', 'imagem_rpb008.jpg', 1, 15, 29.90, 4, NOW()),
('RPB009', 'Chapéus de Sol', 'Chapéus de sol infantis para proteção do sol', 'imagem_rpb009.jpg', 1, 12, 24.90, 4, NOW()),
('RPB010', 'Óculos de Sol', 'Óculos de sol infantis para proteção e estilo', 'imagem_rpb010.jpg', 1, 10, 39.90, 4, NOW()),
('RPB011', 'Boias de Braço', 'Boias de braço infantis para aprendizado na água', 'imagem_rpb011.jpg', 1, 18, 14.90, 4, NOW()),
('RPB012', 'Flutuadores de Piscina', 'Flutuadores de piscina infantis para diversão na água', 'imagem_rpb012.jpg', 1, 20, 19.90, 4, NOW()),
('RPB013', 'Fraldas de Piscina', 'Fraldas de piscina infantis para uso na água', 'imagem_rpb013.jpg', 1, 25, 24.90, 4, NOW()),
('RPB014', 'Tênis de Água', 'Tênis de água infantis para proteção dos pés', 'imagem_rpb014.jpg', 0, 10, 59.90, 4, NOW()),
('RPB015', 'Roupões de Praia', 'Roupões de praia infantis para conforto após o banho de mar', 'imagem_rpb015.jpg', 1, 5, 89.90, 4, NOW()),
('RPB016', 'Bolsas de Praia', 'Bolsas de praia infantis para transporte de itens pessoais', 'imagem_rpb016.jpg', 1, 10, 39.90, 4, NOW()),
('RPB017', 'Conjuntos de Biquíni Mãe e Filha', 'Conjuntos de biquíni para mães e filhas combinarem na praia', 'imagem_rpb017.jpg', 1, 3, 129.90, 4, NOW()),
('RPB018', 'Conjuntos de Sunga Pai e Filho', 'Conjuntos de sunga para pais e filhos combinarem na praia', 'imagem_rpb018.jpg', 1, 4, 99.90, 4, NOW()),
('RPB019', 'Camisetas com Proteção UV', 'Camisetas infantis com proteção UV para praia e piscina', 'imagem_rpb019.jpg', 1, 6, 49.90, 4, NOW());


-- -----------------------------------------------------
-- Calçados
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('TNS001', 'Tênis Esportivo', 'Tênis para prática de atividades físicas', 'tenis-esportivo.jpg', 1, 50, 199.99, 1, '2022-01-01');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('SND001', 'Sandália Feminina', 'Sandália confortável e elegante para o dia a dia', 'sandalia-feminina.jpg', 0, 100, 79.99, 1, '2022-01-02');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('CHN001', 'Chinelo Masculino', 'Chinelo básico para uso casual', 'chinelo-masculino.jpg', 1, 150, 29.99, 1, '2022-01-03');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('BOT001', 'Bota Masculina', 'Bota de couro para uso em ambientes frios', 'bota-masculina.jpg', 1, 50, 299.99, 1, '2022-01-04');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('SPT001', 'Sapatilha Feminina', 'Sapatilha elegante para uso em ocasiões formais', 'sapatilha-feminina.jpg', 0, 75, 149.99, 1, '2022-01-05');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('SPT002', 'Sapato Social Masculino', 'Sapato social de couro para uso em ambientes profissionais', 'sapato-social-masculino.jpg', 1, 25, 349.99, 1, '2022-01-06');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('CHN002', 'Chinelo de Dedo Feminino', 'Chinelo básico para uso casual', 'chinelo-de-dedo-feminino.jpg', 0, 200, 19.99, 1, '2022-01-07');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('BOT002', 'Bota de Chuva Unissex', 'Bota impermeável para uso em dias chuvosos', 'bota-de-chuva-unissex.jpg', 1, 100, 89.99, 1, '2022-01-08');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('PTF001', 'Pantufa Unissex', 'Pantufa confortável para uso no inverno', 'pantufa-unissex.jpg', 1, 50, 49.99, 1, '2022-01-09');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('TNS002', 'Tênis Infantil com Luzinhas', 'Tênis infantil com luzinhas na sola', 'tenis-infantil-luzinhas.jpg', 0, 75, 79.99, 1, '2022-01-10');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('TNS003', 'Tênis Infantil com Rodinhas', 'Tênis infantil com rodinhas na sola para brincadeiras divertidas', 'tenis-infantil-rodinhas.jpg', 1, 100, 99.99, 1, '2022-01-11');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('GLC001', 'Galocha Feminina', 'Galocha elegante para uso em dias chuvosos', 'galocha-feminina.jpg', 0, 50, 129.99, 1, '2022-01-12');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('SPN001', 'Sapatênis Masculino', 'Sapatênis casual para uso no dia a dia', 'sapatênis-masculino.jpg', 1, 75, 149.99, 1, '2022-01-13');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('ESP001', 'Espadrille Feminina', 'Espadrille elegante para uso em ocasiões informais', 'espadrille-feminina.jpg', 1, 25, 99.99, 1, '2022-01-14');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('MCS001', 'Mocassim Masculino', 'Mocassim de couro para uso em ambientes profissionais', 'mocassim-masculino.jpg', 0, 50, 199.99, 1, '2022-01-15');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('ALP001', 'Alpargata Feminina', 'Alpargata confortável e casual para uso no dia a dia', 'alpargata-feminina.jpg', 1, 100, 59.99, 1, '2022-01-16');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('TNS004', 'Tênis de Basquete Masculino', 'Tênis de basquete com alta performance', 'tenis-basquete-masculino.jpg', 1, 20, 399.99, 1, '2022-01-17');

-- -----------------------------------------------------
-- Acessórios
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('MHS001', 'Meia Infantil', 'Meia confortável para bebês e crianças', 'meia-infantil.jpg', 1, 200, 19.99, 2, '2022-01-18');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('BNS002', 'Boné Infantil', 'Boné com proteção solar para bebês e crianças', 'bone-infantil.jpg', 0, 100, 29.99, 2, '2022-01-19');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('CNT003', 'Cinto Infantil', 'Cinto de tecido elástico para bebês e crianças', 'cinto-infantil.jpg', 0, 50, 39.99, 2, '2022-01-20');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('LCS004', 'Laço de Cabelo Infantil', 'Laço de cabelo de tecido macio para bebês e meninas', 'laco-de-cabelo-infantil.jpg', 1, 150, 9.99, 2, '2022-01-21');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('FXC005', 'Faixa de Cabelo Infantil', 'Faixa de cabelo elástica para bebês e meninas', 'faixa-de-cabelo-infantil.jpg', 1, 100, 14.99, 2, '2022-01-22');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('CHP006', 'Chapéu Infantil', 'Chapéu com proteção solar para bebês e crianças', 'chapeu-infantil.jpg', 0, 75, 49.99, 2, '2022-01-23');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('LVS007', 'Luva Infantil', 'Luva de tecido macio para bebês e crianças', 'luva-infantil.jpg', 0, 50, 24.99, 2, '2022-01-24');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('GRB008', 'Gravata Borboleta Infantil', 'Gravata borboleta ajustável para bebês e crianças', 'gravata-borboleta-infantil.jpg', 1, 25, 29.99, 2, '2022-01-25');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('OCS009', 'Óculos de Sol Infantil', 'Óculos de sol com proteção UV para bebês e crianças', 'oculos-de-sol-infantil.jpg', 1, 30, 59.99, 2, '2022-01-26');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('BJT010', 'Conjunto de Bijuterias Infantil', 'Conjunto de colar, pulseira e brincos para meninas', 'bijuterias-infantis.jpg', 0, 40, 39.99, 2, '2022-01-27');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('BLS011', 'Bolsa Infantil', 'Bolsa infantil para meninas com alça ajustável', 'bolsa-infantil.jpg', 1, 20, 49.99, 2, '2022-01-28');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('RLG012', 'Relógio de Pulso Infantil', 'Relógio de pulso para crianças com pulseira de borracha', 'relogio-infantil.jpg', 0, 30, 69.99, 2, '2022-01-29');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('ACM013', 'Acessórios de Cabelo para Meninos', 'Conjunto com boné e faixa para meninos', 'acessorios-cabelo-menino.jpg', 1, 50, 39.99, 2, '2022-01-30');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('FXC014', 'Faixa de Cabelo com Flores', 'Faixa de cabelo com flores para bebês e meninas', 'faixa-de-cabelo-com-flores.jpg', 1, 100, 16.99, 2, '2022-01-31');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('FXC015', 'Faixa de Cabelo com Laços', 'Faixa de cabelo com laços para bebês e meninas', 'faixa-de-cabelo-com-lacos.jpg', 1, 75, 14.99, 2, '2022-02-01');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('FXC016', 'Faixa de Cabelo de Personagem', 'Faixa de cabelo com personagens para bebês e meninas', 'faixa-de-cabelo-personagem.jpg', 0, 50, 19.99, 2, '2022-02-02');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('FXC017', 'Faixa de Cabelo de Crochê', 'Faixa de cabelo de crochê para bebês e meninas', 'faixa-de-cabelo-croche.jpg', 1, 30, 12.99, 2, '2022-02-03');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('TCA018', 'Touca de Inverno Infantil', 'Touca de inverno de tecido quente para bebês e crianças', 'touca-inverno-infantil.jpg', 0, 40, 34.99, 2, '2022-02-04');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('ENC019', 'Enfeito de Cabelo com Flores', 'Enfeite de cabelo com flores para bebês e meninas', 'enfeite-cabelo-flores.jpg', 1, 80, 9.99, 2, '2022-02-05');

-- -----------------------------------------------------
-- Roupas de dormir
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('PJM001', 'Pijama de Manga Longa', 'Pijama confortável de manga longa para dormir', 'pijama-manga-longa.jpg', 1, 200, 49.99, 3, '2022-03-01');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('PJM002', 'Pijama de Manga Curta', 'Pijama fresco de manga curta para dormir', 'pijama-manga-curta.jpg', 0, 250, 39.99, 3, '2022-03-02');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('PJM003', 'Pijama de Personagem', 'Pijama com desenhos de personagens famosos', 'pijama-personagem.jpg', 1, 100, 59.99, 3, '2022-03-03');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('CJP004', 'Conjunto de Pijama', 'Conjunto de camiseta e calça para dormir', 'conjunto-pijama.jpg', 1, 150, 69.99, 3, '2022-03-04');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('CMS005', 'Camisola', 'Camisola confortável para dormir', 'camisola.jpg', 0, 50, 79.99, 3, '2022-03-05');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('PTF006', 'Pantufa', 'Pantufa macia para se aquecer durante a noite', 'pantufa.jpg', 1, 75, 29.99, 3, '2022-03-06');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('RBE007', 'Robe', 'Robe de tecido leve para usar por cima do pijama', 'robe.jpg', 1, 40, 89.99, 3, '2022-03-07');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('RPN008', 'Roupão', 'Roupão de banho macio e confortável', 'roupao.jpg', 0, 30, 99.99, 3, '2022-03-08');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('MCD009', 'Macacão de Dormir', 'Macacão confortável de tecido macio para dormir', 'macacao-dormir.jpg', 1, 100, 59.99, 3, '2022-03-09');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('CMP010', 'Camiseta de Pijama', 'Camiseta confortável para dormir', 'camiseta-pijama.jpg', 0, 200, 29.99, 3, '2022-03-10');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('SHD011', 'Shorts de Dormir', 'Shorts fresco de tecido leve para dormir', 'shorts-dormir.jpg', 1, 150, 19.99, 3, '2022-03-11');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('PJO012', 'Pijama de Algodão Orgânico', 'Pijama confortável de algodão orgânico para dormir', 'pijama-algodao-organico.jpg', 1, 50, 79.99, 3, '2022-03-12');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('PJF013', 'Pijama de Flanela', 'Pijama quente de tecido flanelado para dormir', 'pijama-flanela.jpg', 0, 80, 89.99, 3, '2022-03-13');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('PJL014', 'Pijama de Malha', 'Pijama de malha macia e confortável para dormir', 'pijama-malha.jpg', 1, 100, 59.99, 3, '2022-03-14');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('PJF015', 'Pijama de Fleece', 'Pijama quente de tecido fleece para dormir', 'pijama-fleece.jpg', 1, 70, 99.99, 3, '2022-03-15');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('PJS016', 'Pijama de Seda Sintética', 'Pijama elegante de tecido sedoso para dormir', 'pijama-seda-sintetica.jpg', 0, 20, 149.99, 3, '2022-03-16');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('PJA017', 'Pijama Temático de Animais', 'Pijama com desenhos de animais para dormir', 'pijama-tematico-animais.jpg', 1, 90, 49.99, 3, '2022-03-17');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('PJU018', 'Pijama de Unicórnio', 'Pijama com estampa de unicórnio para dormir', 'pijama-unicornio.jpg', 1, 50, 59.99, 3, '2022-03-18');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('PJH019', 'Pijama de Super-Herói', 'Pijama com desenhos de super-heróis para dormir', 'pijama-super-heroi.jpg', 0, 60, 69.99, 3, '2022-03-19');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('PJP020', 'Pijama de Princesa', 'Pijama com desenhos de princesas para dormir', 'pijama-princesa.jpg', 1, 80, 59.99, 3, '2022-03-20');

-- -----------------------------------------------------
-- Roupas de Inverno
-- -----------------------------------------------------

INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('CJL001', 'Casaco de Lã Infantil', 'Casaco quente de lã para crianças no inverno', 'casaco-la-infantil.jpg', 0, 50, 99.99, 4, '2022-03-01');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('JQA002', 'Jaqueta Acolchoada Infantil', 'Jaqueta com enchimento para proteger do frio', 'jaqueta-acolchoada-infantil.jpg', 1, 75, 129.99, 4, '2022-03-02');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('BLA003', 'Blusa de Lã Infantil', 'Blusa quente de lã para usar por baixo das outras peças', 'blusa-la-infantil.jpg', 1, 100, 49.99, 4, '2022-03-03');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('GRS004', 'Gorro de Lã Infantil', 'Gorro quente de lã para proteger a cabeça do frio', 'gorro-la-infantil.jpg', 1, 150, 19.99, 4, '2022-03-04');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('CCH005', 'Cachecol Infantil', 'Cachecol quente para proteger o pescoço do frio', 'cachecol-infantil.jpg', 0, 80, 29.99, 4, '2022-03-05');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('LVI006', 'Luva de Inverno Infantil', 'Luva quente para proteger as mãos do frio', 'luva-inverno-infantil.jpg', 1, 120, 14.99, 4, '2022-03-06');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('CLM007', 'Calça de Moletom Infantil', 'Calça confortável para usar em casa no inverno', 'calca-moletom-infantil.jpg', 0, 200, 39.99, 4, '2022-03-07');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('CJM008', 'Conjunto de Moletom Infantil', 'Conjunto de blusa e calça de moletom para usar em casa no inverno', 'conjunto-moletom-infantil.jpg', 1, 100, 79.99, 4, '2022-03-08');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('BTF009', 'Bota Forrada Infantil', 'Bota com forro quente para proteger os pés do frio', 'bota-forrada-infantil.jpg', 0, 50, 149.99, 4, '2022-03-09');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('MEL010', 'Meia de Lã Infantil', 'Meia quente de lã para proteger os pés do frio', 'meia-la-infantil.jpg', 1, 150, 9.99, 4, '2022-03-10');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('JQC011', 'Jaqueta Corta-vento Infantil', 'Jaqueta resistente ao vento para proteger do frio', 'jaqueta-corta-vento-infantil.jpg', 1, 80, 89.99, 4, '2022-03-11');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('CLN012', 'Calça de Neve Infantil', 'Calça impermeável e quente para usar na neve', 'calca-neve-infantil.jpg', 0, 30, 199.99, 4, '2022-03-12');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('RPT013', 'Roupa Térmica Infantil', 'Conjunto de blusa e calça térmicos para proteger do frio', 'roupa-termica-infantil.jpg', 1, 50, 149.99, 4, '2022-03-13');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('SUE014', 'Suéter Infantil', 'Suéter quente para usar por cima das blusas', 'sueter-infantil.jpg', 1, 90, 69.99, 4, '2022-03-14');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('CPS015', 'Casaco Infantil de Pele Sintética', 'Casaco quente com aparência de pele para proteger do frio', 'casaco-pele-sintetica-infantil.jpg', 0, 40, 129.99, 4, '2022-03-15');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('LGT016', 'Legging Térmica Infantil', 'Legging quente para usar por baixo das calças', 'legging-termica-infantil.jpg', 1, 120, 29.99, 4, '2022-03-16');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('SBT017', 'Sobretudo Infantil', 'Sobretudo longo e quente para proteger do frio', 'sobretudo-infantil.jpg', 1, 60, 149.99, 4, '2022-03-17');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('GOL018', 'Gola de Lã Infantil', 'Gola quente para proteger o pescoço do frio', 'gola-la-infantil.jpg', 1, 100, 24.99, 4, '2022-03-18');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('MCL019', 'Meia-calça de Lã Infantil', 'Meia-calça quente de lã para usar por baixo das calças', 'meia-calca-la-infantil.jpg', 0, 70, 39.99, 4, '2022-03-19');
INSERT INTO product (sku, name, description, image, favorite, units_in_stock, unit_price, category_id, date_created) VALUES
('CPC020', 'Capa de Chuva Infantil', 'Capa impermeável para proteger da chuva', 'capa-chuva-infantil.jpg', 1, 50, 79.99, 4, '2022-03-20');

-- -----------------------------------------------------
-- Endereços
-- -----------------------------------------------------
INSERT INTO tb_address(cep,logradouro,complemento,bairro,localidade,uf, user_id) VALUES ('34001090','Rua Levy Firmino Alves', 'casa A', 'Parque Santo Antônio', 'Nova Lima', 'MG',2);
INSERT INTO tb_address(cep,logradouro,complemento,bairro,localidade,uf, user_id) VALUES ('34012-856','Rua Seis', 'casa B', 'Santa Rita', 'Nova Lima', 'MG',1);

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
INSERT INTO tb_order_item (order_id, product_id, quantity, price) VALUES (1, 3, 1, 1250.0);
INSERT INTO tb_order_item (order_id, product_id, quantity, price) VALUES (2, 3, 1, 1250.0);
INSERT INTO tb_order_item (order_id, product_id, quantity, price) VALUES (3, 1, 1, 90.5);

-- -----------------------------------------------------
-- Instante do Pagamento
-- -----------------------------------------------------
INSERT INTO tb_payment (order_id, moment) VALUES (1, TIMESTAMP WITH TIME ZONE '2022-07-25T15:00:00Z');
INSERT INTO tb_payment (order_id, moment) VALUES (2, TIMESTAMP WITH TIME ZONE '2022-07-30T11:00:00Z');