TRUNCATE TABLE accounts RESTART IDENTITY cascade; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO accounts (email, username) VALUES ('hello@world.com', 'helloworld');
INSERT INTO accounts (email, username) VALUES ('joe@bloggs.com', 'joebloggs');