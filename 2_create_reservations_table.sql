CREATE TABLE reservations (
    reservation_id VARCHAR(255) PRIMARY KEY,
    reservation_created_date TIMESTAMP WITH TIME ZONE NOT NULL,
    reservation_completed_date TIMESTAMP WITH TIME ZONE NOT NULL,
    reservation_status VARCHAR(50) NOT NULL,
    customer_id VARCHAR(255),
    merchant_id VARCHAR(255) NOT NULL,
    revenue DECIMAL(18, 10),
    marketing_channel VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL
);