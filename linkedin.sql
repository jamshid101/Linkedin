create table users
(
    id         serial primary key,
    first_name varchar,
    last_name  varchar,
    email      varchar unique check ( email ~ '[a-z1-9]{3,}@[a-z]{3,}.[a-z]{3}'),
    password   varchar,
    photo      varchar
);

create table comment
(
    id               serial primary key,
    user_id          int references users (id),
    text             varchar,
    post_id          int references post (id),
    date             date,
    reply_comment_id int references comment (id)
);

create table comment_like
(
    id         serial primary key,
    user_id    int references users (id),
    comment_id int references comment (id)
);
create table connection
(
    user_id     int references users (id),
    follower_id int references users (id)
);


create function add_users(i_first_name varchar, i_last_name varchar,
                          i_email varchar, i_password varchar, i_photo varchar)
    returns boolean
    language plpgsql
as
$$
declare
BEGIN
    insert into users (first_name, last_name, email, password, photo)
    values (i_first_name, i_last_name,
            i_email, i_password, i_photo);
    return true;
EXCEPTION
    when others then return false;
end
$$;

create function add_comment(i_user_id int,
                            i_text varchar,
                            i_post_id int,
                            i_date date,
                            i_reply_comment_id int)
    returns boolean
    language plpgsql
as
$$
BEGIN
    insert into comment(user_id, text, post_id, date, reply_comment_id)
    values (i_user_id, i_text, i_post_id, i_date, i_reply_comment_id);
    return true;
EXCEPTION
    when others then return false;
END
$$;

create function add_connection(i_user_id int, i_follower_id int)
    returns boolean
    language plpgsql
as
$$
BEGIN
    insert into connection(user_id, follower_id) values (i_user_id, i_follower_id);
    return true;
EXCEPTION
    when others then return false;
end
$$;

create function add_comment_like( i_user_id  int, i_comment_id int)
    returns boolean
    language plpgsql
as
$$
BEGIN
    insert into comment_like(user_id, comment_id) values (i_user_id, i_comment_id);
    return true;
EXCEPTION
    when others then return false;
end
$$;
