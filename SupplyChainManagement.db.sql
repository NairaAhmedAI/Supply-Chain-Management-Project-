-- Suppliers Table
CREATE TABLE Suppliers (
    supplier_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    contact_info TEXT
);

-- Products Table
CREATE TABLE Products (
    product_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    category TEXT,
  
  
  INSERT INTO Suppliers (supplier_id, name, contact_info) VALUES
(1, 'Supplier A', 'contact@supplierA.com'),
(2, 'Supplier B', 'contact@supplierB.com');

INSERT INTO Products (product_id, name, category, supplier_id) VALUES
(1, 'Laptop', 'Electronics', 1),
(2, 'Smartphone', 'Electronics', 2);

INSERT INTO Warehouses (warehouse_id, location) VALUES
(1, 'Cairo'),
(2, 'Alexandria');

INSERT INTO Inventory (warehouse_id, product_id, quantity) VALUES
(1, 1, 100),
(1, 2, 50),
(2, 1, 200);

INSERT INTO Shipments (shipment_id, product_id, from_warehouse, to_warehouse, date, quantity) VALUES
(1, 1, 1, 2, '2024-03-20', 50),
(2, 2, 1, 2, '2024-03-21', 30);
  
  
  SELECT 
    w.location AS warehouse_location,
    p.name AS product_name,
    i.quantity AS stock_quantity
FROM Warehouses w
JOIN Inventory i ON w.warehouse_id = i.warehouse_id
JOIN Products p ON i.product_id = p.product_id;

  
  SELECT 
    s.shipment_id,
    p.name AS product_name,
    s.quantity,
    w1.location AS from_warehouse,
    w2.location AS to_warehouse
FROM Shipments s
JOIN Products p ON s.product_id = p.product_id
JOIN Warehouses w1 ON s.from_warehouse = w1.warehouse_id
JOIN Warehouses w2 ON s.to_warehouse = w2.warehouse_id
ORDER BY s.quantity DESC LIMIT 1;

  
  SELECT 
    w.location AS warehouse_location,
    COUNT(s.shipment_id) AS shipment_count
FROM Warehouses w
LEFT JOIN Shipments s ON w.warehouse_id = s.from_warehouse
GROUP BY w.warehouse_id;


    supplier_id INTEGER,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

-- Warehouses Table
CREATE TABLE Warehouses (
    warehouse_id INTEGER PRIMARY KEY,
    location TEXT
);

-- Inventory Table
CREATE TABLE Inventory (
    warehouse_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    FOREIGN KEY (warehouse_id) REFERENCES Warehouses(warehouse_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Shipments Table
CREATE TABLE Shipments (
    shipment_id INTEGER PRIMARY KEY,
    product_id INTEGER,
    from_warehouse INTEGER,
    to_warehouse INTEGER,
    date DATE,
    quantity INTEGER,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (from_warehouse) REFERENCES Warehouses(warehouse_id),
    FOREIGN KEY (to_warehouse) REFERENCES Warehouses(warehouse_id)
);
