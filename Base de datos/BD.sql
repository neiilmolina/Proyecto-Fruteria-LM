DROP DATABASE FruteriaPractica;
CREATE DATABASE IF NOT EXISTS FruteriaPractica;
Use FruteriaPractica;

Create table if not exists cliente(
	id INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(30),
    apellidos VARCHAR(30),
    dni VARCHAR(8),
    email VARCHAR (45),
    direccion VARCHAR(45),
    telefono VARCHAR(9),
    cuenta_bancaria VARCHAR(26),
    CONSTRAINT PRIMARY KEY (id),
    CONSTRAINT UNIQUE KEY (dni),
    CONSTRAINT UNIQUE KEY (email),
    CONSTRAINT UNIQUE KEY (telefono)
)ENGINE = InnoDB;

Create table if not exists producto(
	id INT AUTO_INCREMENT NOT NULL,
    tipo ENUM ("Fruta", "Verdura", "Fruto seco"),
    nombre VARCHAR(45),
    precio DECIMAL,
    cantidad INT,
    CONSTRAINT PRIMARY KEY (id)
)ENGINE = InnoDB;

Create table if not exists cliente_has_producto(
	producto_id INT,
    cliente_id INT,
    cantidad INT,
    CONSTRAINT FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    CONSTRAINT FOREIGN KEY (producto_id) REFERENCES producto(id)
)ENGINE = InnoDB;

Create table if not exists distribuidor(
	id INT AUTO_INCREMENT NOT NULL, 
	nombre VARCHAR(45),
    direccion VARCHAR (45),
    email VARCHAR(45),
    telefono VARCHAR (9),
    CONSTRAINT PRIMARY KEY (id),
    CONSTRAINT UNIQUE KEY (email),
    CONSTRAINT UNIQUE KEY (telefono)
)ENGINE = InnoDB;

Create table if not exists producto_has_distribuidor(
	producto_id INT,
    distribuidor_id INT,
    cantidad INT,
    CONSTRAINT FOREIGN KEY (distribuidor_id) REFERENCES distribuidor(id),
    CONSTRAINT FOREIGN KEY (producto_id) REFERENCES producto(id)
)ENGINE = InnoDB;

INSERT INTO cliente (id, nombre, apellidos, dni, email, direccion, telefono, cuenta_bancaria) VALUES
(1, "Sergio","Fontán","4506520R", "sergioofontan@gmail.com","Calle Solana de Lopez 27 2do A", "670894312", "ES91 2100 0418 4502 0005 1332"),
(2, "Carlos","Rufiangel","454673E", "carlosrufi98@gmail.com", "Avenida de Europa 11", "667893412", "ES91 3104 0448 4232 1205 4532"),
(3, "Antonio","Carmona","9074356C", "antoniocarmona@gmail.com", "Calle Bernardo de Obregón 13", "623970412", "ES91 3135 0530 1256 3295 8907");

INSERT INTO producto VALUES
(1, "Fruta","Mandarina Clementina", 3.50, 1),
(2, "Fruta","Mangos", 2.95, 2),
(3, "Fruta","Ciruelas President", 2.70, 3),
(4, "Fruta","Naranja Cambria", 2.50, 4),
(5, "Fruta","Peras Blanquilla", 2.50, 5),
(6, "Fruta","Manzana Royal", 2.80, 6),
(7, "Fruta","Manazana Reineta", 3.50, 7),
(8, "Fruta","Kaki", 2.90, 8),
(9, "Fruta","Melocotón Amarillo", 5.80, 9),
(10, "Fruta","Kiwi Zespri", 5.80, 1),
(11, "Fruta","Melones", 1.90, 2),
(12, "Fruta","Piña", 5.80, 3),
(13, "Fruta","Platanos", 3.20, 4),
(14, "Verdura","Judias", 4.85, 5),
(15, "Verdura","Zanahorias", 1.90, 6),
(16, "Verdura","Calabacin", 5.80, 7),
(17, "Verdura","Acelgas", 2.20, 8),
(18, "Verdura","Tomates Raf", 4.90, 9),
(19, "Verdura","Tomate Rojo", 2.80, 1),
(20, "Verdura","Pimiento Rojo", 3.80, 2),
(21, "Verdura","Setas", 3.70, 3),
(22, "Verdura","Champiñón", 4.50, 4),
(23, "Verdura","Cebolla", 4.40, 5),
(24, "Verdura","Patatas", 4.40, 6),
(25, "Fruto seco","Nueces Nacronales", 3.20, 1);

INSERT INTO cliente_has_producto VALUES 
(12, 1, 7),
(14, 2, 1),
(7, 1, 9);

INSERT INTO distribuidor(id, nombre, direccion, email, telefono) VALUES
(1, "Pepe", "Calle Juan Perez 31 2ºB", "pepepatinetes@gmail.com","657987214");

INSERT INTO producto_has_distribuidor VALUES 
(12, 1, 7),
(14, 1, 1),
(7, 1, 9);