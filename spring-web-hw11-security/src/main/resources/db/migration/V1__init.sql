create table users (
  id                    bigserial,
  username              varchar(30) not null unique,
  password              varchar(80) not null,
  email                 varchar(50) unique,
  primary key (id)
);

create table roles (
  id                    serial,
  name                  varchar(50) not null,
  primary key (id)
);

create table authorities (
  id                    serial,
  name                  varchar(50) not null,
  primary key (id)
);

CREATE TABLE users_roles (
  user_id               bigint not null,
  role_id               int not null,
  primary key (user_id, role_id),
  foreign key (user_id) references users (id),
  foreign key (role_id) references roles (id)
);

CREATE TABLE users_authorities (
  user_id               bigint not null,
  authority_id               int not null,
  primary key (user_id, authority_id),
  foreign key (user_id) references users (id),
  foreign key (authority_id) references authorities (id)
);

CREATE TABLE roles_authorities (
  id                    serial,
  authority_id          int not null,
  role_id               int not null,
  primary key (id),
  foreign key (authority_id) references authorities (id),
  foreign key (role_id) references roles (id)
);



insert into roles (name)
values
('ROLE_USER'), ('ROLE_ADMIN'), ('ROLE_SUPERADMIN');

insert into authorities (name)
values
('READ_ALL_ADMIN'), ('READ_ALL_USER'), ('READ_SECRET');


insert into users (username, password, email)
values
('user', '$2a$04$Fx/SX9.BAvtPlMyIIqqFx.hLY2Xp8nnhpzvEEVINvVpwIPbA3v/.i', 'user@gmail.com'),
('admin', '$2a$12$RlRgScD3pN8tikiXufBEdOvb4niX2b1Fs6lu48dXa50TkIuB5MWEa', 'admin@gmail.com'),
('superAdmin', '$2a$12$u01kh38MXTa58Uqf8f3U8eK3PuxuwVLixjX5MaxoUUq7h3Ut9Wmjy', 'superadmin@gmail.com');


insert into users_roles (user_id, role_id)
values
(1, 1),
(2, 2),
(3, 3);

--insert into users_authorities (user_id, authority_id)
--values
--(1, 2),
--(2, 1),
--(3, 3);

insert into roles_authorities (role_id, authority_id)
values
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(3, 3);



