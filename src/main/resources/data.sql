-- Initial Brands Data[cite: 39, 50]
INSERT INTO BRAND (brand_name, country, logo_url) VALUES ('Neodent', 'Brazil', 'https://raw.githubusercontent.com/mdn/svg-gallery/main/icons/star.svg');
INSERT INTO BRAND (brand_name, country, logo_url) VALUES ('Dentaurum', 'Germany', 'https://raw.githubusercontent.com/mdn/svg-gallery/main/icons/star.svg');
INSERT INTO BRAND (brand_name, country, logo_url) VALUES ('Straumann', 'Switzerland', 'https://raw.githubusercontent.com/mdn/svg-gallery/main/icons/star.svg');
INSERT INTO BRAND (brand_name, country, logo_url) VALUES ('Astra Tech', 'Sweden', 'https://raw.githubusercontent.com/mdn/svg-gallery/main/icons/star.svg');
INSERT INTO BRAND (brand_name, country, logo_url) VALUES ('Nobel Biocare', 'Sweden', 'https://raw.githubusercontent.com/mdn/svg-gallery/main/icons/star.svg');
INSERT INTO BRAND (brand_name, country, logo_url) VALUES ('PRK', 'South Korea', 'https://raw.githubusercontent.com/mdn/svg-gallery/main/icons/star.svg');
INSERT INTO BRAND (brand_name, country, logo_url) VALUES ('MegaGen', 'South Korea', 'https://raw.githubusercontent.com/mdn/svg-gallery/main/icons/star.svg');
INSERT INTO BRAND (brand_name, country, logo_url) VALUES ('NeoBioTech', 'South Korea', 'https://raw.githubusercontent.com/mdn/svg-gallery/main/icons/star.svg');
INSERT INTO BRAND (brand_name, country, logo_url) VALUES ('MIS', 'Israel', 'https://raw.githubusercontent.com/mdn/svg-gallery/main/icons/star.svg');

-- Initial Admin Account[cite: 54]
INSERT INTO ADMIN (full_name, username, email, password_hash, avatar_link) 
VALUES ('Admin User', '@implantadmin', 'admin@implant.com', '123456', 'https://api.dicebear.com/7.x/bottts/svg?seed=Admin1');

-- Initial Implant Models[cite: 50, 51]
INSERT INTO IMPLANT_MODEL (brand_id, model_name, material, type, surface_treatment, connection_type, country, status, image_url, sizes) 
VALUES (5, 'NobelActive', 'Titanium Grade 4', 'Tapered Internal', 'TiUltra (RBM)', 'Internal Hex', 'Sweden', 'Visible', 'https://images.unsplash.com/photo-1588776814546-1ffcf47267a5?w=500&auto=format&fit=crop', 'Ø 3.5 x 11.5 mm');

INSERT INTO IMPLANT_MODEL (brand_id, model_name, material, type, surface_treatment, connection_type, country, status, image_url, sizes) 
VALUES (3, 'BLT Roxolid', 'Titanium Grade 4', 'Bone Level', 'SLA surface', 'Internal Roxolid', 'Switzerland', 'Visible', 'https://images.unsplash.com/photo-1588776814546-1ffcf47267a5?w=500&auto=format&fit=crop', 'Ø 4.0 x 10.0 mm');

INSERT INTO IMPLANT_MODEL (brand_id, model_name, material, type, surface_treatment, connection_type, country, status, image_url, sizes) 
VALUES (4, 'Astra Tech EV', 'Titanium Grade 4', 'Conical Seal', 'OsseoSpeed', 'Internal Conical', 'Sweden', 'Visible', 'https://images.unsplash.com/photo-1588776814546-1ffcf47267a5?w=500&auto=format&fit=crop', 'Ø 4.2 x 11.0 mm');

INSERT INTO IMPLANT_MODEL (brand_id, model_name, material, type, surface_treatment, connection_type, country, status, image_url, sizes) 
VALUES (1, 'Implantium', 'Titanium Grade 4', 'Tapered', 'S.L.A.', 'Internal Hex', 'Brazil', 'Visible', 'https://images.unsplash.com/photo-1588776814546-1ffcf47267a5?w=500&auto=format&fit=crop', 'Ø 4.5 x 10.0 mm');

INSERT INTO IMPLANT_MODEL (brand_id, model_name, material, type, surface_treatment, connection_type, country, status, image_url, sizes) 
VALUES (9, 'TSIII SA', 'Titanium Grade 4', 'Internal Hex', 'SA Surface', 'Internal', 'Israel', 'Visible', 'https://images.unsplash.com/photo-1588776814546-1ffcf47267a5?w=500&auto=format&fit=crop', 'Ø 3.75 x 11.5 mm');