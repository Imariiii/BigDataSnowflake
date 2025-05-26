CREATE TABLE pets (
    pet_id INT PRIMARY KEY,
    pet_type VARCHAR,
    pet_name VARCHAR,
    pet_breed VARCHAR,
    pet_category VARCHAR
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_first_name VARCHAR,
    customer_last_name VARCHAR,
    customer_age INT,
    customer_email VARCHAR,
    customer_country VARCHAR,
    customer_postal_code VARCHAR,
    customer_pet_id INT,
    FOREIGN KEY (customer_pet_id) REFERENCES pets(pet_id)
);

CREATE TABLE sellers (
    seller_id INT PRIMARY KEY,
    seller_first_name VARCHAR,
    seller_last_name VARCHAR,
    seller_email VARCHAR,
    seller_country VARCHAR,
    seller_postal_code VARCHAR
);

CREATE TABLE stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR,
    store_location VARCHAR,
    store_city VARCHAR,
    store_state VARCHAR,
    store_country VARCHAR,
    store_phone VARCHAR,
    store_email VARCHAR
); 

CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR,
    supplier_contact VARCHAR,
    supplier_email VARCHAR,
    supplier_phone VARCHAR,
    supplier_address VARCHAR,
    supplier_city VARCHAR,
    supplier_country VARCHAR
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR,
    product_category VARCHAR,
    product_price DECIMAL,
    product_quantity INT,
    product_weight DECIMAL,
    product_color VARCHAR,
    product_size VARCHAR,
    product_brand VARCHAR,
    product_material VARCHAR,
    product_description TEXT,
    product_rating DECIMAL,
    product_reviews INT,
    product_release_date DATE,
    product_expiry_date DATE, 
    product_supplier_id INT,
    FOREIGN KEY (product_supplier_id) REFERENCES suppliers(supplier_id)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    sale_customer_id INT,
    sale_seller_id INT,
    sale_product_id INT,
    sale_store_id INT,
    sale_quantity INT,
    sale_total_price DECIMAL,
    FOREIGN KEY (sale_customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sale_seller_id) REFERENCES sellers(seller_id),
    FOREIGN KEY (sale_product_id) REFERENCES products(product_id),
    FOREIGN KEY (sale_store_id) REFERENCES stores(store_id)
);