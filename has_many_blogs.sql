-- setup / reset of environment

\c bryan;

drop database if exists has_many_blogs;
drop role if exists has_many_user;

-- new user and database

create user has_many_user;

create database has_many_blogs owner has_many_user;

-- connect to the new db as new user

\c has_many_blogs;

-- create tables

create table if not exists users (

  id serial primary key,
  username varchar(90),
  first_name varchar(90) default NULL,
  last_name varchar(90) default NULL,
  created_at timestamp default now(),
  updated_at timestamp default now()

);

create table if not exists posts (

  id serial primary key,
  title varchar(180) default NULL,
  url varchar(510) default NULL,
  content text default NULL,
  created_at timestamp not null default now(),
  updated_at timestamp not null default now(),
  user_id int references users(id)

);

create table if not exists comments (

id serial primary key,
body varchar(510) default NULL,
created_at timestamp not null default now(),
updated_at timestamp not null default now(),
posts_id integer references posts(id),
users_id integer references users(id)

);

-- create table if not exists canon (

-- id serial primary key,
-- user_id int references users(id),
-- post_id int references posts(id),
-- comment_id int references comments(id)

-- );

-- import the blog data

\i ./scripts/blog_data.sql;