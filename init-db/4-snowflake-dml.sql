--contries
INSERT INTO countries (
    country_name 
)
SELECT DISTINCT 
    m.customer_country
FROM mock_data m
WHERE m.customer_country IS NOT NULL ON CONFLICT (country_name) DO NOTHING;

INSERT INTO countries (
    country_name
)
SELECT DISTINCT 
    m.seller_country
FROM mock_data m
WHERE m.seller_country IS NOT NULL ON CONFLICT (country_name) DO NOTHING;

INSERT INTO countries (
    country_name
)
SELECT DISTINCT 
    m.store_country
FROM mock_data m
WHERE m.store_country IS NOT NULL ON CONFLICT (country_name) DO NOTHING;

INSERT INTO countries (
    country_name
)
SELECT DISTINCT 
    m.supplier_country
FROM mock_data m
WHERE m.supplier_country IS NOT NULL ON CONFLICT (country_name) DO NOTHING;

--cities
INSERT INTO cities (
    city_name
)
SELECT DISTINCT 
    m.store_city
FROM mock_data m
WHERE m.store_city IS NOT NULL ON CONFLICT (city_name) DO NOTHING;  

INSERT INTO cities (
    city_name
)
SELECT DISTINCT 
    m.supplier_city
FROM mock_data m
WHERE m.supplier_city IS NOT NULL ON CONFLICT (city_name) DO NOTHING;

--dates
INSERT INTO dates (
    date_value
)
SELECT DISTINCT 
    m.sale_date
FROM mock_data m
WHERE m.sale_date IS NOT NULL ON CONFLICT (date_value) DO NOTHING;

INSERT INTO dates (
    date_value
)
SELECT DISTINCT
    m.product_release_date
FROM mock_data m
WHERE m.product_release_date IS NOT NULL ON CONFLICT (date_value) DO NOTHING;

INSERT INTO dates (
    date_value
)
SELECT DISTINCT
    m.product_expiry_date
FROM mock_data m
WHERE m.product_expiry_date IS NOT NULL ON CONFLICT (date_value) DO NOTHING;

--pets
INSERT INTO pet_types (
    pet_type_name
)
SELECT DISTINCT 
    m.customer_pet_type
FROM mock_data m
WHERE m.customer_pet_type IS NOT NULL ON CONFLICT (pet_type_name) DO NOTHING;

INSERT INTO pet_breeds (
    pet_breed_name
)
SELECT DISTINCT 
    m.customer_pet_breed
FROM mock_data m
WHERE m.customer_pet_breed IS NOT NULL ON CONFLICT (pet_breed_name) DO NOTHING;

INSERT INTO pet_categories (
    pet_category_name
)   
SELECT DISTINCT 
    m.pet_category
FROM mock_data m
WHERE m.pet_category IS NOT NULL ON CONFLICT (pet_category_name) DO NOTHING;

INSERT INTO pets (
    pet_type_id, 
    pet_name, 
    pet_breed_id, 
    pet_category_id
)
SELECT DISTINCT 
    pt.pet_type_id, 
    m.customer_pet_name, 
    pb.pet_breed_id,
    pc.pet_category_id 
FROM mock_data m
JOIN pet_types pt ON m.customer_pet_type = pt.pet_type_name
JOIN pet_breeds pb ON m.customer_pet_breed = pb.pet_breed_name
JOIN pet_categories pc ON m.pet_category = pc.pet_category_name;

--customers
INSERT INTO customers (
    customer_first_name, 
    customer_last_name,
    customer_age, 
    customer_email, 
    customer_country_id, 
    customer_postal_code, 
    customer_pet_id
)
SELECT DISTINCT
    m.customer_first_name, 
    m.customer_last_name, 
    m.customer_age, 
    m.customer_email, 
    c.country_id, 
    m.customer_postal_code, 
    p.pet_id
FROM mock_data m
JOIN pet_types pt ON m.customer_pet_type = pt.pet_type_name
JOIN pet_breeds pb ON m.customer_pet_breed = pb.pet_breed_name
JOIN pet_categories pc ON m.pet_category = pc.pet_category_name
JOIN pets p ON m.customer_pet_name = p.pet_name
    AND pt.pet_type_id = p.pet_type_id
    AND pb.pet_breed_id = p.pet_breed_id
    AND pc.pet_category_id = p.pet_category_id
JOIN countries c ON m.customer_country = c.country_name;

--sellers
INSERT INTO sellers (
    seller_first_name, 
    seller_last_name, 
    seller_email, 
    seller_country_id, 
    seller_postal_code
)
SELECT DISTINCT
    m.seller_first_name, 
    m.seller_last_name, 
    m.seller_email, 
    c.country_id, 
    m.seller_postal_code
FROM mock_data m
JOIN countries c ON m.seller_country = c.country_name;

--stores
INSERT INTO stores (
    store_name, 
    store_location, 
    store_city_id, 
    store_state, 
    store_country_id, 
    store_phone, 
    store_email
)
SELECT DISTINCT
    m.store_name,
    m.store_location,
    ci.city_id,
    m.store_state,
    c.country_id,
    m.store_phone,
    m.store_email
FROM mock_data m
JOIN cities ci ON m.store_city = ci.city_name
JOIN countries c ON m.store_country = c.country_name;

--suppliers
INSERT INTO suppliers (
    supplier_name, 
    supplier_contact, 
    supplier_email, 
    supplier_phone, 
    supplier_address, 
    supplier_city_id, 
    supplier_country_id
)
SELECT DISTINCT
    m.supplier_name,
    m.supplier_contact,
    m.supplier_email,
    m.supplier_phone,
    m.supplier_address,
    ci.city_id,
    c.country_id
FROM mock_data m
JOIN cities ci ON m.supplier_city = ci.city_name
JOIN countries c ON m.supplier_country = c.country_name;

--products
INSERT INTO product_names (
    product_name
)  
SELECT DISTINCT 
    m.product_name
FROM mock_data m
WHERE m.product_name IS NOT NULL;

INSERT INTO product_categories (
    product_category_name
)  
SELECT DISTINCT 
    m.product_category
FROM mock_data m
WHERE m.product_category IS NOT NULL;

INSERT INTO product_colors(
    product_color_name
)
SELECT DISTINCT 
    m.product_color
FROM mock_data m
WHERE m.product_color IS NOT NULL;

INSERT INTO product_sizes (
    product_size_name
)
SELECT DISTINCT 
    m.product_size
FROM mock_data m
WHERE m.product_size IS NOT NULL;

INSERT INTO product_brands (
    product_brand_name
)
SELECT DISTINCT 
    m.product_brand
FROM mock_data m
WHERE m.product_brand IS NOT NULL;

INSERT INTO product_materials (
    product_material_name
)
SELECT DISTINCT 
    m.product_material
FROM mock_data m
WHERE m.product_material IS NOT NULL;

INSERT INTO products (
    product_name_id,
    product_category_id,
    product_price,
    product_quantity,
    product_weight,
    product_color_id,
    product_size_id,
    product_brand_id,
    product_material_id,
    product_description,
    product_rating,
    product_reviews,
    product_release_date_id,
    product_expiry_date_id, 
    product_supplier_id
)
SELECT DISTINCT
    pn.product_name_id,
    pc.product_category_id,
    m.product_price,
    m.product_quantity,
    m.product_weight,
    pco.product_color_id,
    ps.product_size_id,
    pb.product_brand_id,
    pm.product_material_id,
    m.product_description,
    m.product_rating,
    m.product_reviews,
    dr.date_id,
    de.date_id, 
    s.supplier_id
FROM mock_data m
JOIN product_names pn ON m.product_name = pn.product_name
JOIN product_categories pc ON m.product_category = pc.product_category_name
JOIN product_colors pco ON m.product_color = pco.product_color_name
JOIN product_sizes ps ON m.product_size = ps.product_size_name
JOIN product_brands pb ON m.product_brand = pb.product_brand_name
JOIN product_materials pm ON m.product_material = pm.product_material_name
JOIN suppliers s ON m.supplier_name = s.supplier_name AND m.supplier_contact = s.supplier_contact
JOIN dates dr ON m.product_release_date = dr.date_value
JOIN dates de ON m.product_expiry_date = de.date_value;

-- sales 
INSERT INTO sales (
    sale_date_id, 
    sale_customer_id, 
    sale_seller_id, 
    sale_product_id, 
    sale_store_id, 
    sale_quantity, 
    sale_total_price 
)
SELECT DISTINCT
    d.date_id,
    c.customer_id,
    s.seller_id,
    p.product_id,
    st.store_id,
    m.sale_quantity,
    m.sale_total_price
FROM mock_data m
JOIN dates d ON m.sale_date = d.date_value
JOIN customers c ON m.customer_email = c.customer_email
JOIN sellers s ON m.seller_email = s.seller_email
JOIN products p ON m.product_name = (SELECT pn.product_name FROM product_names pn WHERE pn.product_name_id = p.product_name_id)
    AND m.product_category = (SELECT pc.product_category_name FROM product_categories pc WHERE pc.product_category_id = p.product_category_id)
    AND m.product_price = p.product_price
    AND m.product_quantity = p.product_quantity
    AND m.product_weight = p.product_weight
    AND m.product_color = (SELECT pco.product_color_name FROM product_colors pco WHERE pco.product_color_id = p.product_color_id)
    AND m.product_size = (SELECT ps.product_size_name FROM product_sizes ps WHERE ps.product_size_id = p.product_size_id)
    AND m.product_brand = (SELECT pb.product_brand_name FROM product_brands pb WHERE pb.product_brand_id = p.product_brand_id)
    AND m.product_material = (SELECT pm.product_material_name FROM product_materials pm WHERE pm.product_material_id = p.product_material_id)
    AND m.product_description = p.product_description
    AND m.product_rating = p.product_rating
    AND m.product_reviews = p.product_reviews
JOIN stores st ON m.store_name = st.store_name AND m.store_location = st.store_location AND m.store_phone = st.store_phone AND m.store_email = st.store_email;    