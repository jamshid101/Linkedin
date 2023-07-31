create table position
(
    id   serial
        primary key,
    name varchar not null
        unique
);

alter table position
    owner to postgres;

