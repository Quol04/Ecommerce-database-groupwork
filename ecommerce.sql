CREATE DATABASE ecommerceDB;
USE ecommercedb;

--  1. brand

CREATE TABLE brand (
brand_id  INT PRIMARY KEY AUTO_INCREMENT,
brandName VARCHAR (50)
);

--  2. color

CREATE TABLE color (
Color_id  INT PRIMARY KEY AUTO_INCREMENT,
colorName VARCHAR (50)
);

-- 3. Size_category

CREATE TABLE Size_category (
sizeCategory_id  INT PRIMARY KEY AUTO_INCREMENT,
categoryName VARCHAR (50)
);

-- 4. Product_category

CREATE TABLE Product_category (
productCategory_id  INT PRIMARY KEY AUTO_INCREMENT,
categoryName VARCHAR (50),
catdescription VARCHAR (50)
);

-- 5. Attribute_category

CREATE TABLE Attribute_category (
attributeCategory_id  INT PRIMARY KEY AUTO_INCREMENT,
categoryName VARCHAR (50)
);

-- 6. Attribute_type

CREATE TABLE Attribute_type (
attributeType_id INT PRIMARY KEY AUTO_INCREMENT,
typeName VARCHAR (50)
);

-- 7. Size_option

CREATE TABLE Size_option (
sizeOption_id  INT PRIMARY KEY AUTO_INCREMENT,
label VARCHAR (50),
sizeCategory_id INT,
FOREIGN KEY(sizeCategory_id) REFERENCES size_category (sizeCategory_id)
);

-- 8. product

CREATE TABLE  product (
product_id  INT PRIMARY KEY AUTO_INCREMENT,
productName VARCHAR (50),
basePrice INT,
productCategory_id INT,
brand_id INT,
FOREIGN KEY(productCategory_id) REFERENCES product_category (productCategory_id),
FOREIGN KEY(brand_id) REFERENCES brand (brand_id)
);

-- 9. product_item

CREATE TABLE product_item (
item_id  INT PRIMARY KEY AUTO_INCREMENT,
stockQuantity INT,
product_id INT,
FOREIGN KEY(product_id) REFERENCES product (product_id)
);

-- 10. Product_attribute

CREATE TABLE Product_attribute (
attribute_id  INT PRIMARY KEY AUTO_INCREMENT,
attributeName VARCHAR (50),
attributeValue VARCHAR (50),
product_id INT,
attributeCategory_id INT,
attributeType_id INT,
FOREIGN KEY(product_id) REFERENCES product (product_id),
FOREIGN KEY(attributeCategory_id) REFERENCES attribute_category (attributeCategory_id),
FOREIGN KEY(attributeType_id) REFERENCES attribute_type (attributeType_id)
);

-- 11. product_image

CREATE TABLE  product_image (
image_id INT PRIMARY KEY AUTO_INCREMENT,
imageUrl VARCHAR(100),
item_id   INT,
FOREIGN KEY(item_id  ) REFERENCES product_item (item_id  )
);

-- 12. product_variation

CREATE TABLE  product_variation (
variation_id INT PRIMARY KEY AUTO_INCREMENT,
item_id INT,
color_id INT,
sizeOption_id INT,
FOREIGN KEY(item_id  ) REFERENCES product_item (item_id  ),
FOREIGN KEY(color_id) REFERENCES color (color_id),
FOREIGN KEY(sizeOption_id) REFERENCES size_option (sizeOption_id)
);
