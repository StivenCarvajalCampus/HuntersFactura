-- SQLBook: Code
/* Creacion base de datos*/
CREATE DATABASE db_hunter_facture_stiven;
/* que base de datos vamos a usar*/
USE db_hunter_facture_stiven;
/*Creacion de tablas */
CREATE TABLE tb_bill(
    n_bill VARCHAR(25) NOT NULL PRIMARY KEY COMMENT 'NUMERO DE FACTURA' ,
    bill_date DATETIME NOT NULL DEFAULT NOW () COMMENT 'Fecha de la factura'
);
/*Eliminar una tabla especifica*/
DROP TABLE tb_bill; 
CREATE TABLE tb_product (
    id_product INT(25) AUTO_INCREMENT PRIMARY KEY COMMENT 'ID DEL PRODUCTO',
    name_product VARCHAR(35) NOT NULL COMMENT 'Nombre del producto',
    amount INT(25) NOT NULL COMMENT 'Ingrese la cantidad',
    value_product INT(25) NOT NULL COMMENT 'Valor del producto'

); 

DROP TABLE tb_client;
CREATE TABLE tb_client(
    identificacion INT(25) NOT NULL PRIMARY KEY UNIQUE COMMENT 'Identificacion',
    full_name VARCHAR(25) NOT NULL COMMENT 'Ingrese el nombre completo',
    email VARCHAR (35) NOT NULL COMMENT 'Ingrese el correo',
    address VARCHAR(35) NOT NULL COMMENT 'Ingrese Dirección',
    phone INT(35) NOT NULL COMMENT 'Ingrese telefono'
);
CREATE TABLE tb_seller(
    id_seller INT(11) AUTO_INCREMENT PRIMARY KEY UNIQUE COMMENT 'Id vendedor',
    seller VARCHAR(38) NOT NULL COMMENT 'nombre de vendedor'
);
/*Alterando tablas para agregar campos*/
ALTER TABLE tb_bill ADD fk_id_seller INT(11) NOT NULL UNIQUE COMMENT 'VENDEDOR';
ALTER TABLE tb_bill ADD fk_identificacion INT (25) NOT NULL UNIQUE COMMENT 'identificacion cliente';
ALTER TABLE tb_bill ADD fk_id_product INT (25) NOT NULL UNIQUE COMMENT 'identificacion Producto';
/* Alterando tablas para agregar llaves foraneas*/
ALTER TABLE tb_bill ADD CONSTRAINT tb_bill_tb_client_fk FOREIGN KEY (fk_identificacion) REFERENCES tb_client(identificacion);
ALTER TABLE tb_bill ADD CONSTRAINT tb_bill_tb_seller_fk FOREIGN KEY(fk_id_seller) REFERENCES tb_seller(id_seller);
ALTER TABLE tb_bill ADD CONSTRAINT tb_bill_tb_product_fk FOREIGN KEY(fk_id_product) REFERENCES tb_product(id_product);
/*Insertando datos a una tabla especifica*/
INSERT INTO tb_client(identificacion,full_name,email,address,phone) VALUES("1052415785","Stiven Carvajal","stiven@gmail.com","cra1b","310");

SELECT * FROM tb_client WHERE identificacion=1052415785;
SELECT COUNT(*) INTO @TOTAL FROM tb_client;
SELECT @TOTAL;

