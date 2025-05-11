
-- Create products table
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    image VARCHAR(255),
    category VARCHAR(100)
);

-- Create orders table
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    customer_email VARCHAR(255) NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create order_items table
CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Insert sample products
INSERT INTO products (name, description, price, image, category) VALUES
('Notebook A5', 'Spiral-bound A5 notebook with 100 pages.', 2.99, 'notebook_a5.jpg', 'Notebooks'),
('Ballpoint Pen', 'Blue ink ballpoint pen.', 0.99, 'pen_blue.jpg', 'Pens'),
('Backpack', 'Durable backpack with multiple compartments.', 19.99, 'backpack.jpg', 'Bags'),
('Highlighter Set', 'Pack of 4 highlighters in assorted colors.', 3.49, 'highlighters.jpg', 'Stationery'),
('Graph Paper Pad', 'A4 graph paper, 50 sheets.', 1.99, 'graph_pad.jpg', 'Notebooks');

-- Insert sample orders
INSERT INTO orders (customer_name, customer_email, total_price) VALUES
('Maria Papadopoulou', 'maria@example.com', 5.97),
('Giorgos Nikolaou', 'giorgos@example.com', 21.98);

-- Insert sample order_items
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),  -- Notebook A5
(1, 2, 3),  -- 3 Ballpoint Pens
(2, 3, 1),  -- 1 Backpack
(2, 4, 1);  -- 1 Highlighter Set
