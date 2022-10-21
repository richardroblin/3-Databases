TRUNCATE TABLE recipes RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO recipes (name, average_cooking_time, rating) VALUES ('Tomato Soup', 5, 3);
INSERT INTO recipes (name, average_cooking_time, rating) VALUES ('Pizza', 10, 5);