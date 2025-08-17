-- Create the database
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- Use the newly created database
USE alx_book_store;

-- Create the Authors table
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- Create the Books table
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Create the Customers table
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE,
    address TEXT NOT NULL
);

-- Create the Orders table
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create the Order_Details table
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Insert sample data into Authors table
INSERT INTO Authors (author_name) VALUES
('J.K. Rowling'),
('George R. R. Martin'),
('J.R.R. Tolkien'),
('Agatha Christie');

-- Insert sample data into Books table
INSERT INTO Books (title, author_id, price, publication_date) VALUES
('Harry Potter and the Sorcerer''s Stone', 1, 19.99, '1997-06-26'),
('A Game of Thrones', 2, 29.99, '1996-08-06'),
('The Hobbit', 3, 14.99, '1937-09-21'),
('Murder on the Orient Express', 4, 9.99, '1934-01-01');

-- Insert sample data into Customers table
INSERT INTO Customers (customer_name, email, address) VALUES
('John Doe', 'john.doe@example.com', '123 Elm Street, Some City, Some Country'),
('Jane Smith', 'jane.smith@example.com', '456 Oak Avenue, Another City, Another Country');

-- Insert sample data into Orders table
INSERT INTO Orders (customer_id, order_date) VALUES
(1, '2025-08-15'),
(2, '2025-08-16');

-- Insert sample data into Order_Details table
INSERT INTO Order_Details (order_id, book_id, quantity) VALUES
(1, 1, 2), -- John Doe ordered 2 copies of "Harry Potter and the Sorcerer's Stone"
(1, 3, 1), -- John Doe ordered 1 copy of "The Hobbit"
(2, 2, 3); -- Jane Smith ordered 3 copies of "A Game of Thrones"

-- End of script
