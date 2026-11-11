-- =========================================================
-- Dental Implant Database Management - seed data (5 tables)
-- Order: BRAND, ADMIN, MATERIAL, IMPLANT_MODEL, IMPLANT_SIZE
-- Works on H2 (local) and Cloud SQL MySQL.
-- =========================================================

-- =========================================================
-- 1. BRANDS
-- Store image URLs only in logo_url, NOT HTML <img> tags.
-- โลโก้ใช้ไฟล์ใน static/images (ช่องว่างในชื่อไฟล์เขียนเป็น %20)
-- =========================================================

INSERT INTO BRAND (brand_name, country, logo_url)
VALUES (
    'Astra Tech',
    'Sweden',
    '/images/logo%20astratech.png'
);

INSERT INTO BRAND (brand_name, country, logo_url)
VALUES (
    'Dentaurum',
    'Germany',
    '/images/logo%20dentaurum.png'
);

INSERT INTO BRAND (brand_name, country, logo_url)
VALUES (
    'MegaGen',
    'South Korea',
    '/images/logo%20megagen.png'
);

INSERT INTO BRAND (brand_name, country, logo_url)
VALUES (
    'MIS',
    'Israel',
    '/images/logo%20mis.png'
);

INSERT INTO BRAND (brand_name, country, logo_url)
VALUES (
    'Neodent',
    'Brazil',
    '/images/logo%20neodent.png'
);

INSERT INTO BRAND (brand_name, country, logo_url)
VALUES (
    'NeoBiotech',
    'South Korea',
    '/images/logo%20neo%20biotech.png'
);

INSERT INTO BRAND (brand_name, country, logo_url)
VALUES (
    'PRK',
    'Thailand',
    '/images/logo%20prk.png'
);

INSERT INTO BRAND (brand_name, country, logo_url)
VALUES (
    'Straumann',
    'Switzerland',
    '/images/logo%20straumann.png'
);

-- 2. ADMIN
INSERT INTO ADMIN (full_name, username, email, password_hash, avatar_link)
VALUES ('Admin User', '@implantadmin', 'admin@implant.com', '123456',
'/images/avatars/avatar1.png');
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
    'OsseoSpeed EV', 'Bone level', 'Not specified', 'Internal Conical Connection (EV)', 'Visible', '/images/implant/anyridge%20professional%20%204.5x10%20mm%20%281%29_edit_500417377223442.jpg'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Astra Tech'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'OsseoSpeed Titanium'),
    'OsseoSpeed TX', 'Bone level', 'Not specified', 'Internal Conical Connection', 'Visible', '/images/implant/anyridge%20professional%20%204x10%20mm%20%281%29_edit_500445608607444.jpg'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Astra Tech'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'OsseoSpeed Titanium'),
    'OsseoSpeed TX Profile', 'Bone level', 'Not specified', 'Internal Conical Connection', 'Visible', '/images/implant/anyridge%20professional%203.5x10%20mm%20%281%29_edit_500460790791983.jpg'
);

-- DENTAURUM
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Dentaurum'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Titanium Grade 5 (Ti-6Al-4V)'),
    'tioLogic® TWINFIT Implant, Series S (Brown)', 'Bone level', 'Not specified', 'Not specified', 'Visible', '/images/implant/anyridge%20professional%205x10mm%20%281%29_edit_500494873587677.jpg'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Dentaurum'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Titanium Grade 5 (Ti-6Al-4V)'),
    'tioLogic® TWINFIT Implant, Series M (Yellow)', 'Bone level', 'Not specified', 'Not specified', 'Visible', '/images/implant/anyridge%20professional%20fix%203.5x10mm%20%281%29_edit_500511094229525.jpg'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Dentaurum'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Titanium Grade 5 (Ti-6Al-4V)'),
    'tioLogic® TWINFIT Implant, Series L (Red)', 'Bone level', 'Not specified', 'Not specified', 'Visible', '/images/implant/anyridge%20professional%20fix%204.5x10mm%20%281%29_edit_500523085260371.jpg'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Dentaurum'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Titanium Grade 4 (Commercially Pure Titanium - cp Ti)'),
    'tioLogic® TWINFIT Implant, Series XL (Blue)', 'Bone level', 'Not specified', 'Not specified', 'Visible', '/images/implant/super%20line%203.4mm%20x12.0mm_edit_500626504297839.jpg'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Dentaurum'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Titanium Grade 4 (Commercially Pure Titanium - cp Ti)'),
    'tioLogic® TWINFIT Implant, Series XXL (Green)', 'Bone level', 'Not specified', 'Not specified', 'Visible', '/images/implant/superline%203.8mmx12.0mm_edit_500649737953225.jpg'
);

-- MEGAGEN
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'MegaGen'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Grade 4 titanium'),
    'AnyRidge', 'Bone level', 'Not specified', 'Not specified', 'Visible', '/images/implant/superline%204.3mmx12.0mm%20%282%29_edit_500688782010151.jpg'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'MegaGen'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Grade 4 titanium'),
    'AnyOne External', 'Bone level', 'Not specified', 'External', 'Visible', '/images/implant/superline4.8mmx12.0mm_edit_500701017639690.jpg'
);

-- MIS
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'MIS'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Ti-6Al-4V ELI (Grade 23 Titanium Alloy)'),
    'C1', 'Bone level', 'Not specified', 'Conical connection', 'Visible', '/images/implant/Bluediamond%204.1x10%20mm_edit_500540960383142.jpg'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'MIS'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Ti-6Al-4V ELI (Grade 23 Titanium Alloy)'),
    'V3', 'Bone level', 'Not specified', 'Conical connection', 'Visible', '/images/implant/Bluediamond%204.4x10%20mm%20%28deep%29_edit_500556274200296.jpg'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'MIS'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Ti-6Al-4V ELI (Grade 23 Titanium Alloy)'),
    'SEVEN', 'Bone level', 'Not specified', 'Internal Hexagon connection', 'Visible', '/images/implant/Bluediamond%204.4x10%20mm_edit_500606282765223.jpg'
);

-- NEODENT
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Neodent'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Commercially Pure Titanium Grade 4 / cp Ti Grade 4'),
    'Titamax GM', 'Bone level', 'NeoPoros Surface', 'Not specified', 'Visible', '/images/implant/Bluediamond%204.8x10.0%20mm_edit_500577235468990.jpg'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Neodent'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Commercially Pure Titanium Grade 4 / cp Ti Grade 4'),
    'Titamax GM Acqua', 'Bone level', 'Acqua Surface', 'Not specified', 'Visible', '/images/implant/Bluediamond%205.3x10%20mm_edit_500617685459146.jpg'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Neodent'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Commercially Pure Titanium Grade 4 / cp Ti Grade 4'),
    'Drive GM', 'Bone level', 'NeoPoros Surface', 'Not specified', 'Visible', '/images/implant/anyridge%20professional%20%204.5x10%20mm%20%281%29_edit_500417377223442.jpg'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Neodent'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Commercially Pure Titanium Grade 4 / cp Ti Grade 4'),
    'Drive GM Acqua', 'Bone level', 'Acqua Surface', 'Not specified', 'Visible', '/images/implant/anyridge%20professional%20%204x10%20mm%20%281%29_edit_500445608607444.jpg'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Neodent'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Commercially Pure Titanium Grade 4 / cp Ti Grade 4'),
    'Helix GM', 'Bone level', 'NeoPoros Surface', 'Not specified', 'Visible', '/images/implant/anyridge%20professional%203.5x10%20mm%20%281%29_edit_500460790791983.jpg'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Neodent'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Commercially Pure Titanium Grade 4 / cp Ti Grade 4'),
    'Helix GM Acqua', 'Bone level', 'Acqua Surface', 'Not specified', 'Visible', '/images/implant/anyridge%20professional%205x10mm%20%281%29_edit_500494873587677.jpg'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Neodent'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Commercially Pure Titanium Grade 4 / cp Ti Grade 4'),
    'Helix GM Long', 'Bone level', 'NeoPoros Surface', 'Not specified', 'Visible', '/images/implant/anyridge%20professional%20fix%203.5x10mm%20%281%29_edit_500511094229525.jpg'
);

-- NEOBIOTECH
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'NeoBiotech'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Ti-6Al-4V ELI, Grade 23'),
    'S-Narrow', 'Bone level', 'Not specified', 'Not specified', 'Visible', '/images/implant/anyridge%20professional%20fix%204.5x10mm%20%281%29_edit_500523085260371.jpg'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'NeoBiotech'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Ti-6Al-4V ELI, Grade 23'),
    'IS-III Active', 'Bone level', 'Not specified', 'Not specified', 'Visible', '/images/implant/super%20line%203.4mm%20x12.0mm_edit_500626504297839.jpg'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'NeoBiotech'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Ti-6Al-4V ELI, Grade 23'),
    'IS-III Active S-Wide', 'Bone level', 'Not specified', 'Not specified', 'Visible', '/images/implant/superline%203.8mmx12.0mm_edit_500649737953225.jpg'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'NeoBiotech'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Ti-6Al-4V ELI, Grade 23'),
    'S-Mini', 'Bone level', 'Not specified', 'Not specified', 'Visible', '/images/implant/superline%204.3mmx12.0mm%20%282%29_edit_500688782010151.jpg'
);

-- PRK
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'PRK'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Not specified'),
    'PRK Dental Implant (Six Smooth Curve)', 'Not specified', 'Not specified', 'Six Smooth Curve Connection', 'Visible', '/images/implant/superline4.8mmx12.0mm_edit_500701017639690.jpg'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'PRK'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Not specified'),
    'PRK Dental Implant (Hexagonal)', 'Not specified', 'Not specified', 'Hexagonal Connection', 'Visible', '/images/implant/Bluediamond%204.1x10%20mm_edit_500540960383142.jpg'
);

-- STRAUMANN
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Straumann'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'Roxolid'),
    'Mini Implant', 'Tissue level', 'Not specified', 'Not specified', 'Visible', '/images/implant/Bluediamond%204.4x10%20mm%20%28deep%29_edit_500556274200296.jpg'
);
INSERT INTO IMPLANT_MODEL
    (brand_id, material_id, model_name, type, surface_treatment, connection_type, status, image_url)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Straumann'),
    (SELECT material_id FROM MATERIAL WHERE material_name = 'ZrO2 (Zirconium dioxide ceramic)'),
    'PURE Ceramic Implant Monotype', 'Tissue level / Bone level', 'Not specified', 'Not specified', 'Visible', '/images/implant/Bluediamond%204.4x10%20mm_edit_500606282765223.jpg'
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


-- =========================================================
-- 6. REFERENCES (ลิงก์แหล่งข้อมูลของแต่ละรุ่น แสดงในหัวข้อ References)
-- =========================================================
UPDATE IMPLANT_MODEL SET reference_url = 'https://assets.dentsplysirona.com/flagship/en/explore/implantology/implant-systems/astra-tech-implant-system-ev/documents/documents/IMP-System-Brochure-Astra-Tech-Implant-System-EV-32670204-USX-1706.pdf' WHERE model_name = 'OsseoSpeed EV';
UPDATE IMPLANT_MODEL SET reference_url = 'https://www.dentsplysirona.com/content/dam/dentsply/pim/manufacturer/Implants/Implant_systems/Astra_Tech_Implant_System/32671191-USX-1904%20Product%20catalog%20OsseoSpeed%20TX_LR.pdf' WHERE model_name = 'OsseoSpeed TX';
UPDATE IMPLANT_MODEL SET reference_url = 'https://www.dentsplysirona.com/content/dam/master/education/documents/upload/A/32670151-USX-1712%20Manual%20and%20product%20catalog%20OsseoSpeed%20TX%20Profile_LR.pdf' WHERE model_name = 'OsseoSpeed TX Profile';
UPDATE IMPLANT_MODEL SET reference_url = 'https://www.dentaurum.de/eng/dentaurum-celebrates-30-years-of-implantology-with-tiolox-tiologic-tiologic-twinfit-49165.aspx' WHERE model_name = 'tioLogic® TWINFIT Implant, Series S (Brown)';
UPDATE IMPLANT_MODEL SET reference_url = 'https://www.dentaurum.de/eng/dentaurum-celebrates-30-years-of-implantology-with-tiolox-tiologic-tiologic-twinfit-49165.aspx' WHERE model_name = 'tioLogic® TWINFIT Implant, Series M (Yellow)';
UPDATE IMPLANT_MODEL SET reference_url = 'https://www.dentaurum.de/eng/dentaurum-celebrates-30-years-of-implantology-with-tiolox-tiologic-tiologic-twinfit-49165.aspx' WHERE model_name = 'tioLogic® TWINFIT Implant, Series L (Red)';
UPDATE IMPLANT_MODEL SET reference_url = 'https://www.dentaurum.de/eng/dentaurum-celebrates-30-years-of-implantology-with-tiolox-tiologic-tiologic-twinfit-49165.aspx' WHERE model_name = 'tioLogic® TWINFIT Implant, Series XL (Blue)';
UPDATE IMPLANT_MODEL SET reference_url = 'https://www.dentaurum.de/eng/dentaurum-celebrates-30-years-of-implantology-with-tiolox-tiologic-tiologic-twinfit-49165.aspx' WHERE model_name = 'tioLogic® TWINFIT Implant, Series XXL (Green)';
UPDATE IMPLANT_MODEL SET reference_url = 'https://pdf.medicalexpo.com/pdf/megagen-implant/anyridge/73228-139460.html' WHERE model_name = 'AnyRidge';
UPDATE IMPLANT_MODEL SET reference_url = 'https://www.medicalexpo.com/prod/megagen-implant/product-73228-931151.html' WHERE model_name = 'AnyOne External';
UPDATE IMPLANT_MODEL SET reference_url = 'https://www.mis-implants.com/upload/pdf/Products/Implants/MIS_C1_Catalog.pdf' WHERE model_name = 'C1';
UPDATE IMPLANT_MODEL SET reference_url = 'https://www.mis-implants.com/products/implant-systems/v3' WHERE model_name = 'V3';
UPDATE IMPLANT_MODEL SET reference_url = 'https://www.mis-implants.com/Products/Implant-Systems/SEVEN' WHERE model_name = 'SEVEN';
UPDATE IMPLANT_MODEL SET reference_url = 'https://shop.straumann.com/neodent/us/en_us/Implant-Lines/Grand-Morse/c/cat_neo_gmline' WHERE model_name = 'Titamax GM';
UPDATE IMPLANT_MODEL SET reference_url = 'https://shop.straumann.com/neodent/be/en_be/Implant-Lines/Grand-Morse/GM-Implants/GM-Titamax-Acqua-Implant/p/140.923' WHERE model_name = 'Titamax GM Acqua';
UPDATE IMPLANT_MODEL SET reference_url = 'https://shop.straumann.com/neodent/pt/en_nz/Implant-Lines/Grand-Morse/GM-Implants/c/cat_neo_gmimplants' WHERE model_name = 'Drive GM';
UPDATE IMPLANT_MODEL SET reference_url = 'https://shop.straumann.com/neodent/be/en_be/Implant-Lines/Grand-Morse/GM-Implants/GM-Drive-Acqua-Implant/p/140.971' WHERE model_name = 'Drive GM Acqua';
UPDATE IMPLANT_MODEL SET reference_url = 'https://shop.straumann.com/neodent/ca/en_ca/Implant-Lines/Grand-Morse/GM-Implants/GM-Helix-Acqua-Implant/p/109.978' WHERE model_name = 'Helix GM';
UPDATE IMPLANT_MODEL SET reference_url = 'https://shop.straumann.com/neodent/us/en_us/Implant-Lines/Grand-Morse/GM-Implants/GM-Helix-Acqua-Implant/p/109.982' WHERE model_name = 'Helix GM Acqua';
UPDATE IMPLANT_MODEL SET reference_url = 'https://www.straumann.com/neodent/en/dental-professionals/implantology/neoarch/helix-gm-long.html' WHERE model_name = 'Helix GM Long';
UPDATE IMPLANT_MODEL SET reference_url = 'https://issuu.com/keilim/docs/s-narrow_catalog' WHERE model_name = 'S-Narrow';
UPDATE IMPLANT_MODEL SET reference_url = 'https://neobiotech.com/cmi/neobiotech/is-iii-active-fixture' WHERE model_name = 'IS-III Active';
UPDATE IMPLANT_MODEL SET reference_url = 'https://www.neobiotech.com/cmi/products/s-wide-kit' WHERE model_name = 'IS-III Active S-Wide';
UPDATE IMPLANT_MODEL SET reference_url = 'https://neobiotech.com/cmi/neobiotech/s-mini-ball-type' WHERE model_name = 'S-Mini';
UPDATE IMPLANT_MODEL SET reference_url = 'https://innovation.bb.go.th/PDF/03020031-278282.pdf' WHERE model_name = 'PRK Dental Implant (Six Smooth Curve)';
UPDATE IMPLANT_MODEL SET reference_url = 'https://innovation.bb.go.th/PDF/03020031-278282.pdf' WHERE model_name = 'PRK Dental Implant (Hexagonal)';
UPDATE IMPLANT_MODEL SET reference_url = 'https://shop.straumann.com/ca/en_ca/Implants/Straumann%C2%AE-Mini-Implants/%C3%98-2-4mm-Straumann%C2%AE-Mini-Implants/p/042.945S/' WHERE model_name = 'Mini Implant';
UPDATE IMPLANT_MODEL SET reference_url = 'https://www.straumann.com/gb/en/dental-professionals/dental-implants/ceramic-implants/ceramic-implants.html' WHERE model_name = 'PURE Ceramic Implant Monotype';