CREATE DATABASE DB_equipo3;
use DB_equipo3;
create table companies(
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(30) NOT NULL,
phone VARCHAR(10) NOT NULL UNIQUE,
email VARCHAR(25) NOT NULL UNIQUE,
create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
update_at TIMESTAMP default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE countries(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(15) NOT NULL,
    continent VARCHAR(15) NOT NULL,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_at  TIMESTAMP default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE permissions(
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(40) NOT NULL,
create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
update_at  TIMESTAMP default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
PRIMARY KEY (Id)
);


CREATE TABLE gases(
    id INT NOT NULL AUTO_INCREMENT,
    id_type_of_gas INT NOT NULL,
    amount FLOAT(0.5) NOT NULL,
    points_per_liter INT NOT NULL,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_at  TIMESTAMP default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (id_type_of_gas) REFERENCES type_of_gases(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE service_stations(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    location VARCHAR(30) NOT NULL,
    id_type_of_gas INT NOT NULL,
    id_company INT NOT NULL,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_at TIMESTAMP default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (id),
    Foreign Key (id_type_of_gas) REFERENCES type_of_gases(id) on delete cascade on update cascade,
    Foreign Key (id_company) REFERENCES companies(id) on delete cascade on update cascade
);


CREATE TABLE type_of_gases(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(20),
    price FLOAT(0,5),
    octane INTEGER(5),
    stock  INT,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_at  TIMESTAMP default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY(id)
);

create table users(
    id int NOT NULL AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    email VARCHAR(30) NOT NULL UNIQUE,
    phone VARCHAR(10) NOT NULL UNIQUE,
    id_rol INT NOT NULL,
    id_city INT NOT NULL,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_at TIMESTAMP default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (id_rol) REFERENCES roles(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_city) REFERENCES cities(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE roles(
    id INT NOT NULL AUTO_INCREMENT,
    id_permissions INT NOT NULL,
    id_user INT NOT NULL,
    PRIMARY KEY (id),
    Foreign Key (id_permissions) REFERENCES permissions(id) on delete cascade on update cascade,
    Foreign Key (id_user) REFERENCES users(id) on delete cascade on update cascade
  );



create table cities(
id int not null auto_increment,
name varchar(30) not null,
postal_code varchar(10) not null unique,
id_country int not null,
create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
update_at  TIMESTAMP default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
primary key (id),
foreign key (id_country) references countries(id) on delete cascade on update cascade
);


CREATE TABLE wallets(
id INT NOT NULL AUTO_INCREMENT,
id_service_station INT NOT NULL,
id_gas INT NOT NULL,
total_points INT NOT NULL,
date date NOT NULL,
create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
update_at  TIMESTAMP default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
PRIMARY KEY (Id)
Foreign Key (id_service_station) REFERENCES service_stations (id) on delete cascade on update cascade,
Foreign Key (id_gas) REFERENCES gases(id) on delete cascade on update cascade
);