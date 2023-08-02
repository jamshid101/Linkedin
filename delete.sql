CREATE OR REPLACE FUNCTION delete_post(
    i_id INT
)
    RETURNS BOOLEAN
    LANGUAGE plpgsql
AS
$$
BEGIN
    if check_id_exists('post', i_id)=false then return false; end if;
DELETE FROM post
WHERE id = i_id;

RETURN TRUE;
EXCEPTION
    WHEN OTHERS THEN
        RETURN FALSE;
END
$$;

CREATE OR REPLACE FUNCTION delete_comment(
    i_id INT
)
    RETURNS BOOLEAN
    LANGUAGE plpgsql
AS
$$
BEGIN
    if check_id_exists('comment', i_id)=false then return false; end if;
DELETE FROM comment
WHERE id = i_id;

RETURN TRUE;
EXCEPTION
    WHEN OTHERS THEN
        RETURN FALSE;
END
$$;

CREATE OR REPLACE FUNCTION delete_user(
    i_id INT
)
    RETURNS BOOLEAN
    LANGUAGE plpgsql
AS
$$
BEGIN
    if check_id_exists('user', i_id)=false then return false; end if;
DELETE FROM "user"
WHERE id = i_id;

RETURN TRUE;
EXCEPTION
    WHEN OTHERS THEN
        RETURN FALSE;
END
$$;

CREATE OR REPLACE FUNCTION delete_experience(
    i_id INT
)
    RETURNS BOOLEAN
    LANGUAGE plpgsql
AS
$$
BEGIN
    if check_id_exists('experience', i_id)=false then return false; end if;
DELETE FROM experience
WHERE id = i_id;

RETURN TRUE;
EXCEPTION
    WHEN OTHERS THEN
        RETURN FALSE;
END
$$;

CREATE OR REPLACE FUNCTION delete_company(
    i_id INT
)
    RETURNS BOOLEAN
    LANGUAGE plpgsql
AS
$$
BEGIN
DELETE FROM company
WHERE id = i_id;

RETURN TRUE;
EXCEPTION
    WHEN OTHERS THEN
        RETURN FALSE;
END
$$;
