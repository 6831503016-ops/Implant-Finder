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

-- 3. IMPLANT MODELS
-- =========================================================
-- DENTAL IMPLANT FINDER - IMPLANT_MODEL data extracted from PDF
-- . One row per model; all sizes in the
-- `sizes` text column. Column order matches the original schema:
-- brand_id, model_name, material, type, surface_treatment,
-- connection_type, country, status, image_url, sizes
-- =========================================================


-- ASTRA TECH
INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Astra Tech'),
    'OsseoSpeed EV',
    'OsseoSpeed Titanium',
    'Bone level',
    'Not specified',
    'Internal Conical Connection (EV)',
    'Sweden',
    'Visible',
    '/images/drive-download-20261029T053334Z-1-001/anyridge%20professional%20%204.5x10%20mm%20%281%29.JPG',
    'Ø 3 x 8 mm, Ø 3 x 9 mm, Ø 3 x 11 mm, Ø 3 x 13 mm, Ø 3 x 15 mm, Ø 3.6 x 6 mm, Ø 3.6 x 8 mm, Ø 3.6 x 9 mm, Ø 3.6 x 11 mm, Ø 3.6 x 13 mm, Ø 3.6 x 15 mm, Ø 3.6 x 17 mm, Ø 4.2 x 6 mm, Ø 4.2 x 8 mm, Ø 4.2 x 9 mm, Ø 4.2 x 11 mm, Ø 4.2 x 13 mm, Ø 4.2 x 15 mm, Ø 4.2 x 17 mm, Ø 4.8 x 6 mm, Ø 4.8 x 8 mm, Ø 4.8 x 9 mm, Ø 4.8 x 11 mm, Ø 4.8 x 13 mm, Ø 4.8 x 15 mm, Ø 4.8 x 17 mm, Ø 5.4 x 6 mm, Ø 5.4 x 8 mm, Ø 5.4 x 9 mm, Ø 5.4 x 11 mm, Ø 5.4 x 13 mm, Ø 5.4 x 15 mm'
);

INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Astra Tech'),
    'OsseoSpeed TX',
    'OsseoSpeed Titanium',
    'Bone level',
    'Not specified',
    'Internal Conical Connection',
    'Sweden',
    'Visible',
    '/images/drive-download-20261029T053334Z-1-001/anyridge%20professional%20%204x10%20mm%20%281%29.JPG',
    'Ø 3 x 11 mm, Ø 3 x 13 mm, Ø 3 x 15 mm, Ø 3.5 x 8 mm, Ø 3.5 x 9 mm, Ø 3.5 x 11 mm, Ø 3.5 x 13 mm, Ø 3.5 x 15 mm, Ø 3.5 x 17 mm, Ø 4 x 6 mm, Ø 4 x 8 mm, Ø 4 x 9 mm, Ø 4 x 11 mm, Ø 4 x 13 mm, Ø 4 x 15 mm, Ø 4 x 17 mm, Ø 5 x 9 mm, Ø 5 x 11 mm, Ø 5 x 13 mm, Ø 5 x 15 mm, Ø 5 x 17 mm'
);

INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Astra Tech'),
    'OsseoSpeed TX Profile',
    'OsseoSpeed Titanium',
    'Bone level',
    'Not specified',
    'Internal Conical Connection',
    'Sweden',
    'Visible',
    '/images/drive-download-20261029T053334Z-1-001/anyridge%20professional%203.5x10%20mm%20%281%29.JPG',
    'Ø 4.5 x 9 mm, Ø 4.5 x 11 mm, Ø 4.5 x 13 mm, Ø 4.5 x 15 mm, Ø 4.5 x 17 mm, Ø 5 x 9 mm, Ø 5 x 11 mm, Ø 5 x 13 mm, Ø 5 x 15 mm, Ø 5 x 17 mm'
);


-- DENTAURUM
INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Dentaurum'),
    'tioLogic® TWINFIT Implant, Series S (Brown)',
    'Titanium Grade 5 (Ti-6Al-4V)',
    'Bone level',
    'Not specified',
    'Not specified',
    'Germany',
    'Visible',
    '/images/drive-download-20261029T053334Z-1-001/anyridge%20professional%205x10mm%20%281%29.JPG',
    'Ø 3.3 x 7 mm, Ø 3.3 x 9 mm, Ø 3.3 x 11 mm, Ø 3.3 x 13 mm, Ø 3.3 x 15 mm'
);

INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Dentaurum'),
    'tioLogic® TWINFIT Implant, Series M (Yellow)',
    'Titanium Grade 5 (Ti-6Al-4V)',
    'Bone level',
    'Not specified',
    'Not specified',
    'Germany',
    'Visible',
    '/images/drive-download-20261029T053334Z-1-001/anyridge%20professional%20fix%203.5x10mm%20%281%29.JPG',
    'Ø 3.7 x 7 mm, Ø 3.7 x 9 mm, Ø 3.7 x 11 mm, Ø 3.7 x 13 mm, Ø 3.7 x 15 mm'
);

INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Dentaurum'),
    'tioLogic® TWINFIT Implant, Series L (Red)',
    'Titanium Grade 5 (Ti-6Al-4V)',
    'Bone level',
    'Not specified',
    'Not specified',
    'Germany',
    'Visible',
    '/images/drive-download-20261029T053334Z-1-001/anyridge%20professional%20fix%204.5x10mm%20%281%29.JPG',
    'Ø 4.2 x 7 mm, Ø 4.2 x 9 mm, Ø 4.2 x 11 mm, Ø 4.2 x 13 mm, Ø 4.2 x 15 mm'
);

INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Dentaurum'),
    'tioLogic® TWINFIT Implant, Series XL (Blue)',
    'Titanium Grade 4 (Commercially Pure Titanium - cp Ti)',
    'Bone level',
    'Not specified',
    'Not specified',
    'Germany',
    'Visible',
    '/images/drive-download-20261029T053409Z-1-001/super%20line%203.4mm%20x12.0mm.JPG',
    'Ø 4.8 x 7 mm, Ø 4.8 x 9 mm, Ø 4.8 x 11 mm, Ø 4.8 x 13 mm, Ø 4.8 x 15 mm'
);

INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Dentaurum'),
    'tioLogic® TWINFIT Implant, Series XXL (Green)',
    'Titanium Grade 4 (Commercially Pure Titanium - cp Ti)',
    'Bone level',
    'Not specified',
    'Not specified',
    'Germany',
    'Visible',
    '/images/drive-download-20261029T053409Z-1-001/superline%203.8mmx12.0mm.JPG',
    'Ø 5.5 x 7 mm, Ø 5.5 x 9 mm, Ø 5.5 x 11 mm, Ø 5.5 x 13 mm, Ø 5.5 x 15 mm'
);


-- MEGAGEN
INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'MegaGen'),
    'AnyRidge',
    'Grade 4 titanium',
    'Bone level',
    'Not specified',
    'Not specified',
    'South Korea',
    'Visible',
    '/images/drive-download-20261029T053409Z-1-001/superline%204.3mmx12.0mm%20%282%29.JPG',
    'Ø 3.3 x 7 mm, Ø 4 x 7 mm, Ø 4.5 x 7 mm, Ø 5 x 7 mm, Ø 5.5 x 7 mm, Ø 7.5 x 7 mm, Ø 7.5 x 8.5 mm, Ø 7.5 x 10 mm, Ø 7.5 x 11.5 mm, Ø 7.5 x 13 mm, Ø 8 x 7 mm, Ø 8 x 8.5 mm, Ø 8 x 10 mm, Ø 8 x 11.5 mm, Ø 8 x 13 mm'
);

INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'MegaGen'),
    'AnyOne External',
    'Grade 4 titanium',
    'Bone level',
    'Not specified',
    'External',
    'South Korea',
    'Visible',
    '/images/drive-download-20261029T053409Z-1-001/superline4.8mmx12.0mm.JPG',
    'Ø 3.5 x 7 mm, Ø 3.5 x 8 mm, Ø 3.5 x 9 mm, Ø 3.5 x 10 mm, Ø 3.5 x 11 mm, Ø 3.5 x 12 mm, Ø 3.5 x 13 mm, Ø 3.5 x 14 mm, Ø 3.5 x 15 mm, Ø 4 x 7 mm, Ø 4 x 8 mm, Ø 4 x 9 mm, Ø 4 x 10 mm, Ø 4 x 11 mm, Ø 4 x 12 mm, Ø 4 x 13 mm, Ø 4 x 14 mm, Ø 4 x 15 mm, Ø 4.5 x 7 mm, Ø 4.5 x 8 mm, Ø 4.5 x 9 mm, Ø 4.5 x 10 mm, Ø 4.5 x 11 mm, Ø 4.5 x 12 mm, Ø 4.5 x 13 mm, Ø 4.5 x 14 mm, Ø 4.5 x 15 mm, Ø 5 x 7 mm, Ø 5 x 9 mm, Ø 5 x 10 mm, Ø 5 x 11 mm, Ø 5 x 12 mm, Ø 5 x 13 mm, Ø 5 x 14 mm, Ø 5 x 15 mm, Ø 6 x 7 mm, Ø 6 x 8 mm, Ø 6 x 9 mm, Ø 6 x 10 mm, Ø 6 x 11 mm, Ø 6 x 12 mm, Ø 6 x 13 mm, Ø 6 x 14 mm, Ø 6 x 15 mm'
);


-- MIS
INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'MIS'),
    'C1',
    'Ti-6Al-4V ELI (Grade 23 Titanium Alloy)',
    'Bone level',
    'Not specified',
    'Conical connection',
    'Israel',
    'Visible',
    '/images/drive-download-20261029T053453Z-1-001/Bluediamond%204.1x10%20mm.JPG',
    'Ø 3.3 x 10 mm, Ø 3.3 x 11.5 mm, Ø 3.3 x 13 mm, Ø 3.3 x 16 mm, Ø 3.75 x 8 mm, Ø 3.75 x 10 mm, Ø 3.75 x 11.5 mm, Ø 3.75 x 13 mm, Ø 3.75 x 16 mm, Ø 4.2 x 8 mm, Ø 4.2 x 10 mm, Ø 4.2 x 11.5 mm, Ø 4.2 x 13 mm, Ø 4.2 x 16 mm'
);

INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'MIS'),
    'V3',
    'Ti-6Al-4V ELI (Grade 23 Titanium Alloy)',
    'Bone level',
    'Not specified',
    'Conical connection',
    'Israel',
    'Visible',
    '/images/drive-download-20261029T053453Z-1-001/Bluediamond%204.4x10%20mm%20%28deep%29.JPG',
    'Ø 3.3 x 10 mm, Ø 3.3 x 11.5 mm, Ø 3.3 x 13 mm, Ø 3.3 x 16 mm, Ø 3.9 x 8 mm, Ø 3.9 x 10 mm, Ø 3.9 x 11.5 mm, Ø 3.9 x 13 mm, Ø 3.9 x 16 mm, Ø 4.3 x 8 mm, Ø 4.3 x 10 mm, Ø 4.3 x 11.5 mm, Ø 4.3 x 13 mm, Ø 4.3 x 16 mm, Ø 5 x 8 mm, Ø 5 x 10 mm, Ø 5 x 11.5 mm, Ø 5 x 13 mm, Ø 5 x 16 mm'
);

INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'MIS'),
    'SEVEN',
    'Ti-6Al-4V ELI (Grade 23 Titanium Alloy)',
    'Bone level',
    'Not specified',
    'Internal Hexagon connection',
    'Israel',
    'Visible',
    '/images/drive-download-20261029T053453Z-1-001/Bluediamond%204.4x10%20mm.JPG',
    'Ø 3.75 x 8 mm, Ø 3.75 x 10 mm, Ø 3.75 x 11.5 mm, Ø 3.75 x 13 mm, Ø 3.75 x 16 mm, Ø 4.2 x 6 mm, Ø 4.2 x 8 mm, Ø 4.2 x 10 mm, Ø 4.2 x 13 mm, Ø 4.2 x 16 mm'
);


-- NEODENT
INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Neodent'),
    'Titamax GM',
    'Commercially Pure Titanium Grade 4 / cp Ti Grade 4',
    'Bone level',
    'NeoPoros Surface',
    'Not specified',
    'Brazil',
    'Visible',
    '/images/drive-download-20261029T053453Z-1-001/Bluediamond%204.8x10.0%20mm.JPG',
    'Ø 3.5 x 7 mm, Ø 3.5 x 8 mm, Ø 3.5 x 9 mm, Ø 3.5 x 11 mm, Ø 3.5 x 13 mm, Ø 3.5 x 15 mm, Ø 3.5 x 17 mm, Ø 3.75 x 7 mm, Ø 3.75 x 8 mm, Ø 3.75 x 9 mm, Ø 3.75 x 11 mm, Ø 3.75 x 13 mm, Ø 3.75 x 15 mm, Ø 3.75 x 17 mm, Ø 4 x 7 mm, Ø 4 x 8 mm, Ø 4 x 9 mm, Ø 4 x 11 mm, Ø 4 x 13 mm, Ø 4 x 15 mm, Ø 4 x 17 mm, Ø 5 x 7 mm, Ø 5 x 8 mm, Ø 5 x 9 mm, Ø 5 x 11 mm, Ø 5 x 13 mm'
);

INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Neodent'),
    'Titamax GM Acqua',
    'Commercially Pure Titanium Grade 4 / cp Ti Grade 4',
    'Bone level',
    'Acqua Surface',
    'Not specified',
    'Brazil',
    'Visible',
    '/images/drive-download-20261029T053453Z-1-001/Bluediamond%205.3x10%20mm.JPG',
    'Ø 3.5 x 7 mm, Ø 3.5 x 8 mm, Ø 3.5 x 9 mm, Ø 3.5 x 11 mm, Ø 3.5 x 13 mm, Ø 3.5 x 15 mm, Ø 3.5 x 17 mm, Ø 3.75 x 7 mm, Ø 3.75 x 8 mm, Ø 3.75 x 9 mm, Ø 3.75 x 11 mm, Ø 3.75 x 13 mm, Ø 3.75 x 15 mm, Ø 3.75 x 17 mm, Ø 4 x 7 mm, Ø 4 x 8 mm, Ø 4 x 9 mm, Ø 4 x 11 mm, Ø 4 x 13 mm, Ø 4 x 15 mm, Ø 4 x 17 mm, Ø 5 x 7 mm, Ø 5 x 8 mm, Ø 5 x 9 mm, Ø 5 x 11 mm, Ø 5 x 13 mm'
);

INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Neodent'),
    'Drive GM',
    'Commercially Pure Titanium Grade 4 / cp Ti Grade 4',
    'Bone level',
    'NeoPoros Surface',
    'Not specified',
    'Brazil',
    'Visible',
    '/images/drive-download-20261029T053334Z-1-001/anyridge%20professional%20%204.5x10%20mm%20%281%29.JPG',
    'Ø 3.5 x 8 mm, Ø 3.5 x 10 mm, Ø 3.5 x 11.5 mm, Ø 3.5 x 13 mm, Ø 3.5 x 16 mm, Ø 3.5 x 18 mm, Ø 4.3 x 8 mm, Ø 4.3 x 10 mm, Ø 4.3 x 11.5 mm, Ø 4.3 x 13 mm, Ø 4.3 x 16 mm, Ø 4.3 x 18 mm, Ø 5 x 8 mm, Ø 5 x 10 mm, Ø 5 x 11.5 mm, Ø 5 x 13 mm, Ø 5 x 16 mm, Ø 5 x 18 mm'
);

INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Neodent'),
    'Drive GM Acqua',
    'Commercially Pure Titanium Grade 4 / cp Ti Grade 4',
    'Bone level',
    'Acqua Surface',
    'Not specified',
    'Brazil',
    'Visible',
    '/images/drive-download-20261029T053334Z-1-001/anyridge%20professional%20%204x10%20mm%20%281%29.JPG',
    'Ø 3.5 x 8 mm, Ø 3.5 x 10 mm, Ø 3.5 x 11.5 mm, Ø 3.5 x 13 mm, Ø 3.5 x 16 mm, Ø 3.5 x 18 mm, Ø 4.3 x 8 mm, Ø 4.3 x 10 mm, Ø 4.3 x 11.5 mm, Ø 4.3 x 13 mm, Ø 4.3 x 16 mm, Ø 4.3 x 18 mm, Ø 5 x 8 mm, Ø 5 x 10 mm, Ø 5 x 11.5 mm, Ø 5 x 13 mm, Ø 5 x 16 mm, Ø 5 x 18 mm'
);

INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Neodent'),
    'Helix GM',
    'Commercially Pure Titanium Grade 4 / cp Ti Grade 4',
    'Bone level',
    'NeoPoros Surface',
    'Not specified',
    'Brazil',
    'Visible',
    '/images/drive-download-20261029T053334Z-1-001/anyridge%20professional%203.5x10%20mm%20%281%29.JPG',
    'Ø 3.5 x 8 mm, Ø 3.5 x 10 mm, Ø 3.5 x 11.5 mm, Ø 3.5 x 13 mm, Ø 3.5 x 16 mm, Ø 3.5 x 18 mm, Ø 3.75 x 8 mm, Ø 3.75 x 10 mm, Ø 3.75 x 11.5 mm, Ø 3.75 x 13 mm, Ø 3.75 x 16 mm, Ø 3.75 x 18 mm, Ø 4 x 8 mm, Ø 4 x 10 mm, Ø 4 x 11.5 mm, Ø 4 x 13 mm, Ø 4 x 16 mm, Ø 4 x 18 mm, Ø 4.3 x 8 mm, Ø 4.3 x 10 mm, Ø 4.3 x 11.5 mm, Ø 4.3 x 13 mm, Ø 4.3 x 16 mm, Ø 4.3 x 18 mm, Ø 5 x 8 mm, Ø 5 x 10 mm, Ø 5 x 11.5 mm, Ø 5 x 13 mm, Ø 5 x 16 mm, Ø 5 x 18 mm, Ø 6 x 8 mm, Ø 6 x 10 mm, Ø 6 x 11.5 mm, Ø 6 x 13 mm, Ø 7 x 8 mm, Ø 7 x 10 mm, Ø 7 x 11.5 mm, Ø 7 x 13 mm'
);

INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Neodent'),
    'Helix GM Acqua',
    'Commercially Pure Titanium Grade 4 / cp Ti Grade 4',
    'Bone level',
    'Acqua Surface',
    'Not specified',
    'Brazil',
    'Visible',
    '/images/drive-download-20261029T053334Z-1-001/anyridge%20professional%205x10mm%20%281%29.JPG',
    'Ø 3.5 x 8 mm, Ø 3.5 x 10 mm, Ø 3.5 x 11.5 mm, Ø 3.5 x 13 mm, Ø 3.5 x 16 mm, Ø 3.5 x 18 mm, Ø 3.75 x 8 mm, Ø 3.75 x 10 mm, Ø 3.75 x 11.5 mm, Ø 3.75 x 13 mm, Ø 3.75 x 16 mm, Ø 3.75 x 18 mm, Ø 4 x 8 mm, Ø 4 x 10 mm, Ø 4 x 11.5 mm, Ø 4 x 13 mm, Ø 4 x 16 mm, Ø 4 x 18 mm, Ø 4.3 x 8 mm, Ø 4.3 x 10 mm, Ø 4.3 x 11.5 mm, Ø 4.3 x 13 mm, Ø 4.3 x 16 mm, Ø 4.3 x 18 mm, Ø 5 x 8 mm, Ø 5 x 10 mm, Ø 5 x 11.5 mm, Ø 5 x 13 mm, Ø 5 x 16 mm, Ø 5 x 18 mm, Ø 6 x 8 mm, Ø 6 x 10 mm, Ø 6 x 11.5 mm, Ø 6 x 13 mm, Ø 7 x 8 mm, Ø 7 x 10 mm, Ø 7 x 11.5 mm, Ø 7 x 13 mm'
);

INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Neodent'),
    'Helix GM Long',
    'Commercially Pure Titanium Grade 4 / cp Ti Grade 4',
    'Bone level',
    'NeoPoros Surface',
    'Not specified',
    'Brazil',
    'Visible',
    '/images/drive-download-20261029T053334Z-1-001/anyridge%20professional%20fix%203.5x10mm%20%281%29.JPG',
    'Ø 3.75 x 20 mm, Ø 3.75 x 22.5 mm, Ø 3.75 x 25 mm, Ø 4 x 20 mm, Ø 4 x 22.5 mm, Ø 4 x 25 mm'
);


-- NEOBIOTECH
INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'NeoBiotech'),
    'S-Narrow',
    'Ti-6Al-4V ELI, Grade 23',
    'Bone level',
    'Not specified',
    'Not specified',
    'South Korea',
    'Visible',
    '/images/drive-download-20261029T053334Z-1-001/anyridge%20professional%20fix%204.5x10mm%20%281%29.JPG',
    'Ø 3.2 x 8.5 mm, Ø 3.2 x 10 mm, Ø 3.2 x 11.5 mm, Ø 3.2 x 13 mm'
);

INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'NeoBiotech'),
    'IS-III Active',
    'Ti-6Al-4V ELI, Grade 23',
    'Bone level',
    'Not specified',
    'Not specified',
    'South Korea',
    'Visible',
    '/images/drive-download-20261029T053409Z-1-001/super%20line%203.4mm%20x12.0mm.JPG',
    'Ø 3.5 x 8.5 mm, Ø 3.5 x 10 mm, Ø 3.5 x 11.5 mm, Ø 3.5 x 13 mm, Ø 4 x 7.3 mm, Ø 4 x 8.5 mm, Ø 4 x 10 mm, Ø 4 x 11.5 mm, Ø 4 x 13 mm, Ø 4.5 x 7.3 mm, Ø 4.5 x 8.5 mm, Ø 4.5 x 10 mm, Ø 4.5 x 11.5 mm, Ø 4.5 x 13 mm, Ø 5 x 7.3 mm, Ø 5 x 8.5 mm, Ø 5 x 10 mm, Ø 5 x 11.5 mm, Ø 5 x 13 mm'
);

INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'NeoBiotech'),
    'IS-III Active S-Wide',
    'Ti-6Al-4V ELI, Grade 23',
    'Bone level',
    'Not specified',
    'Not specified',
    'South Korea',
    'Visible',
    '/images/drive-download-20261029T053409Z-1-001/superline%203.8mmx12.0mm.JPG',
    'Ø 5.5 x 7.3 mm, Ø 5.5 x 8.5 mm, Ø 5.5 x 10 mm, Ø 5.5 x 11.5 mm, Ø 5.5 x 13 mm, Ø 6 x 7.3 mm, Ø 6 x 8.5 mm, Ø 6 x 10 mm, Ø 6 x 11.5 mm, Ø 6 x 13 mm, Ø 7 x 7.3 mm, Ø 7 x 8.5 mm, Ø 7 x 10 mm, Ø 7 x 11.5 mm, Ø 7 x 13 mm'
);

INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'NeoBiotech'),
    'S-Mini',
    'Ti-6Al-4V ELI, Grade 23',
    'Bone level',
    'Not specified',
    'Not specified',
    'South Korea',
    'Visible',
    '/images/drive-download-20261029T053409Z-1-001/superline%204.3mmx12.0mm%20%282%29.JPG',
    'Ø 2 x 8.5 mm, Ø 2 x 10 mm, Ø 2 x 11.5 mm, Ø 2 x 13 mm, Ø 2 x 15 mm, Ø 2.5 x 8 mm, Ø 2.5 x 10 mm, Ø 2.5 x 11 mm, Ø 2.5 x 13 mm, Ø 2.5 x 15 mm, Ø 3 x 8 mm, Ø 3 x 10 mm, Ø 3 x 11 mm, Ø 3 x 13 mm, Ø 3 x 15 mm, Ø 3.5 x 8 mm, Ø 3.5 x 10 mm, Ø 3.5 x 11 mm, Ø 3.5 x 13 mm, Ø 3.5 x 15 mm'
);


-- PRK
INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'PRK'),
    'PRK Dental Implant (Six Smooth Curve)',
    'Not specified',
    'Not specified',
    'Not specified',
    'Six Smooth Curve Connection',
    'Thailand',
    'Visible',
    '/images/drive-download-20261029T053409Z-1-001/superline4.8mmx12.0mm.JPG',
    'Ø 3.4 x 10 mm, Ø 3.4 x 12 mm, Ø 3.4 x 14 mm, Ø 3.8 x 8 mm, Ø 3.8 x 10 mm, Ø 3.8 x 12 mm, Ø 3.8 x 14 mm, Ø 4.2 x 8 mm, Ø 4.2 x 10 mm, Ø 4.2 x 12 mm, Ø 4.2 x 14 mm, Ø 5 x 8 mm, Ø 5 x 10 mm, Ø 5 x 12 mm, Ø 5 x 14 mm'
);

INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'PRK'),
    'PRK Dental Implant (Hexagonal)',
    'Not specified',
    'Not specified',
    'Not specified',
    'Hexagonal Connection',
    'Thailand',
    'Visible',
    '/images/drive-download-20261029T053453Z-1-001/Bluediamond%204.1x10%20mm.JPG',
    'Ø 3.4 x 10 mm, Ø 3.4 x 12 mm, Ø 3.4 x 14 mm, Ø 3.8 x 8 mm, Ø 3.8 x 10 mm, Ø 3.8 x 12 mm, Ø 3.8 x 14 mm, Ø 4.2 x 8 mm, Ø 4.2 x 10 mm, Ø 4.2 x 12 mm, Ø 4.2 x 14 mm, Ø 5 x 8 mm, Ø 5 x 10 mm, Ø 5 x 12 mm, Ø 5 x 14 mm'
);


-- STRAUMANN
INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Straumann'),
    'Mini Implant',
    'Roxolid',
    'Tissue level',
    'Not specified',
    'Not specified',
    'Switzerland',
    'Visible',
    '/images/drive-download-20261029T053453Z-1-001/Bluediamond%204.4x10%20mm%20%28deep%29.JPG',
    'Ø 2.4 x 10 mm, Ø 2.4 x 12 mm, Ø 2.4 x 14 mm'
);

INSERT INTO IMPLANT_MODEL (
    brand_id, model_name, material, type,
    surface_treatment, connection_type, country,
    status, image_url, sizes
)
VALUES (
    (SELECT brand_id FROM BRAND WHERE brand_name = 'Straumann'),
    'PURE Ceramic Implant Monotype',
    'ZrO2 (Zirconium dioxide ceramic)',
    'Tissue level / Bone level',
    'Not specified',
    'Not specified',
    'Switzerland',
    'Visible',
    '/images/drive-download-20261029T053453Z-1-001/Bluediamond%204.4x10%20mm.JPG',
    'Ø 3.3 x 8 mm (Tissue level, AH 4), Ø 3.3 x 8 mm (Tissue level, AH 5.5), Ø 3.3 x 10 mm (Tissue level, AH 4), Ø 3.3 x 10 mm (Tissue level, AH 5.5), Ø 3.3 x 12 mm (Tissue level, AH 4), Ø 3.3 x 12 mm (Tissue level, AH 5.5), Ø 3.3 x 14 mm (Tissue level, AH 4), Ø 3.3 x 14 mm (Tissue level, AH 5.5), Ø 4.1 x 8 mm (Bone level), Ø 4.1 x 8 mm (Tissue level, AH 4), Ø 4.1 x 8 mm (Tissue level, AH 5.5), Ø 4.1 x 10 mm (Bone level), Ø 4.1 x 10 mm (Tissue level, AH 4), Ø 4.1 x 10 mm (Tissue level, AH 5.5), Ø 4.1 x 12 mm (Bone level), Ø 4.1 x 12 mm (Tissue level, AH 4), Ø 4.1 x 12 mm (Tissue level, AH 5.5), Ø 4.1 x 14 mm (Bone level), Ø 4.1 x 14 mm (Tissue level, AH 4), Ø 4.1 x 14 mm (Tissue level, AH 5.5)'
);