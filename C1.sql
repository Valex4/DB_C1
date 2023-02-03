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
CREATE TABLE roles(
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
    price FLOAT(0.5),
    octane INTEGER(5),
    stock  INT,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_at  TIMESTAMP default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY(id)
);

create table role_permissions (
    id INT NOT NULL AUTO_INCREMENT,
    id_user int not null,
    id_role INT NOT NULL,
    id_permission INT NOT NULL,
    PRIMARY KEY(id),
    Foreign Key (id_user) REFERENCES users(id) on delete cascade on update cascade,
    Foreign Key (id_role) REFERENCES roles(id) on delete cascade on update cascade,
    Foreign Key (id_permission) REFERENCES permissions(id) on delete cascade on update cascade

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
create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
update_at  TIMESTAMP default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
PRIMARY KEY (Id),
Foreign Key (id_service_station) REFERENCES service_stations (id) on delete cascade on update cascade,
Foreign Key (id_gas) REFERENCES gases(id) on delete cascade on update cascade
);

create table users(
    id int NOT NULL AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    email VARCHAR(30) NOT NULL UNIQUE,
    phone VARCHAR(10) NOT NULL UNIQUE,
    id_city INT NOT NULL,
    id_wallet int not null,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_at TIMESTAMP default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (id_city) REFERENCES cities(id) ON UPDATE CASCADE ON DELETE CASCADE,
     FOREIGN KEY (id_wallet) REFERENCES wallets(id) ON UPDATE CASCADE ON DELETE CASCADE
);

show tables;
select * from permissions;

insert into permissions (name) values ("vista1");
insert into permissions (name) values ("vista2");
insert into permissions (name) values ("vista3");
insert into permissions (name) values ("vista4");
insert into permissions (name) values ("vista5");
insert into permissions (name) values ("vista6");
insert into permissions (name) values ("edicion1");
insert into permissions (name) values ("edicion2");
insert into permissions (name) values ("edicion3");
insert into permissions (name) values ("edicion4");

select * from permissions;
select * from roles;
select * from role_permissions;

insert into roles (name) values ("administrador");
insert into roles (name) values ("usuario");

INSERT INTO `db_equipo31`.`countries` (`name`, `continent`) VALUES ('Mexico', 'American');
INSERT INTO `db_equipo31`.`cities` (`name`, `postal_code`, `id_country`) VALUES ('Monterrey', '29088', '1');
INSERT INTO `db_equipo31`.`companies` (`name`, `phone`, `email`) VALUES ('Pemex', '9617483926', 'pemex@gmail.com');
INSERT INTO `db_equipo31`.`companies` (`name`, `phone`, `email`) VALUES ('Pemex', '9617483926', 'pemex@gmail.com');
INSERT INTO `db_equipo31`.`service_stations` (`name`, `location`, `id_type_of_gas`, `id_company`) VALUES ('Suchiapa station', 'suchiapa', '1', '1');



INSERT INTO `db_equipo32`.`role_permissions` (`id_role`, `id_permission`) VALUES ('2', '1');
INSERT INTO `db_equipo32`.`role_permissions` (`id_role`, `id_permission`) VALUES ('2', '2');
INSERT INTO `db_equipo32`.`role_permissions` (`id_role`, `id_permission`) VALUES ('2', '3');
INSERT INTO `db_equipo32`.`role_permissions` (`id_role`, `id_permission`) VALUES ('2', '4');
INSERT INTO `db_equipo32`.`role_permissions` (`id_role`, `id_permission`) VALUES ('2', '5');
INSERT INTO `db_equipo32`.`role_permissions` (`id_role`, `id_permission`) VALUES ('2', '6');
INSERT INTO `db_equipo32`.`role_permissions` (`id_role`, `id_permission`) VALUES ('1', '7');
INSERT INTO `db_equipo32`.`role_permissions` (`id_role`, `id_permission`) VALUES ('1', '8');
INSERT INTO `db_equipo32`.`role_permissions` (`id_role`, `id_permission`) VALUES ('1', '9');
INSERT INTO `db_equipo32`.`role_permissions` (`id_role`, `id_permission`) VALUES ('1', '10');

INSERT INTO `db_equipo32`.`gases` (`id_type_of_gas`, `amount`, `points_per_liter`) VALUES ('1', '100', '20');


select * from countries;
select * from cities;
select * from type_of_gases;
select * from companies;
select * from gases;
select * from service_stations;
select * from role_permissions;
select * from permissions;
select * from wallets;
select * from users;

drop table type_of_gases;
drop table service_stations;

delete from wallets where id=4;

drop table wallets;

insert into wallets (id_service_station , id_gas , total_points) values (1,1,2000);
select * from users;
INSERT INTO `db_equipo32`.`users` (name , last_name , email , phone , id_city , id_wallet) VALUES ('Roberto', 'guzman', 'roberto@gmail.com', '9617342975', '1', '8');
INSERT INTO `db_equipo32`.`users` (name , last_name , email , phone , id_city , id_wallet) VALUES ('Alonso', 'macias', 'maciaspro@gmail.com', '9616542864', '1', '9');

select * from  roles;

select * from role_permissions;
select * from permissions;
select * from users;


select * from permissions;
select users.name , users.id_role_permissions, permissions.name
from users 
inner join role_permissions on role_permissions.id = users.id_role_permissions
inner join permissions on permissions.id = role_permissions.id where users.name ="alonso";

select * from permissions;

select users.name , permissions.name, roles.name
from users 
inner join role_permissions on role_permissions.id_user = users.id
inner join permissions on permissions.id = role_permissions.id_permission
inner join roles on roles.id = users.id;


select * from permissions;
select * from role_permissions;
select * from wallets;
select * from users;

select users.id_wallet , wallets.total_points, users.name
from users 
inner join wallets on wallets.id = users.id_wallet
inner join gases on gases.id where users.name  LIKE"%O%";

describe users;
alter table users drop foreign key id_role_permissions;
drop table users;
show tables;
drop table role_permissions;
select * from role_permissions;

select * from users;