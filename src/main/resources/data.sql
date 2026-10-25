-- 1. Initial Admin Account
INSERT INTO ADMIN (full_name, username, email, password_hash, avatar_link) 
VALUES ('Admin User', 'admin', 'admin@implant.com', '123456', 'https://api.dicebear.com/7.x/bottts/svg?seed=Admin1');

-- 2. Initial Brands Data (10 Brands)
INSERT INTO BRAND (brand_id, brand_name, country, logo_url) VALUES 
(1, 'Neodent', 'Brazil', 'https://images.unsplash.com/photo-1629909613654-28e377c37b09?w=200&auto=format&fit=crop'),
(2, 'Dentaurum', 'Germany', 'https://images.unsplash.com/photo-1588776814546-1ffcf47267a5?w=200&auto=format&fit=crop'),
(3, 'Straumann', 'Switzerland', 'https://images.unsplash.com/photo-1606811841689-23dfddce3e95?w=200&auto=format&fit=crop'),
(4, 'Astra Tech', 'Sweden', 'https://images.unsplash.com/photo-1598256989800-fe5f95da9787?w=200&auto=format&fit=crop'),
(5, 'Nobel Biocare', 'Sweden', 'https://images.unsplash.com/photo-1579684385127-1ef15d508118?w=200&auto=format&fit=crop'),
(6, 'PRK', 'South Korea', 'https://images.unsplash.com/photo-1588776814546-1ffcf47267a5?w=200&auto=format&fit=crop'),
(7, 'MegaGen', 'South Korea', 'https://images.unsplash.com/photo-1629909613654-28e377c37b09?w=200&auto=format&fit=crop'),
(8, 'NeoBioTech', 'South Korea', 'https://images.unsplash.com/photo-1606811841689-23dfddce3e95?w=200&auto=format&fit=crop'),
(9, 'MIS', 'Israel', 'https://images.unsplash.com/photo-1598256989800-fe5f95da9787?w=200&auto=format&fit=crop'),
(10, 'Osstem', 'South Korea', 'https://images.unsplash.com/photo-1579684385127-1ef15d508118?w=200&auto=format&fit=crop');

-- 3. Initial Implant Models Data (12 Models)
INSERT INTO IMPLANT_MODEL (brand_id, model_name, material, type, surface_treatment, connection_type, country, status, image_url, sizes) VALUES 
(5, 'NobelActive', 'Titanium Grade 4', 'Tapered Internal', 'TiUltra (RBM)', 'Internal Hex', 'Sweden', 'Visible', 'https://images.unsplash.com/photo-1588776814546-1ffcf47267a5?w=500&auto=format&fit=crop', 'Ø 3.5 x 11.5 mm'),
(5, 'NC TiUltra', 'Titanium Grade 4', 'Tapered Internal', 'TiUltra', 'Internal Hex', 'Sweden', 'Visible', 'https://images.unsplash.com/photo-1606811841689-23dfddce3e95?w=500&auto=format&fit=crop', 'Ø 3.5 x 10.0 mm'),
(5, 'Tapered Pro', 'Titanium Grade 4', 'Tapered', 'SLA Surface', 'Internal Conical', 'Sweden', 'Visible', 'https://images.unsplash.com/photo-1598256989800-fe5f95da9787?w=500&auto=format&fit=crop', 'Ø 4.0 x 11.5 mm'),
(3, 'BLT Roxolid', 'Titanium Grade 4', 'Bone Level', 'SLA surface', 'Internal Roxolid', 'Switzerland', 'Visible', 'https://images.unsplash.com/photo-1629909613654-28e377c37b09?w=500&auto=format&fit=crop', 'Ø 4.0 x 10.0 mm'),
(3, 'Tissue Level Standard', 'Titanium Grade 4', 'Tissue Level', 'SLActive', 'SynOcta', 'Switzerland', 'Visible', 'https://images.unsplash.com/photo-1579684385127-1ef15d508118?w=500&auto=format&fit=crop', 'Ø 4.8 x 12.0 mm'),
(4, 'Astra Tech EV', 'Titanium Grade 4', 'Conical Seal', 'OsseoSpeed', 'Internal Conical', 'Sweden', 'Visible', 'https://images.unsplash.com/photo-1588776814546-1ffcf47267a5?w=500&auto=format&fit=crop', 'Ø 4.2 x 11.0 mm'),
(1, 'Grand Morse', 'Titanium Grade 4', 'Tapered', 'Acqua', 'Morse Taper', 'Brazil', 'Visible', 'https://images.unsplash.com/photo-1606811841689-23dfddce3e95?w=500&auto=format&fit=crop', 'Ø 3.75 x 10.0 mm'),
(1, 'Implantium', 'Titanium Grade 4', 'Tapered', 'S.L.A.', 'Internal Hex', 'Brazil', 'Visible', 'https://images.unsplash.com/photo-1598256989800-fe5f95da9787?w=500&auto=format&fit=crop', 'Ø 4.5 x 10.0 mm'),
(9, 'Seven', 'Titanium Grade 5', 'Tapered', 'SLA', 'Internal Hex', 'Israel', 'Visible', 'https://images.unsplash.com/photo-1629909613654-28e377c37b09?w=500&auto=format&fit=crop', 'Ø 3.75 x 11.5 mm'),
(9, 'TSIII SA', 'Titanium Grade 4', 'Internal Hex', 'SA Surface', 'Internal', 'Israel', 'Visible', 'https://images.unsplash.com/photo-1579684385127-1ef15d508118?w=500&auto=format&fit=crop', 'Ø 3.75 x 11.5 mm'),
(10, 'Osstem TS System', 'Titanium Grade 4', 'Tapered', 'SA Surface', 'Internal Hex', 'South Korea', 'Visible', 'https://images.unsplash.com/photo-1588776814546-1ffcf47267a5?w=500&auto=format&fit=crop', 'Ø 4.0 x 10.0 mm'),
(7, 'AnyRidge', 'Titanium Grade 4', 'Tapered', 'Xpeed', 'Internal Conical', 'South Korea', 'Visible', 'https://images.unsplash.com/photo-1606811841689-23dfddce3e95?w=500&auto=format&fit=crop', 'Ø 4.0 x 11.5 mm');