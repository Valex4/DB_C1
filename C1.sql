CREATE DATABASE DB_equipo3;
use DB_equipo3;
create table users(
    id int NOT NULL AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    email VARCHAR(30) NOT NULL UNIQUE,
    phone VARCHAR(10) NOT NULL UNIQUE,
    id_rol INT NOT NULL,
    id_city INT NOT NULL,
    create_at date NOT NULL,
    update_at DATE NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (id_rol) REFERENCES roles(id),
    FOREIGN KEY (id_city) REFERENCES cities(id)
);

CREATE TABLE roles (
    id INT NOT NULL AUTO_INCREMENT,
    id_permissions INT NOT NULL,
    id_user INT NOT NULL,
    PRIMARY KEY (id)
  )

CREATE TABLE countries(
    Id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(15) NOT NULL,
    continent VARCHAR(15) NOT NULL,
    create_at date NOT NULL,
    update_at  DATE NOT NULL,
    PRIMARY KEY (Id)
);

