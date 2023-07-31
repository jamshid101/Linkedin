create table experience
(
    id          serial
        primary key,
    user_id     integer,
    start_date  date,
    end_start   date,
    company_id  integer
        references company,
    position_id integer
        references position
);

alter table experience
    owner to postgres;

