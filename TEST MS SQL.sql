-- Create Categories table
CREATE TABLE category (  
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Create Products table
CREATE TABLE product (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL
);

-- Create ProductOnCategory table
create table productOnCategory
(
	productId int foreign key REFERENCES product(id),
	categoryId int foreign key REFERENCES category(id),
	primary key(productId, categoryId)
)

-- Insert some test data into Products table
INSERT INTO product (id, name, description, price) VALUES (1, 'Молоко Вятушка', '2.7% жирность, бумажная упаковка', 79.99),
                                                                    (2, 'Сметана Княгинино', '18% жирность', 99.99),
                                                                    (3, 'Пылесос Bosh', 'С 3-мя доп. насадками', 14000.99),
                                                                    (4, 'Чайник Aceline', 'Серебристый 2л', 1239.99),
                                                                    (5, 'Утюг Braun', 'Бело-зеленый', 5909.99),
                                                                    (6, 'Веник для дома Хозяюшка', 'Производство с.Бобино', 189.99);

-- Insert some test data into Categories table
INSERT INTO category (id, name) VALUES (1, 'Молочный продукт'),
                                       (2, 'Бытовая техника'), 
                                       (3, 'Продукт по акции');
                                         
INSERT INTO productOnCategory (productId, categoryId) VALUES (1, 1), (1, 3), (2, 1), (3, 2), (4, 2), (5, 2); 

SELECT all_products.name, category.name 
FROM (SELECT product.id, product.name FROM product) AS all_products
LEFT JOIN productOnCategory on productOnCategory.productId = all_products.id
LEFT JOIN category ON productOnCategory.categoryId = category.id;