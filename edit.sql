create or replace function eidt_post(
    i_id int,
    i_context text default null,
    i_photo varchar default null,
    i_date date default null
)
    returns boolean
    language plpgsql
as
$$
declare
BEGIN
    if i_context is not null then
UPDATE post
SET context = i_context
WHERE id = i_id;
end if;
    if i_photo is not null then
UPDATE post
SET photo = i_photo
WHERE id = i_id;
end if;
    if i_date is not null then
UPDATE post
SET date = i_date
WHERE id = i_id;
end if;
return true;
end
$$;



create or replace function eidt_comment(
    i_id int,
    i_text varchar default null,
    i_date varchar default null
)
    returns boolean
    language plpgsql
as
$$
declare
BEGIN
    if i_date is not null then
UPDATE comment
SET date = i_date
WHERE id = i_id;
end if;
    if i_text is not null then
UPDATE comment
SET text = i_text
WHERE id = i_id;
end if;
return true;
end
$$;


create or replace function eidt_user(
    i_id int,
    i_first_name varchar default null,
    i_last_name varchar default null,
    i_email varchar default null,
    i_password varchar default null,
    i_photo varchar default null
)
    returns boolean
    language plpgsql
as
$$
declare
BEGIN
    if i_first_name is not null then
UPDATE user
SET first_name = i_first_name
WHERE id = i_id;
end if;
    if i_last_name is not null then
UPDATE user
SET last_name = i_last_name
WHERE id = i_id;
end if;
    if i_email is not null then
UPDATE user
SET email = i_email
WHERE id = i_id;
end if;
    if i_password is not null then
UPDATE user
SET password = i_password
WHERE id = i_id;
end if;
    if i_photo is not null then
UPDATE user
SET photo = i_photo
WHERE id = i_id;
end if;
return true;
end
$$;
create or replace function eidt_experience(
    i_id int,
    i_start_date varchar default null,
    i_end_date varchar default null,
)
    returns boolean
    language plpgsql
as
$$
declare
BEGIN
    if i_start_date is not null then
UPDATE user
SET start_date = i_start_date
WHERE id = i_id;
end if;
    if i_end_date is not null then
UPDATE user
SET end_date = i_end_date
WHERE id = i_id;
end if;
return true;
end
$$;

create or replace function eidt_company(
    i_id int,
    i_name varchar default null,
    i_location varchar default null,
)
    returns boolean
    language plpgsql
as
$$
declare
BEGIN
    if i_name is not null then
UPDATE company
SET name = i_name
WHERE id = i_id;
end if;
    if i_location is not null then
UPDATE company
SET location = i_location
WHERE id = i_id;
end if;
return true;
end
$$;