TRUNCATE TABLE posts RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO posts (title, content, number_of_views, account_id) VALUES ('My first post', 'Hi everyone', 5, 1);
INSERT INTO posts (title, content, number_of_views, account_id) VALUES ('Joes first post', 'Hi from Joe bloggs', 10, 2);