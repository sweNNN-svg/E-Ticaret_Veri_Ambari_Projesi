-- Fact Table
ALTER TABLE facttable ALTER COLUMN product_id TYPE VARCHAR(255);
ALTER TABLE facttable ALTER COLUMN customer_id TYPE VARCHAR(255);
ALTER TABLE facttable ALTER COLUMN time_id TYPE VARCHAR(255);
ALTER TABLE facttable ALTER COLUMN payments_id TYPE VARCHAR(255);
ALTER TABLE facttable ALTER COLUMN shipments_id TYPE VARCHAR(255);
ALTER TABLE facttable ALTER COLUMN campaigns_id TYPE VARCHAR(255);

-- Campaigns Table
ALTER TABLE campaigns ALTER COLUMN campaigns_id TYPE VARCHAR(255);
ALTER TABLE campaigns ALTER COLUMN name TYPE VARCHAR(255);

-- Customers Table
ALTER TABLE customers ALTER COLUMN customer_id TYPE VARCHAR(255);
ALTER TABLE customers ALTER COLUMN gender TYPE VARCHAR(255);
ALTER TABLE customers ALTER COLUMN city TYPE VARCHAR(255);
ALTER TABLE customers ALTER COLUMN client_type TYPE VARCHAR(255);

-- Payments Table
ALTER TABLE payments ALTER COLUMN payments_id TYPE VARCHAR(255);
ALTER TABLE payments ALTER COLUMN payment_method TYPE VARCHAR(255);
ALTER TABLE payments ALTER COLUMN payment_status TYPE VARCHAR(255);

-- Products Table
ALTER TABLE products ALTER COLUMN product_id TYPE VARCHAR(255);
ALTER TABLE products ALTER COLUMN product_name TYPE VARCHAR(255);
ALTER TABLE products ALTER COLUMN product_brand TYPE VARCHAR(255);
ALTER TABLE products ALTER COLUMN product_category TYPE VARCHAR(255);

-- Shipments Table
ALTER TABLE shipments ALTER COLUMN shipments_id TYPE VARCHAR(255);
ALTER TABLE shipments ALTER COLUMN carrier TYPE VARCHAR(255);
ALTER TABLE shipments ALTER COLUMN status TYPE VARCHAR(255);

-- Time Table
ALTER TABLE time ALTER COLUMN time_id TYPE VARCHAR(255);

-- unit_price sütununun tipini decimal(10,2) olarak değiştir
ALTER TABLE products ALTER COLUMN unit_price TYPE DECIMAL(10,2);