create table Skill
(
    id   serial primary key,
    name character varying not null
);

create table user_skill
(
    user_id  int references user (id),
    skill_id int references Skill (id)
);

create table Post
(
    id      serial primary key,
    context text not null,
    photo   character varying,
    date    date not null,
    user_id int references user (id)
);

create table Post_like
(
    user_id int references user (id),
    post_id int references Post (id)
);
-- add
create or replace function add_Skill(i_name character varying)
    returns boolean
    language plpgsql
as
$$
declare
    v_id boolean := null;
BEGIN

    if v_id is false then
        return false;
    elsif v_id is true then
        insert into Skill(name) VALUES (i_name);
        return true;
    end if;
END
$$;

create or replace function add_user_skill(i_user_id int, i_post_id int)
    returns boolean
    language plpgsql
as
$$


BEGIN
    insert into user_skill(user_id, skill_id) VALUES (i_user_id, i_post_id);
    return true;
EXCEPTION
    when others then return false;
END
$$;

create or replace function add_Post(i_context text, i_photo character varying,
                                    i_date date,
                                    i_name_user_id int)
    returns boolean
    language plpgsql
as
$$
declare
    v_id boolean := null;
BEGIN
    select is_post(i_name_user_id) into v_id;
    if v_id is false then
        return false;
    elsif v_id is true then
        insert into Post(context, photo, date, user_id) VALUES (i_context, i_photo, i_date);
        return true;
    end if;
END
$$;
create or replace function is_post(i_user_id int)
    returns boolean
    language plpgsql
as
$$
declare
    v_id int := null;
BEGIN
    select id into v_id from User where id = i_user_id;
    if v_id is null then
        return false;
    end if;
    return true;
END
$$;

create or replace function add_Post_Like(i_user_id int,i_post_id int)
    returns boolean
    language plpgsql
as
$$


BEGIN
    insert into Post_like(user_id, post_id ) VALUES (i_user_id, i_post_id);
    return true;
EXCEPTION
    when others then return false;
END
$$;



