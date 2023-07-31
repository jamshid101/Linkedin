create table company_position
(
    company_id  integer
        references company,
    position_id integer
        references position
);

alter table company_position
    owner to postgres;

