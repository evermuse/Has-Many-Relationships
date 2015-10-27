 -- Create a query to get all fields from the users table

select * from users;

-- get all fields from the posts table where the user_id is 100

select * from posts where user_id = '100';

-- get all posts fields, the user's first name, and the user's last name, from the posts table where the user's id is 200

select *, users.first_name, users.last_name
from users
inner join posts
on users.id = user_id
where user_id = '200';

--  get all posts fields, and the user's username, from the posts table where the user's first name is 'Norene' and the user's last_name is 'Schmitt'

select *, users.username
from posts
inner join users
on users.id = user_id
where first_name = 'Norene' AND last_name = 'Schmitt';

-- get usernames from the users table where the user has created a post after January 1, 2015

select username
from users
inner join posts
on users.id = user_id
where posts.created_at > 'January 1, 2015';

--  get the post title, post content, and user's username where the user who created the post joined before January 1, 2015

select posts.title, posts.content, users.username
from posts
inner join users
on users.id = user_id
where users.created_at > 'January 1, 2015';

-- get the all rows in the comments table, showing post title (aliased as 'Post Title'), and the all the comment's fields

select posts.title as Title, *
from comments
inner join posts
on posts.id = posts_id;

-- get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the post was created before January 1, 2015

