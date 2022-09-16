--  create sequence bucket_seq start 1 increment 1;
--  create sequence category_seq start 1 increment 1;
--  create sequence order_details_seq start 1 increment 1;
--  create sequence product_seq start 1 increment 1;
--  create sequence user_seq start 1 increment 1;
--  create table buckets (id int8 not null, user_id int8, primary key (id));
--      create table buckets_product (bucket_id int8 not null, product_id int8 not null);
--      create table categories (id int8 not null, title varchar(255), primary key (id));
--      create table orders (id int8 not null, address varchar(255), created timestamp, status varchar(255), sum numeric(19, 2), updated timestamp, user_id int8, primary key (id));
--     create table orders_details (id int8 not null, amount numeric(19, 2), price numeric(19, 2), order_id int8, product_id int8, details_id int8 not null, primary key (id));
--      create table products (id int8 not null, price numeric(19, 2), title varchar(255), primary key (id));
--      create table products_categories (product_id int8 not null, category_id int8 not null);
--      create table users (id int8 not null, archived boolean not null, email varchar(255), name varchar(255), password varchar(255), role varchar(255), bucket_id int8, primary key (id));
--      alter table if exists orders_details add constraint UK_kk6y3pyhjt6kajomtjbhsoajo unique (details_id);
--      alter table if exists buckets add constraint FKnl0ltaj67xhydcrfbq8401nvj foreign key (user_id) references users;
--      alter table if exists buckets_product add constraint FKic6ur6tnwvwrxpomniehbv383 foreign key (product_id) references products;
--      alter table if exists buckets_product add constraint FKje1rq0ugm3ggvsstdi47ep6we foreign key (bucket_id) references buckets;
--      alter table if exists orders add constraint FK32ql8ubntj5uh44ph9659tiih foreign key (user_id) references users;
--      alter table if exists orders_details add constraint FK5o977kj2vptwo70fu7w7so9fe foreign key (order_id) references orders;
--      alter table if exists orders_details add constraint FKs0r9x49croribb4j6tah648gt foreign key (product_id) references products;
--      alter table if exists orders_details add constraint FKgvp1k7a3ubdboj3yhnawd5m1p foreign key (details_id) references orders_details;
--      alter table if exists products_categories add constraint FKqt6m2o5dly3luqcm00f5t4h2p foreign key (category_id) references categories;
--      alter table if exists products_categories add constraint FKtj1vdea8qwerbjqie4xldl1el foreign key (product_id) references products;
--      alter table if exists users add constraint FK8l2qc4c6gihjdyoch727guci foreign key (bucket_id) references buckets;





--User

DROP SEQUENCE IF EXISTS user_seq;
create sequence user_seq start 1 increment 1;
DROP TABLE IF EXISTS users CASCADE;



create table users (
                       id int8 not null,
                       archived boolean not null,
                       email varchar(255),
                       name varchar(255),
                       password varchar(255),
                       role varchar(255),
                       bucket_id int8,
                       primary key (id)
);
--Bucket
DROP SEQUENCE IF EXISTS bucket_seq;
create sequence bucket_seq start 1 increment 1;
DROP TABLE IF EXISTS bucket CASCADE;


create table buckets (
                         id int8 not null,
                         user_id int8,
                         primary key (id));




--link between bucket and users

alter table if exists buckets
    add constraint buckets_fk_users
    foreign key (user_id) references users;



alter table if exists users
    add constraint users_fk_buckets
    foreign key (bucket_id) references buckets;


--Category
DROP SEQUENCE IF EXISTS category_seq;
create sequence category_seq start 1 increment 1;
DROP TABLE IF EXISTS categories CASCADE;

create table categories (
    id int8 not null,
    title varchar(255),
    primary key (id));











--Products
DROP SEQUENCE IF EXISTS product_seq;
create sequence product_seq start 1 increment 1;
DROP TABLE IF EXISTS products CASCADE;


create table products (
                          id int8 not null,
                          price numeric(19, 2),
                          title varchar(255),
                          primary key (id));

--Products categories

DROP TABLE IF EXISTS products_categories CASCADE;
create table products_categories (
                                     product_id int8 not null,
                                     category_id int8 not null);

alter table if exists products_categories
    add constraint products_categories_fk_categories
    foreign key (category_id) references categories;
alter table if exists products_categories
    add constraint products_categories_fk_products
    foreign key (product_id) references products;





--Bucket product
DROP TABLE IF EXISTS buckets_product CASCADE;
create table buckets_product (
                                 bucket_id int8 not null,
                                 product_id int8 not null);

alter table if exists buckets_product
    add constraint buckets_product_fk_products
    foreign key (product_id) references products;
alter table if exists buckets_product
    add constraint buckets_product_fk_buckets
    foreign key (bucket_id) references buckets;

--Orders
DROP SEQUENCE IF EXISTS order_seq;
create sequence order_seq start 1 increment 1;
DROP TABLE IF EXISTS orders CASCADE;


create table orders (
                        id int8 not null,
                        address varchar(255),
                        created timestamp,
                        status varchar(255), sum numeric(19, 2),
                        updated timestamp,
                        user_id int8,
                        primary key (id));

alter table if exists orders
    add constraint  orders_fk_user
    foreign key (user_id) references users;



--Order details
DROP SEQUENCE IF EXISTS order_details_seq;
create sequence order_details_seq start 1 increment 1;
DROP TABLE IF EXISTS orders_details CASCADE;
create table orders_details (
                                id int8 not null,
                                amount numeric(19, 2),
                                price numeric(19, 2),
                                order_id int8,
                                product_id int8,
                                details_id int8 not null,
                                primary key (id));

-- alter table if exists orders_details
--     add constraint UK_kk6y3pyhjt6kajomtjbhsoajo
--     unique (details_id);

alter table if exists orders_details
    add constraint orders_details_fk_orders
    foreign key (order_id) references orders;
alter table if exists orders_details
    add constraint order_details_fk_product
    foreign key (product_id) references products;












