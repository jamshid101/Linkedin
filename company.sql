create table company
(
    id       serial
        primary key,
    name     varchar(100) not null
        unique,
    location text
);

alter table company
    owner to postgres;

