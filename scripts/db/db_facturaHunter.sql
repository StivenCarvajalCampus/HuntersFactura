-- SQLBook: Code
CREATE DATABASE db_hunter_facture_stiven;
USE db_hunter_facture_stiven;
CREATE TABLE tb_bill(
    n_bill VARCHAR(25) NOT NULL PRIMARY KEY COMMENT 'NUMERO DE FACTURA' ,
    bill_date DATETIME NOT NULL DEFAULT NOW () COMMENT 'Fecha de la factura'
);
DROP TABLE tb_bill; 
CREATE TABLE tb_product (
    id_product INT(25) AUTO_INCREMENT PRIMARY KEY COMMENT 'ID DEL PRODUCTO',
    name_product VARCHAR(35) NOT NULL COMMENT 'Nombre del producto',
    amount INT(25) NOT NULL COMMENT 'Ingrese la cantidad',
    value_product INT(25) NOT NULL COMMENT 'Valor del producto'

); 
CREATE TABLE tb_client(
    identificacion INT(25) NOT NULL PRIMARY KEY UNIQUE COMMENT 'Identificacion',
    full_name VARCHAR(25) NOT NULL COMMENT 'Ingrese el nombre completo',
    email VARCHAR (35) NOT NULL COMMENT 'Ingrese el correo',
    address VARCHAR(35) NOT NULL COMMENT 'Ingrese Dirección',
    phone INT(12) NOT NULL COMMENT 'Ingrese telefono'
);
ALTER TABLE tb_bill ADD fk_identificacion INT (25) NOT NULL UNIQUE COMMENT 'identificacion cliente';
CREATE TABLE tb_seller(
    id_seller INT(11) AUTO_INCREMENT PRIMARY KEY UNIQUE COMMENT 'Id vendedor',
    seller VARCHAR(38) NOT NULL COMMENT 'nombre de vendedor'
);
ALTER TABLE tb_bill ADD CONSTRAINT tb_bill_tb_client_fk FOREIGN KEY (fk_identificacion) REFERENCES tb_client(identificacion);