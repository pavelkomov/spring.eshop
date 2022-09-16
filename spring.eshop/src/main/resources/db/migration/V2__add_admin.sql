INSERT INTO users (id,name , password, email, role, archived, bucket_id )
VALUES (1, 'admin' ,'pass', 'admin@admin.ru', 'ADMIN', false, null);

ALTER SEQUENCE user_seq RESTART WITH 2;
