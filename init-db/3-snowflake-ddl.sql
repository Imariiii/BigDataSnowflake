CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR UNIQUE
);

CREATE TABLE cities (
    city_id SERIAL PRIMARY KEY,
    city_name VARCHAR UNIQUE
);

CREATE TABLE dates (
    date_id SERIAL PRIMARY KEY,
    date_value DATE UNIQUE
);

CREATE TABLE pet_types (
    pet_type_id SERIAL PRIMARY KEY,
    pet_type_name VARCHAR UNIQUE
);

CREATE TABLE pet_breeds (
    pet_breed_id SERIAL PRIMARY KEY,
    pet_breed_name VARCHAR UNIQUE
);

CREATE TABLE pet_categories (
    pet_category_id SERIAL PRIMARY KEY,
    pet_category_name VARCHAR UNIQUE
);

CREATE TABLE pets (
    pet_id SERIAL PRIMARY KEY,
    pet_type_id INT,
    pet_name VARCHAR,
    pet_breed_id INT,
    pet_category_id INT,
    FOREIGN KEY (pet_type_id) REFERENCES pet_types(pet_type_id),
    FOREIGN KEY (pet_breed_id) REFERENCES pet_breeds(pet_breed_id),
    FOREIGN KEY (pet_category_id) REFERENCES pet_categories(pet_category_id)
);  

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_first_name VARCHAR,
    customer_last_name VARCHAR,
    customer_age INT,
    customer_email VARCHAR,
    customer_country_id INT,
    customer_postal_code VARCHAR,
    customer_pet_id INT,
    FOREIGN KEY (customer_country_id) REFERENCES countries(country_id),
    FOREIGN KEY (customer_pet_id) REFERENCES pets(pet_id)
);

CREATE TABLE sellers (
    seller_id SERIAL PRIMARY KEY,
    seller_first_name VARCHAR,
    seller_last_name VARCHAR,
    seller_email VARCHAR,
    seller_country_id INT,
    seller_postal_code VARCHAR,
    FOREIGN KEY (seller_country_id) REFERENCES countries(country_id)
);

CREATE TABLE stores (
    store_id SERIAL PRIMARY KEY,
    store_name VARCHAR,
    store_location VARCHAR,
    store_city_id INT,
    store_state VARCHAR,
    store_country_id INT,
    store_phone VARCHAR,
    store_email VARCHAR,
    FOREIGN KEY (store_city_id) REFERENCES cities(city_id),
    FOREIGN KEY (store_country_id) REFERENCES countries(country_id)
); 

CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR,
    supplier_contact VARCHAR,
    supplier_email VARCHAR,
    supplier_phone VARCHAR,
    supplier_address VARCHAR,
    supplier_city_id INT,
    supplier_country_id INT,
    FOREIGN KEY (supplier_city_id) REFERENCES cities(city_id),
    FOREIGN KEY (supplier_country_id) REFERENCES countries(country_id)
);

CREATE TABLE product_names (
    product_name_id SERIAL PRIMARY KEY,
    product_name VARCHAR UNIQUE
);

CREATE TABLE product_categories (
    product_category_id SERIAL PRIMARY KEY,
    product_category_name VARCHAR UNIQUE
);

CREATE TABLE product_colors (
    product_color_id SERIAL PRIMARY KEY,
    product_color_name VARCHAR UNIQUE
);

CREATE TABLE product_sizes (
    product_size_id SERIAL PRIMARY KEY,
    product_size_name VARCHAR UNIQUE
);

CREATE TABLE product_brands (
    product_brand_id SERIAL PRIMARY KEY,
    product_brand_name VARCHAR UNIQUE
);

CREATE TABLE product_materials (
    product_material_id SERIAL PRIMARY KEY,
    product_material_name VARCHAR UNIQUE
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name_id INT,
    product_category_id INT,
    product_price DECIMAL,
    product_quantity INT,
    product_weight DECIMAL,
    product_color_id INT,
    product_size_id INT,
    product_brand_id INT,
    product_material_id INT,
    product_description TEXT,
    product_rating DECIMAL,
    product_reviews INT,
    product_release_date_id INT,
    product_expiry_date_id INT, 
    product_supplier_id INT,
    FOREIGN KEY (product_name_id) REFERENCES product_names(product_name_id),
    FOREIGN KEY (product_category_id) REFERENCES product_categories(product_category_id),
    FOREIGN KEY (product_color_id) REFERENCES product_colors(product_color_id),
    FOREIGN KEY (product_size_id) REFERENCES product_sizes(product_size_id),
    FOREIGN KEY (product_brand_id) REFERENCES product_brands(product_brand_id),
    FOREIGN KEY (product_material_id) REFERENCES product_materials(product_material_id),
    FOREIGN KEY (product_release_date_id) REFERENCES dates(date_id),
    FOREIGN KEY (product_expiry_date_id) REFERENCES dates(date_id),
    FOREIGN KEY (product_supplier_id) REFERENCES suppliers(supplier_id)
);

CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    sale_date_id INT,
    sale_customer_id INT,
    sale_seller_id INT,
    sale_product_id INT,
    sale_store_id INT,
    sale_quantity INT,
    sale_total_price DECIMAL,
    FOREIGN KEY (sale_date_id) REFERENCES dates(date_id),
    FOREIGN KEY (sale_customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sale_seller_id) REFERENCES sellers(seller_id),
    FOREIGN KEY (sale_product_id) REFERENCES products(product_id),
    FOREIGN KEY (sale_store_id) REFERENCES stores(store_id)
);