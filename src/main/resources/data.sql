-- =========================================================
-- Dental Implant Database Management - seed data (5 tables)
-- Order: BRAND, ADMIN, MATERIAL, IMPLANT_MODEL, IMPLANT_SIZE
-- Works on H2 (local) and Cloud SQL MySQL.
-- =========================================================

-- =========================================================
-- 1. BRANDS
-- Store image URLs only in logo_url, NOT HTML <img> tags.
-- =========================================================

INSERT INTO BRAND (brand_name, country, logo_url)
VALUES (
    'Astra Tech',
    'Sweden',
    'https://www.stom-pro-lab.ru/upload/iblock/27c/444z6cf1utt7kq6i128bjqo6yctnycea.png'
);

INSERT INTO BRAND (brand_name, country, logo_url)
VALUES (
    'Dentaurum',
    'Germany',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtV2zbkXRDYivBQ_KgToQh8gyzD4f-8aHPKSBvzv8TnU33OlmT9qKmaBk&s=10'
);

INSERT INTO BRAND (brand_name, country, logo_url)
VALUES (
    'MegaGen',
    'South Korea',
    'https://imegagen.com/tha/wp-content/uploads/sites/26/2019/12/logo.jpg'
);

INSERT INTO BRAND (brand_name, country, logo_url)
VALUES (
    'MIS',
    'Israel',
    'https://no.dental-tribune.com/up/dt/2014/02/MIS.png'
);

INSERT INTO BRAND (brand_name, country, logo_url)
VALUES (
    'Neodent',
    'Brazil',
    'https://images.seeklogo.com/logo-png/59/1/neodent-logo-png_seeklogo-593373.png'
);

INSERT INTO BRAND (brand_name, country, logo_url)
VALUES (
    'NeoBiotech',
    'South Korea',
    'https://static.wixstatic.com/media/30e7e5_db812960f27d40c68f2ccd4b26ac15bb~mv2.png'
);

INSERT INTO BRAND (brand_name, country, logo_url)
VALUES (
    'PRK',
    'Thailand',
    'https://innovation.bb.go.th/image/03020031-956725.jpg'
);

INSERT INTO BRAND (brand_name, country, logo_url)
VALUES (
    'Straumann',
    'Switzerland',
    'https://www.logotypes101.com/logos/280/3BF4A02346A56B1572FB84299FA3538E/Straumann.png'
);

-- 2. ADMIN
INSERT INTO ADMIN (full_name, username, email, password_hash, avatar_link)
VALUES ('Admin User', '@implantadmin', 'admin@implant.com', '123456',
'https://api.dicebear.com/7.x/bottts/svg?seed=Admin1');

-- =========================================================
-- 3. MATERIAL
-- =========================================================
INSERT INTO MATERIAL (material_name) VALUES ('OsseoSpeed Titanium');
INSERT INTO MATERIAL (material_name) VALUES ('Titanium Grade 5 (Ti-6Al-4V)');
INSERT INTO MATERIAL (material_name) VALUES ('Titanium Grade 4 (Commercially Pure Titanium - cp Ti)');
INSERT INTO MATERIAL (material_name) VALUES ('Grade 4 titanium');
INSERT INTO MATERIAL (material_name) VALUES ('Ti-6Al-4V ELI (Grade 23 Titanium Alloy)');
INSERT INTO MATERIAL (material_name) VALUES ('Commercially Pure Titanium Grade 4 / cp Ti Grade 4');
INSERT INTO MATERIAL (material_name) VALUES ('Ti-6Al-4V ELI, Grade 23');
INSERT INTO MATERIAL (material_name) VALUES ('Not specified');
INSERT INTO MATERIAL (material_name) VALUES ('Roxolid');
INSERT INTO MATERIAL (material_name) VALUES ('ZrO2 (Zirconium dioxide ceramic)');

-- =========================================================
-- 4. IMPLANT_MODEL (brand_id and material_id are looked up by name)
-- =========================================================

-- ASTRA TECH
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Astra Tech'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'OsseoSpeed Titanium'),
    'OsseoSpeed EV', 'Bone level', 'Not specified', 'Internal Conical Connection (EV)', 'Visible', '/images/drive-download-20261029T053334Z-1-001/anyridge%20professional%20%204.5x10%20mm%20%281%29.JPG'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Astra Tech'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'OsseoSpeed Titanium'),
    'OsseoSpeed TX', 'Bone level', 'Not specified', 'Internal Conical Connection', 'Visible', '/images/drive-download-20261029T053334Z-1-001/anyridge%20professional%20%204x10%20mm%20%281%29.JPG'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Astra Tech'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'OsseoSpeed Titanium'),
    'OsseoSpeed TX Profile', 'Bone level', 'Not specified', 'Internal Conical Connection', 'Visible', '/images/drive-download-20261029T053334Z-1-001/anyridge%20professional%203.5x10%20mm%20%281%29.JPG'
);

-- DENTAURUM
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Dentaurum'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Titanium Grade 5 (Ti-6Al-4V)'),
    'tioLogic® TWINFIT Implant, Series S (Brown)', 'Bone level', 'Not specified', 'Not specified', 'Visible', '/images/drive-download-20261029T053334Z-1-001/anyridge%20professional%205x10mm%20%281%29.JPG'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Dentaurum'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Titanium Grade 5 (Ti-6Al-4V)'),
    'tioLogic® TWINFIT Implant, Series M (Yellow)', 'Bone level', 'Not specified', 'Not specified', 'Visible', '/images/drive-download-20261029T053334Z-1-001/anyridge%20professional%20fix%203.5x10mm%20%281%29.JPG'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Dentaurum'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Titanium Grade 5 (Ti-6Al-4V)'),
    'tioLogic® TWINFIT Implant, Series L (Red)', 'Bone level', 'Not specified', 'Not specified', 'Visible', '/images/drive-download-20261029T053334Z-1-001/anyridge%20professional%20fix%204.5x10mm%20%281%29.JPG'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Dentaurum'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Titanium Grade 4 (Commercially Pure Titanium - cp Ti)'),
    'tioLogic® TWINFIT Implant, Series XL (Blue)', 'Bone level', 'Not specified', 'Not specified', 'Visible', '/images/drive-download-20261029T053409Z-1-001/super%20line%203.4mm%20x12.0mm.JPG'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Dentaurum'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Titanium Grade 4 (Commercially Pure Titanium - cp Ti)'),
    'tioLogic® TWINFIT Implant, Series XXL (Green)', 'Bone level', 'Not specified', 'Not specified', 'Visible', '/images/drive-download-20261029T053409Z-1-001/superline%203.8mmx12.0mm.JPG'
);

-- MEGAGEN
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'MegaGen'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Grade 4 titanium'),
    'AnyRidge', 'Bone level', 'Not specified', 'Not specified', 'Visible', '/images/drive-download-20261029T053409Z-1-001/superline%204.3mmx12.0mm%20%282%29.JPG'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'MegaGen'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Grade 4 titanium'),
    'AnyOne External', 'Bone level', 'Not specified', 'External', 'Visible', '/images/drive-download-20261029T053409Z-1-001/superline4.8mmx12.0mm.JPG'
);

-- MIS
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'MIS'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Ti-6Al-4V ELI (Grade 23 Titanium Alloy)'),
    'C1', 'Bone level', 'Not specified', 'Conical connection', 'Visible', '/images/drive-download-20261029T053453Z-1-001/Bluediamond%204.1x10%20mm.JPG'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'MIS'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Ti-6Al-4V ELI (Grade 23 Titanium Alloy)'),
    'V3', 'Bone level', 'Not specified', 'Conical connection', 'Visible', '/images/drive-download-20261029T053453Z-1-001/Bluediamond%204.4x10%20mm%20%28deep%29.JPG'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'MIS'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Ti-6Al-4V ELI (Grade 23 Titanium Alloy)'),
    'SEVEN', 'Bone level', 'Not specified', 'Internal Hexagon connection', 'Visible', '/images/drive-download-20261029T053453Z-1-001/Bluediamond%204.4x10%20mm.JPG'
);

-- NEODENT
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Neodent'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Commercially Pure Titanium Grade 4 / cp Ti Grade 4'),
    'Titamax GM', 'Bone level', 'NeoPoros Surface', 'Not specified', 'Visible', '/images/drive-download-20261029T053453Z-1-001/Bluediamond%204.8x10.0%20mm.JPG'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Neodent'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Commercially Pure Titanium Grade 4 / cp Ti Grade 4'),
    'Titamax GM Acqua', 'Bone level', 'Acqua Surface', 'Not specified', 'Visible', '/images/drive-download-20261029T053453Z-1-001/Bluediamond%205.3x10%20mm.JPG'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Neodent'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Commercially Pure Titanium Grade 4 / cp Ti Grade 4'),
    'Drive GM', 'Bone level', 'NeoPoros Surface', 'Not specified', 'Visible', '/images/drive-download-20261029T053334Z-1-001/anyridge%20professional%20%204.5x10%20mm%20%281%29.JPG'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Neodent'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Commercially Pure Titanium Grade 4 / cp Ti Grade 4'),
    'Drive GM Acqua', 'Bone level', 'Acqua Surface', 'Not specified', 'Visible', '/images/drive-download-20261029T053334Z-1-001/anyridge%20professional%20%204x10%20mm%20%281%29.JPG'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Neodent'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Commercially Pure Titanium Grade 4 / cp Ti Grade 4'),
    'Helix GM', 'Bone level', 'NeoPoros Surface', 'Not specified', 'Visible', '/images/drive-download-20261029T053334Z-1-001/anyridge%20professional%203.5x10%20mm%20%281%29.JPG'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Neodent'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Commercially Pure Titanium Grade 4 / cp Ti Grade 4'),
    'Helix GM Acqua', 'Bone level', 'Acqua Surface', 'Not specified', 'Visible', '/images/drive-download-20261029T053334Z-1-001/anyridge%20professional%205x10mm%20%281%29.JPG'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Neodent'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Commercially Pure Titanium Grade 4 / cp Ti Grade 4'),
    'Helix GM Long', 'Bone level', 'NeoPoros Surface', 'Not specified', 'Visible', '/images/drive-download-20261029T053334Z-1-001/anyridge%20professional%20fix%203.5x10mm%20%281%29.JPG'
);

-- NEOBIOTECH
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'NeoBiotech'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Ti-6Al-4V ELI, Grade 23'),
    'S-Narrow', 'Bone level', 'Not specified', 'Not specified', 'Visible', '/images/drive-download-20261029T053334Z-1-001/anyridge%20professional%20fix%204.5x10mm%20%281%29.JPG'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'NeoBiotech'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Ti-6Al-4V ELI, Grade 23'),
    'IS-III Active', 'Bone level', 'Not specified', 'Not specified', 'Visible', '/images/drive-download-20261029T053409Z-1-001/super%20line%203.4mm%20x12.0mm.JPG'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'NeoBiotech'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Ti-6Al-4V ELI, Grade 23'),
    'IS-III Active S-Wide', 'Bone level', 'Not specified', 'Not specified', 'Visible', '/images/drive-download-20261029T053409Z-1-001/superline%203.8mmx12.0mm.JPG'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'NeoBiotech'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Ti-6Al-4V ELI, Grade 23'),
    'S-Mini', 'Bone level', 'Not specified', 'Not specified', 'Visible', '/images/drive-download-20261029T053409Z-1-001/superline%204.3mmx12.0mm%20%282%29.JPG'
);

-- PRK
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'PRK'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Not specified'),
    'PRK Dental Implant (Six Smooth Curve)', 'Not specified', 'Not specified', 'Six Smooth Curve Connection', 'Visible', '/images/drive-download-20261029T053409Z-1-001/superline4.8mmx12.0mm.JPG'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'PRK'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Not specified'),
    'PRK Dental Implant (Hexagonal)', 'Not specified', 'Not specified', 'Hexagonal Connection', 'Visible', '/images/drive-download-20261029T053453Z-1-001/Bluediamond%204.1x10%20mm.JPG'
);

-- STRAUMANN
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Straumann'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Roxolid'),
    'Mini Implant', 'Tissue level', 'Not specified', 'Not specified', 'Visible', '/images/drive-download-20261029T053453Z-1-001/Bluediamond%204.4x10%20mm%20%28deep%29.JPG'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Straumann'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'ZrO2 (Zirconium dioxide ceramic)'),
    'PURE Ceramic Implant Monotype', 'Tissue level / Bone level', 'Not specified', 'Not specified', 'Visible', '/images/drive-download-20261029T053453Z-1-001/Bluediamond%204.4x10%20mm.JPG'
);

-- =========================================================
-- 5. IMPLANT_SIZE (one statement per model)
-- =========================================================

-- ASTRA TECH
INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm)
SELECT m.model_id, v.d, v.l
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 3.00 AS d, 8.0 AS l
    UNION ALL SELECT 3.00, 9.0
    UNION ALL SELECT 3.00, 11.0
    UNION ALL SELECT 3.00, 13.0
    UNION ALL SELECT 3.00, 15.0
    UNION ALL SELECT 3.60, 6.0
    UNION ALL SELECT 3.60, 8.0
    UNION ALL SELECT 3.60, 9.0
    UNION ALL SELECT 3.60, 11.0
    UNION ALL SELECT 3.60, 13.0
    UNION ALL SELECT 3.60, 15.0
    UNION ALL SELECT 3.60, 17.0
    UNION ALL SELECT 4.20, 6.0
    UNION ALL SELECT 4.20, 8.0
    UNION ALL SELECT 4.20, 9.0
    UNION ALL SELECT 4.20, 11.0
    UNION ALL SELECT 4.20, 13.0
    UNION ALL SELECT 4.20, 15.0
    UNION ALL SELECT 4.20, 17.0
    UNION ALL SELECT 4.80, 6.0
    UNION ALL SELECT 4.80, 8.0
    UNION ALL SELECT 4.80, 9.0
    UNION ALL SELECT 4.80, 11.0
    UNION ALL SELECT 4.80, 13.0
    UNION ALL SELECT 4.80, 15.0
    UNION ALL SELECT 4.80, 17.0
    UNION ALL SELECT 5.40, 6.0
    UNION ALL SELECT 5.40, 8.0
    UNION ALL SELECT 5.40, 9.0
    UNION ALL SELECT 5.40, 11.0
    UNION ALL SELECT 5.40, 13.0
    UNION ALL SELECT 5.40, 15.0
) v
WHERE b.brand_name = 'Astra Tech' AND m.model_name = 'OsseoSpeed EV';

INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm)
SELECT m.model_id, v.d, v.l
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 3.00 AS d, 11.0 AS l
    UNION ALL SELECT 3.00, 13.0
    UNION ALL SELECT 3.00, 15.0
    UNION ALL SELECT 3.50, 8.0
    UNION ALL SELECT 3.50, 9.0
    UNION ALL SELECT 3.50, 11.0
    UNION ALL SELECT 3.50, 13.0
    UNION ALL SELECT 3.50, 15.0
    UNION ALL SELECT 3.50, 17.0
    UNION ALL SELECT 4.00, 6.0
    UNION ALL SELECT 4.00, 8.0
    UNION ALL SELECT 4.00, 9.0
    UNION ALL SELECT 4.00, 11.0
    UNION ALL SELECT 4.00, 13.0
    UNION ALL SELECT 4.00, 15.0
    UNION ALL SELECT 4.00, 17.0
    UNION ALL SELECT 5.00, 9.0
    UNION ALL SELECT 5.00, 11.0
    UNION ALL SELECT 5.00, 13.0
    UNION ALL SELECT 5.00, 15.0
    UNION ALL SELECT 5.00, 17.0
) v
WHERE b.brand_name = 'Astra Tech' AND m.model_name = 'OsseoSpeed TX';

INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm)
SELECT m.model_id, v.d, v.l
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 4.50 AS d, 9.0 AS l
    UNION ALL SELECT 4.50, 11.0
    UNION ALL SELECT 4.50, 13.0
    UNION ALL SELECT 4.50, 15.0
    UNION ALL SELECT 4.50, 17.0
    UNION ALL SELECT 5.00, 9.0
    UNION ALL SELECT 5.00, 11.0
    UNION ALL SELECT 5.00, 13.0
    UNION ALL SELECT 5.00, 15.0
    UNION ALL SELECT 5.00, 17.0
) v
WHERE b.brand_name = 'Astra Tech' AND m.model_name = 'OsseoSpeed TX Profile';


-- DENTAURUM
INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm)
SELECT m.model_id, v.d, v.l
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 3.30 AS d, 7.0 AS l
    UNION ALL SELECT 3.30, 9.0
    UNION ALL SELECT 3.30, 11.0
    UNION ALL SELECT 3.30, 13.0
    UNION ALL SELECT 3.30, 15.0
) v
WHERE b.brand_name = 'Dentaurum' AND m.model_name = 'tioLogic® TWINFIT Implant, Series S (Brown)';

INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm)
SELECT m.model_id, v.d, v.l
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 3.70 AS d, 7.0 AS l
    UNION ALL SELECT 3.70, 9.0
    UNION ALL SELECT 3.70, 11.0
    UNION ALL SELECT 3.70, 13.0
    UNION ALL SELECT 3.70, 15.0
) v
WHERE b.brand_name = 'Dentaurum' AND m.model_name = 'tioLogic® TWINFIT Implant, Series M (Yellow)';

INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm)
SELECT m.model_id, v.d, v.l
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 4.20 AS d, 7.0 AS l
    UNION ALL SELECT 4.20, 9.0
    UNION ALL SELECT 4.20, 11.0
    UNION ALL SELECT 4.20, 13.0
    UNION ALL SELECT 4.20, 15.0
) v
WHERE b.brand_name = 'Dentaurum' AND m.model_name = 'tioLogic® TWINFIT Implant, Series L (Red)';

INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm)
SELECT m.model_id, v.d, v.l
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 4.80 AS d, 7.0 AS l
    UNION ALL SELECT 4.80, 9.0
    UNION ALL SELECT 4.80, 11.0
    UNION ALL SELECT 4.80, 13.0
    UNION ALL SELECT 4.80, 15.0
) v
WHERE b.brand_name = 'Dentaurum' AND m.model_name = 'tioLogic® TWINFIT Implant, Series XL (Blue)';

INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm)
SELECT m.model_id, v.d, v.l
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 5.50 AS d, 7.0 AS l
    UNION ALL SELECT 5.50, 9.0
    UNION ALL SELECT 5.50, 11.0
    UNION ALL SELECT 5.50, 13.0
    UNION ALL SELECT 5.50, 15.0
) v
WHERE b.brand_name = 'Dentaurum' AND m.model_name = 'tioLogic® TWINFIT Implant, Series XXL (Green)';


-- MEGAGEN
INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm)
SELECT m.model_id, v.d, v.l
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 3.30 AS d, 7.0 AS l
    UNION ALL SELECT 4.00, 7.0
    UNION ALL SELECT 4.50, 7.0
    UNION ALL SELECT 5.00, 7.0
    UNION ALL SELECT 5.50, 7.0
    UNION ALL SELECT 7.50, 7.0
    UNION ALL SELECT 7.50, 8.5
    UNION ALL SELECT 7.50, 10.0
    UNION ALL SELECT 7.50, 11.5
    UNION ALL SELECT 7.50, 13.0
    UNION ALL SELECT 8.00, 7.0
    UNION ALL SELECT 8.00, 8.5
    UNION ALL SELECT 8.00, 10.0
    UNION ALL SELECT 8.00, 11.5
    UNION ALL SELECT 8.00, 13.0
) v
WHERE b.brand_name = 'MegaGen' AND m.model_name = 'AnyRidge';

INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm)
SELECT m.model_id, v.d, v.l
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 3.50 AS d, 7.0 AS l
    UNION ALL SELECT 3.50, 8.0
    UNION ALL SELECT 3.50, 9.0
    UNION ALL SELECT 3.50, 10.0
    UNION ALL SELECT 3.50, 11.0
    UNION ALL SELECT 3.50, 12.0
    UNION ALL SELECT 3.50, 13.0
    UNION ALL SELECT 3.50, 14.0
    UNION ALL SELECT 3.50, 15.0
    UNION ALL SELECT 4.00, 7.0
    UNION ALL SELECT 4.00, 8.0
    UNION ALL SELECT 4.00, 9.0
    UNION ALL SELECT 4.00, 10.0
    UNION ALL SELECT 4.00, 11.0
    UNION ALL SELECT 4.00, 12.0
    UNION ALL SELECT 4.00, 13.0
    UNION ALL SELECT 4.00, 14.0
    UNION ALL SELECT 4.00, 15.0
    UNION ALL SELECT 4.50, 7.0
    UNION ALL SELECT 4.50, 8.0
    UNION ALL SELECT 4.50, 9.0
    UNION ALL SELECT 4.50, 10.0
    UNION ALL SELECT 4.50, 11.0
    UNION ALL SELECT 4.50, 12.0
    UNION ALL SELECT 4.50, 13.0
    UNION ALL SELECT 4.50, 14.0
    UNION ALL SELECT 4.50, 15.0
    UNION ALL SELECT 5.00, 7.0
    UNION ALL SELECT 5.00, 9.0
    UNION ALL SELECT 5.00, 10.0
    UNION ALL SELECT 5.00, 11.0
    UNION ALL SELECT 5.00, 12.0
    UNION ALL SELECT 5.00, 13.0
    UNION ALL SELECT 5.00, 14.0
    UNION ALL SELECT 5.00, 15.0
    UNION ALL SELECT 6.00, 7.0
    UNION ALL SELECT 6.00, 8.0
    UNION ALL SELECT 6.00, 9.0
    UNION ALL SELECT 6.00, 10.0
    UNION ALL SELECT 6.00, 11.0
    UNION ALL SELECT 6.00, 12.0
    UNION ALL SELECT 6.00, 13.0
    UNION ALL SELECT 6.00, 14.0
    UNION ALL SELECT 6.00, 15.0
) v
WHERE b.brand_name = 'MegaGen' AND m.model_name = 'AnyOne External';


-- MIS
INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm)
SELECT m.model_id, v.d, v.l
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 3.30 AS d, 10.0 AS l
    UNION ALL SELECT 3.30, 11.5
    UNION ALL SELECT 3.30, 13.0
    UNION ALL SELECT 3.30, 16.0
    UNION ALL SELECT 3.75, 8.0
    UNION ALL SELECT 3.75, 10.0
    UNION ALL SELECT 3.75, 11.5
    UNION ALL SELECT 3.75, 13.0
    UNION ALL SELECT 3.75, 16.0
    UNION ALL SELECT 4.20, 8.0
    UNION ALL SELECT 4.20, 10.0
    UNION ALL SELECT 4.20, 11.5
    UNION ALL SELECT 4.20, 13.0
    UNION ALL SELECT 4.20, 16.0
) v
WHERE b.brand_name = 'MIS' AND m.model_name = 'C1';

INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm)
SELECT m.model_id, v.d, v.l
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 3.30 AS d, 10.0 AS l
    UNION ALL SELECT 3.30, 11.5
    UNION ALL SELECT 3.30, 13.0
    UNION ALL SELECT 3.30, 16.0
    UNION ALL SELECT 3.90, 8.0
    UNION ALL SELECT 3.90, 10.0
    UNION ALL SELECT 3.90, 11.5
    UNION ALL SELECT 3.90, 13.0
    UNION ALL SELECT 3.90, 16.0
    UNION ALL SELECT 4.30, 8.0
    UNION ALL SELECT 4.30, 10.0
    UNION ALL SELECT 4.30, 11.5
    UNION ALL SELECT 4.30, 13.0
    UNION ALL SELECT 4.30, 16.0
    UNION ALL SELECT 5.00, 8.0
    UNION ALL SELECT 5.00, 10.0
    UNION ALL SELECT 5.00, 11.5
    UNION ALL SELECT 5.00, 13.0
    UNION ALL SELECT 5.00, 16.0
) v
WHERE b.brand_name = 'MIS' AND m.model_name = 'V3';

INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm)
SELECT m.model_id, v.d, v.l
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 3.75 AS d, 8.0 AS l
    UNION ALL SELECT 3.75, 10.0
    UNION ALL SELECT 3.75, 11.5
    UNION ALL SELECT 3.75, 13.0
    UNION ALL SELECT 3.75, 16.0
    UNION ALL SELECT 4.20, 6.0
    UNION ALL SELECT 4.20, 8.0
    UNION ALL SELECT 4.20, 10.0
    UNION ALL SELECT 4.20, 13.0
    UNION ALL SELECT 4.20, 16.0
) v
WHERE b.brand_name = 'MIS' AND m.model_name = 'SEVEN';


-- NEODENT
INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm)
SELECT m.model_id, v.d, v.l
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 3.50 AS d, 7.0 AS l
    UNION ALL SELECT 3.50, 8.0
    UNION ALL SELECT 3.50, 9.0
    UNION ALL SELECT 3.50, 11.0
    UNION ALL SELECT 3.50, 13.0
    UNION ALL SELECT 3.50, 15.0
    UNION ALL SELECT 3.50, 17.0
    UNION ALL SELECT 3.75, 7.0
    UNION ALL SELECT 3.75, 8.0
    UNION ALL SELECT 3.75, 9.0
    UNION ALL SELECT 3.75, 11.0
    UNION ALL SELECT 3.75, 13.0
    UNION ALL SELECT 3.75, 15.0
    UNION ALL SELECT 3.75, 17.0
    UNION ALL SELECT 4.00, 7.0
    UNION ALL SELECT 4.00, 8.0
    UNION ALL SELECT 4.00, 9.0
    UNION ALL SELECT 4.00, 11.0
    UNION ALL SELECT 4.00, 13.0
    UNION ALL SELECT 4.00, 15.0
    UNION ALL SELECT 4.00, 17.0
    UNION ALL SELECT 5.00, 7.0
    UNION ALL SELECT 5.00, 8.0
    UNION ALL SELECT 5.00, 9.0
    UNION ALL SELECT 5.00, 11.0
    UNION ALL SELECT 5.00, 13.0
) v
WHERE b.brand_name = 'Neodent' AND m.model_name = 'Titamax GM';

INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm)
SELECT m.model_id, v.d, v.l
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 3.50 AS d, 7.0 AS l
    UNION ALL SELECT 3.50, 8.0
    UNION ALL SELECT 3.50, 9.0
    UNION ALL SELECT 3.50, 11.0
    UNION ALL SELECT 3.50, 13.0
    UNION ALL SELECT 3.50, 15.0
    UNION ALL SELECT 3.50, 17.0
    UNION ALL SELECT 3.75, 7.0
    UNION ALL SELECT 3.75, 8.0
    UNION ALL SELECT 3.75, 9.0
    UNION ALL SELECT 3.75, 11.0
    UNION ALL SELECT 3.75, 13.0
    UNION ALL SELECT 3.75, 15.0
    UNION ALL SELECT 3.75, 17.0
    UNION ALL SELECT 4.00, 7.0
    UNION ALL SELECT 4.00, 8.0
    UNION ALL SELECT 4.00, 9.0
    UNION ALL SELECT 4.00, 11.0
    UNION ALL SELECT 4.00, 13.0
    UNION ALL SELECT 4.00, 15.0
    UNION ALL SELECT 4.00, 17.0
    UNION ALL SELECT 5.00, 7.0
    UNION ALL SELECT 5.00, 8.0
    UNION ALL SELECT 5.00, 9.0
    UNION ALL SELECT 5.00, 11.0
    UNION ALL SELECT 5.00, 13.0
) v
WHERE b.brand_name = 'Neodent' AND m.model_name = 'Titamax GM Acqua';

INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm)
SELECT m.model_id, v.d, v.l
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 3.50 AS d, 8.0 AS l
    UNION ALL SELECT 3.50, 10.0
    UNION ALL SELECT 3.50, 11.5
    UNION ALL SELECT 3.50, 13.0
    UNION ALL SELECT 3.50, 16.0
    UNION ALL SELECT 3.50, 18.0
    UNION ALL SELECT 4.30, 8.0
    UNION ALL SELECT 4.30, 10.0
    UNION ALL SELECT 4.30, 11.5
    UNION ALL SELECT 4.30, 13.0
    UNION ALL SELECT 4.30, 16.0
    UNION ALL SELECT 4.30, 18.0
    UNION ALL SELECT 5.00, 8.0
    UNION ALL SELECT 5.00, 10.0
    UNION ALL SELECT 5.00, 11.5
    UNION ALL SELECT 5.00, 13.0
    UNION ALL SELECT 5.00, 16.0
    UNION ALL SELECT 5.00, 18.0
) v
WHERE b.brand_name = 'Neodent' AND m.model_name = 'Drive GM';

INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm)
SELECT m.model_id, v.d, v.l
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 3.50 AS d, 8.0 AS l
    UNION ALL SELECT 3.50, 10.0
    UNION ALL SELECT 3.50, 11.5
    UNION ALL SELECT 3.50, 13.0
    UNION ALL SELECT 3.50, 16.0
    UNION ALL SELECT 3.50, 18.0
    UNION ALL SELECT 4.30, 8.0
    UNION ALL SELECT 4.30, 10.0
    UNION ALL SELECT 4.30, 11.5
    UNION ALL SELECT 4.30, 13.0
    UNION ALL SELECT 4.30, 16.0
    UNION ALL SELECT 4.30, 18.0
    UNION ALL SELECT 5.00, 8.0
    UNION ALL SELECT 5.00, 10.0
    UNION ALL SELECT 5.00, 11.5
    UNION ALL SELECT 5.00, 13.0
    UNION ALL SELECT 5.00, 16.0
    UNION ALL SELECT 5.00, 18.0
) v
WHERE b.brand_name = 'Neodent' AND m.model_name = 'Drive GM Acqua';

INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm)
SELECT m.model_id, v.d, v.l
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 3.50 AS d, 8.0 AS l
    UNION ALL SELECT 3.50, 10.0
    UNION ALL SELECT 3.50, 11.5
    UNION ALL SELECT 3.50, 13.0
    UNION ALL SELECT 3.50, 16.0
    UNION ALL SELECT 3.50, 18.0
    UNION ALL SELECT 3.75, 8.0
    UNION ALL SELECT 3.75, 10.0
    UNION ALL SELECT 3.75, 11.5
    UNION ALL SELECT 3.75, 13.0
    UNION ALL SELECT 3.75, 16.0
    UNION ALL SELECT 3.75, 18.0
    UNION ALL SELECT 4.00, 8.0
    UNION ALL SELECT 4.00, 10.0
    UNION ALL SELECT 4.00, 11.5
    UNION ALL SELECT 4.00, 13.0
    UNION ALL SELECT 4.00, 16.0
    UNION ALL SELECT 4.00, 18.0
    UNION ALL SELECT 4.30, 8.0
    UNION ALL SELECT 4.30, 10.0
    UNION ALL SELECT 4.30, 11.5
    UNION ALL SELECT 4.30, 13.0
    UNION ALL SELECT 4.30, 16.0
    UNION ALL SELECT 4.30, 18.0
    UNION ALL SELECT 5.00, 8.0
    UNION ALL SELECT 5.00, 10.0
    UNION ALL SELECT 5.00, 11.5
    UNION ALL SELECT 5.00, 13.0
    UNION ALL SELECT 5.00, 16.0
    UNION ALL SELECT 5.00, 18.0
    UNION ALL SELECT 6.00, 8.0
    UNION ALL SELECT 6.00, 10.0
    UNION ALL SELECT 6.00, 11.5
    UNION ALL SELECT 6.00, 13.0
    UNION ALL SELECT 7.00, 8.0
    UNION ALL SELECT 7.00, 10.0
    UNION ALL SELECT 7.00, 11.5
    UNION ALL SELECT 7.00, 13.0
) v
WHERE b.brand_name = 'Neodent' AND m.model_name = 'Helix GM';

INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm)
SELECT m.model_id, v.d, v.l
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 3.50 AS d, 8.0 AS l
    UNION ALL SELECT 3.50, 10.0
    UNION ALL SELECT 3.50, 11.5
    UNION ALL SELECT 3.50, 13.0
    UNION ALL SELECT 3.50, 16.0
    UNION ALL SELECT 3.50, 18.0
    UNION ALL SELECT 3.75, 8.0
    UNION ALL SELECT 3.75, 10.0
    UNION ALL SELECT 3.75, 11.5
    UNION ALL SELECT 3.75, 13.0
    UNION ALL SELECT 3.75, 16.0
    UNION ALL SELECT 3.75, 18.0
    UNION ALL SELECT 4.00, 8.0
    UNION ALL SELECT 4.00, 10.0
    UNION ALL SELECT 4.00, 11.5
    UNION ALL SELECT 4.00, 13.0
    UNION ALL SELECT 4.00, 16.0
    UNION ALL SELECT 4.00, 18.0
    UNION ALL SELECT 4.30, 8.0
    UNION ALL SELECT 4.30, 10.0
    UNION ALL SELECT 4.30, 11.5
    UNION ALL SELECT 4.30, 13.0
    UNION ALL SELECT 4.30, 16.0
    UNION ALL SELECT 4.30, 18.0
    UNION ALL SELECT 5.00, 8.0
    UNION ALL SELECT 5.00, 10.0
    UNION ALL SELECT 5.00, 11.5
    UNION ALL SELECT 5.00, 13.0
    UNION ALL SELECT 5.00, 16.0
    UNION ALL SELECT 5.00, 18.0
    UNION ALL SELECT 6.00, 8.0
    UNION ALL SELECT 6.00, 10.0
    UNION ALL SELECT 6.00, 11.5
    UNION ALL SELECT 6.00, 13.0
    UNION ALL SELECT 7.00, 8.0
    UNION ALL SELECT 7.00, 10.0
    UNION ALL SELECT 7.00, 11.5
    UNION ALL SELECT 7.00, 13.0
) v
WHERE b.brand_name = 'Neodent' AND m.model_name = 'Helix GM Acqua';

INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm)
SELECT m.model_id, v.d, v.l
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 3.75 AS d, 20.0 AS l
    UNION ALL SELECT 3.75, 22.5
    UNION ALL SELECT 3.75, 25.0
    UNION ALL SELECT 4.00, 20.0
    UNION ALL SELECT 4.00, 22.5
    UNION ALL SELECT 4.00, 25.0
) v
WHERE b.brand_name = 'Neodent' AND m.model_name = 'Helix GM Long';


-- NEOBIOTECH
INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm)
SELECT m.model_id, v.d, v.l
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 3.20 AS d, 8.5 AS l
    UNION ALL SELECT 3.20, 10.0
    UNION ALL SELECT 3.20, 11.5
    UNION ALL SELECT 3.20, 13.0
) v
WHERE b.brand_name = 'NeoBiotech' AND m.model_name = 'S-Narrow';

INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm)
SELECT m.model_id, v.d, v.l
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 3.50 AS d, 8.5 AS l
    UNION ALL SELECT 3.50, 10.0
    UNION ALL SELECT 3.50, 11.5
    UNION ALL SELECT 3.50, 13.0
    UNION ALL SELECT 4.00, 7.3
    UNION ALL SELECT 4.00, 8.5
    UNION ALL SELECT 4.00, 10.0
    UNION ALL SELECT 4.00, 11.5
    UNION ALL SELECT 4.00, 13.0
    UNION ALL SELECT 4.50, 7.3
    UNION ALL SELECT 4.50, 8.5
    UNION ALL SELECT 4.50, 10.0
    UNION ALL SELECT 4.50, 11.5
    UNION ALL SELECT 4.50, 13.0
    UNION ALL SELECT 5.00, 7.3
    UNION ALL SELECT 5.00, 8.5
    UNION ALL SELECT 5.00, 10.0
    UNION ALL SELECT 5.00, 11.5
    UNION ALL SELECT 5.00, 13.0
) v
WHERE b.brand_name = 'NeoBiotech' AND m.model_name = 'IS-III Active';

INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm)
SELECT m.model_id, v.d, v.l
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 5.50 AS d, 7.3 AS l
    UNION ALL SELECT 5.50, 8.5
    UNION ALL SELECT 5.50, 10.0
    UNION ALL SELECT 5.50, 11.5
    UNION ALL SELECT 5.50, 13.0
    UNION ALL SELECT 6.00, 7.3
    UNION ALL SELECT 6.00, 8.5
    UNION ALL SELECT 6.00, 10.0
    UNION ALL SELECT 6.00, 11.5
    UNION ALL SELECT 6.00, 13.0
    UNION ALL SELECT 7.00, 7.3
    UNION ALL SELECT 7.00, 8.5
    UNION ALL SELECT 7.00, 10.0
    UNION ALL SELECT 7.00, 11.5
    UNION ALL SELECT 7.00, 13.0
) v
WHERE b.brand_name = 'NeoBiotech' AND m.model_name = 'IS-III Active S-Wide';

INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm)
SELECT m.model_id, v.d, v.l
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 2.00 AS d, 8.5 AS l
    UNION ALL SELECT 2.00, 10.0
    UNION ALL SELECT 2.00, 11.5
    UNION ALL SELECT 2.00, 13.0
    UNION ALL SELECT 2.00, 15.0
    UNION ALL SELECT 2.50, 8.0
    UNION ALL SELECT 2.50, 10.0
    UNION ALL SELECT 2.50, 11.0
    UNION ALL SELECT 2.50, 13.0
    UNION ALL SELECT 2.50, 15.0
    UNION ALL SELECT 3.00, 8.0
    UNION ALL SELECT 3.00, 10.0
    UNION ALL SELECT 3.00, 11.0
    UNION ALL SELECT 3.00, 13.0
    UNION ALL SELECT 3.00, 15.0
    UNION ALL SELECT 3.50, 8.0
    UNION ALL SELECT 3.50, 10.0
    UNION ALL SELECT 3.50, 11.0
    UNION ALL SELECT 3.50, 13.0
    UNION ALL SELECT 3.50, 15.0
) v
WHERE b.brand_name = 'NeoBiotech' AND m.model_name = 'S-Mini';


-- PRK
INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm)
SELECT m.model_id, v.d, v.l
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 3.40 AS d, 10.0 AS l
    UNION ALL SELECT 3.40, 12.0
    UNION ALL SELECT 3.40, 14.0
    UNION ALL SELECT 3.80, 8.0
    UNION ALL SELECT 3.80, 10.0
    UNION ALL SELECT 3.80, 12.0
    UNION ALL SELECT 3.80, 14.0
    UNION ALL SELECT 4.20, 8.0
    UNION ALL SELECT 4.20, 10.0
    UNION ALL SELECT 4.20, 12.0
    UNION ALL SELECT 4.20, 14.0
    UNION ALL SELECT 5.00, 8.0
    UNION ALL SELECT 5.00, 10.0
    UNION ALL SELECT 5.00, 12.0
    UNION ALL SELECT 5.00, 14.0
) v
WHERE b.brand_name = 'PRK' AND m.model_name = 'PRK Dental Implant (Six Smooth Curve)';

INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm)
SELECT m.model_id, v.d, v.l
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 3.40 AS d, 10.0 AS l
    UNION ALL SELECT 3.40, 12.0
    UNION ALL SELECT 3.40, 14.0
    UNION ALL SELECT 3.80, 8.0
    UNION ALL SELECT 3.80, 10.0
    UNION ALL SELECT 3.80, 12.0
    UNION ALL SELECT 3.80, 14.0
    UNION ALL SELECT 4.20, 8.0
    UNION ALL SELECT 4.20, 10.0
    UNION ALL SELECT 4.20, 12.0
    UNION ALL SELECT 4.20, 14.0
    UNION ALL SELECT 5.00, 8.0
    UNION ALL SELECT 5.00, 10.0
    UNION ALL SELECT 5.00, 12.0
    UNION ALL SELECT 5.00, 14.0
) v
WHERE b.brand_name = 'PRK' AND m.model_name = 'PRK Dental Implant (Hexagonal)';


-- STRAUMANN
INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm)
SELECT m.model_id, v.d, v.l
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 2.40 AS d, 10.0 AS l
    UNION ALL SELECT 2.40, 12.0
    UNION ALL SELECT 2.40, 14.0
) v
WHERE b.brand_name = 'Straumann' AND m.model_name = 'Mini Implant';

INSERT INTO IMPLANT_SIZE (model_id, diameter_mm, length_mm, variant_note)
SELECT m.model_id, v.d, v.l, v.n
FROM IMPLANT_MODEL m
JOIN BRAND b ON b.brand_id = m.brand_id
CROSS JOIN (
    SELECT 3.30 AS d, 8.0 AS l, 'Tissue level, AH 4' AS n
    UNION ALL SELECT 3.30, 10.0, 'Tissue level, AH 4'
    UNION ALL SELECT 3.30, 12.0, 'Tissue level, AH 4'
    UNION ALL SELECT 3.30, 14.0, 'Tissue level, AH 4'
    UNION ALL SELECT 4.10, 8.0, 'Bone level'
    UNION ALL SELECT 4.10, 10.0, 'Bone level'
    UNION ALL SELECT 4.10, 12.0, 'Bone level'
    UNION ALL SELECT 4.10, 14.0, 'Bone level'
) v
WHERE b.brand_name = 'Straumann' AND m.model_name = 'PURE Ceramic Implant Monotype';