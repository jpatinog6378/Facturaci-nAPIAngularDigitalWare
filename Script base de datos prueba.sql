CREATE TABLE PRODUCT (
    product_id int IDENTITY(1,1) NOT NULL,
    name varchar(100) NOT NULL,
    brand varchar(100) NOT NULL,
    price decimal(18,3) NOT NULL,
    PRIMARY KEY (product_id)
); 

CREATE TABLE CLIENT (
	client_id int IDENTITY(1,1) NOT NULL,
	first_name varchar(100) NOT NULL,
	last_name varchar(100) NOT NULL,
	document_type varchar(100) NOT NULL,
	document_number int NOT NULL,
	phone int NOT NULL,
	address varchar (50) NOT NULL,
	email varchar (30) NOT NULL
	PRIMARY KEY (client_id)
);

CREATE TABLE INVENTARY (
	inventary_id int IDENTITY(1,1) NOT NULL,
	quantity int NOT NULL,
	PRIMARY KEY (inventary_id),
	product_id int FOREIGN KEY REFERENCES PRODUCT(product_id)
);


CREATE TABLE SALE (
	sale_id int IDENTITY(1,1) NOT NULL,
	sell_date date NOT NULL,
    quantity_sell int,
    PRIMARY KEY (sale_id),
	product_id int FOREIGN KEY REFERENCES PRODUCT(product_id),
	client_id int FOREIGN KEY REFERENCES CLIENT(client_id)
);

INSERT INTO PRODUCT (name, brand, price) VALUES ('Playstation 5', 'Sony', 4500000.000); 
INSERT INTO PRODUCT (name, brand, price)  VALUES ('Xbox series s', 'Microsoft', 1500000.000);
INSERT INTO PRODUCT (name, brand, price)  VALUES ('Nintendo Switch', 'Nintendo', 1500000.000);
INSERT INTO PRODUCT (name, brand, price) VALUES  ('PSP', 'Sony', 800000.000);
INSERT INTO PRODUCT (name, brand, price)  VALUES ('Control de PS5', 'Sony', 400000.000);
INSERT INTO PRODUCT (name, brand, price)  VALUES ('Audifonos de PS5', 'Sony',400000.000 );
INSERT INTO PRODUCT (name, brand, price) VALUES  ('Monitor de 120 Hz', 'Samsung', 1500000.000);
INSERT INTO PRODUCT (name, brand, price)  VALUES ( 'Pilas Recargables', 'Duracell', 50000.000);
INSERT INTO PRODUCT (name, brand, price) VALUES  ( 'Disco duro 1TB', 'Adata', 200000.000);
INSERT INTO PRODUCT (name, brand, price)  VALUES ( 'Xbox series X', 'Microsoft', 4500000.000);

INSERT INTO INVENTARY(quantity, product_id)  VALUES ( 10, 1);
INSERT INTO INVENTARY(quantity, product_id)  VALUES ( 5, 2);
INSERT INTO INVENTARY(quantity, product_id)  VALUES ( 40, 3);
INSERT INTO INVENTARY(quantity, product_id)  VALUES ( 65, 4);
INSERT INTO INVENTARY(quantity, product_id)  VALUES ( 75, 5);
INSERT INTO INVENTARY(quantity, product_id)  VALUES ( 43, 6);
INSERT INTO INVENTARY(quantity, product_id)  VALUES ( 98, 7);
INSERT INTO INVENTARY(quantity, product_id)  VALUES ( 126, 8);
INSERT INTO INVENTARY(quantity, product_id)  VALUES ( 87, 9);
INSERT INTO INVENTARY(quantity, product_id)  VALUES ( 23, 10);

select * from INVENTARY;

--Obtener la lista de precios de todos los productos

select product_id,name,price from dbo.PRODUCT;

--Obtener la lista de productos cuya existencia en el inventario haya llegado al mínimo permitido (5 unidades)

select p.*,i.quantity from dbo.PRODUCT p inner join INVENTARY i on i.product_id = p.product_id where i.quantity <= 5;

INSERT INTO INVENTARY(quantity, product_id)  VALUES ( 10, 1);

--hacer la consulta de todos los productos vendidos cuya cantidad sea mayor a 10 unidades id del producto, nombre del producto, precio, cantidades vendidas, (si se le mide) el nombre completo del cliente que compró (si no ) solo el client_id


set identity_insert PRODUCT on;