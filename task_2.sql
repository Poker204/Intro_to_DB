-- Step 1: Use the alx_book_store database
USE alx_book_store;

-- Step 2: Create Authors table
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique identifier for each author
    author_name VARCHAR(215) NOT NULL          -- Name of the author (cannot be NULL)
);

-- Step 3: Create Books table
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,    -- Unique identifier for each book
    title VARCHAR(130) NOT NULL,               -- Title of the book (cannot be NULL)
    author_id INT,                             -- Reference to the author of the book
    price DOUBLE NOT NULL,                     -- Price of the book (cannot be NULL)
    publication_date DATE NOT NULL,            -- Publication date of the book
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)  -- Foreign key to Authors table
);

-- Step 4: Create Customers table
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique identifier for each customer
    customer_name VARCHAR(215) NOT NULL,         -- Name of the customer (cannot be NULL)
    email VARCHAR(215) NOT NULL UNIQUE,          -- Email of the customer (must be unique)
    address TEXT NOT NULL                        -- Address of the customer (cannot be NULL)
);

-- Step 5: Create Orders table
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,   -- Unique identifier for each order
    customer_id INT,                           -- Reference to the customer who placed the order
    order_date DATE NOT NULL,                  -- Date when the order was placed
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)  -- Foreign key to Customers table
);

-- Step 6: Create Order_Details table
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,  -- Unique identifier for each order detail
    order_id INT,                                 -- Reference to the order
    book_id INT,                                  -- Reference to the book
    quantity DOUBLE NOT NULL,                     -- Quantity of the book in the order
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),  -- Foreign key to Orders table
    FOREIGN KEY (book_id) REFERENCES Books(book_id)     -- Foreign key to Books table
);
