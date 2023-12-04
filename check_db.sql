CREATE DATABASE check_db;
GO

USE check_db;
GO

-- AUTO_INCREMENT (MYSQL) = IDENTITY(1,1) (SQL SERVER)

CREATE TABLE name_dim (
    name_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [name] VARCHAR(100) NOT NULL,
    is_client BIT NOT NULL DEFAULT 1,
    client_name VARCHAR(100) DEFAULT NULL
);
GO

CREATE TABLE bank_dim (
    bank_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    bank_name VARCHAR(100) NOT NULL
);
GO

CREATE TABLE check_dim (
    check_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    check_number INT NOT NULL,
    check_amount FLOAT NOT NULL,
    maturity_date DATE NOT NULL
);
GO

CREATE TABLE dest_dim (
    destination_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    destination_name VARCHAR(100) NOT NULL,
    destination_type VARCHAR(100) NOT NULL,
    destination_complement VARCHAR(100)
);
GO

CREATE TABLE check_fact (
    id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    name_id INT,
    bank_id INT,
    check_id INT,
    destination_id INT,
    current_date DATE NOT NULL,
    FOREIGN KEY (name_id) REFERENCES name_dim (name_id),
    FOREIGN KEY (bank_id) REFERENCES bank_dim (bank_id),
    FOREIGN KEY (check_id) REFERENCES check_dim (check_id),
    FOREIGN KEY (destination_id) REFERENCES dest_dim (destination_id)
);
GO
